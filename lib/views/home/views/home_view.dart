import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialdemo/style/dimensions.dart';
import 'package:socialdemo/utils/app_strings.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../controllers/home_controller.dart';
import '../../../widgets/post_actions_widget.dart';
import '../../../widgets/video_slider_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.home,
          style: TextStyle(
            fontSize: Dimensions.fontSize18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        // Wrap your ListView in RefreshIndicator
        return RefreshIndicator(
          onRefresh: controller.fetchPosts,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: controller.posts.length,
            itemBuilder: (context, index) {
              final post = controller.posts[index];

              controller.sliderIndexMap.putIfAbsent(index, () => 0);
              controller.visibleMap.putIfAbsent(index, () => false);

              final mediaItems = <Widget>[];

              if (post.videoUrl != null) {
                mediaItems.add(
                  VisibilityDetector(
                    key: Key('post_video_$index'),
                    onVisibilityChanged: (info) {
                      final visible = info.visibleFraction >= 0.5;
                      controller.setVisible(index, visible);
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT),
                        child: Obx(() {
                          final isActiveSlide = controller.sliderIndexMap[index] == 0;
                          final isVisible = controller.visibleMap[index]!;
                          return VideoSliderItem(
                            videoUrl: post.videoUrl!,
                            thumbnailUrl: post.thumbnailUrl,
                            play: isActiveSlide && isVisible,
                          );
                        }),
                      ),
                    ),
                  ),
                );
              }

              for (var url in post.images) {
                mediaItems.add(
                  Padding(
                    padding: const EdgeInsets.only(top: Dimensions.PADDING_SIZE_DEFAULT),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_DEFAULT),
                      child: Image.network(
                        url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                );
              }

              return Card(
                margin: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.RADIUS_LARGE),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (mediaItems.isNotEmpty)
                      Column(
                        children: [
                          CarouselSlider(
                            items: mediaItems,
                            options: CarouselOptions(
                              height: 250,
                              viewportFraction: 0.9,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              initialPage: 0,
                              onPageChanged: (slideIndex, _) {
                                controller.setSlider(index, slideIndex);
                              },
                            ),
                          ),
                          const SizedBox(height: 8),
                          Obx(() {
                            final current = controller.sliderIndexMap[index]!;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(mediaItems.length, (i) {
                                return Container(
                                  width: 8,
                                  height: 8,
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: current == i ? Colors.blue : Colors.grey,
                                  ),
                                );
                              }),
                            );
                          }),
                        ],
                      ),
                    if (post.description != null)
                      Padding(
                        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
                        child: Text(post.description!),
                      ),
                    const Divider(),
                    PostActionsWidget(postId: post.id),
                  ],
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
