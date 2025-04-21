import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoSliderItem extends StatefulWidget {
  final String videoUrl;
  final String? thumbnailUrl;
  final bool play;

  const VideoSliderItem({
    Key? key,
    required this.videoUrl,
    this.thumbnailUrl,
    required this.play,
  }) : super(key: key);

  @override
  State<VideoSliderItem> createState() => _VideoSliderItemState();
}

class _VideoSliderItemState extends State<VideoSliderItem> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _thumbnailFailed = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() => _isInitialized = true);
        _controller.setLooping(false);
        if (widget.play) _controller.play();
        _controller.addListener(() {
          // auto‑replay on finish
          if (_controller.value.position >= _controller.value.duration &&
              !_controller.value.isPlaying) {
            _controller.seekTo(Duration.zero);
            _controller.play();
          }
        });
      }).catchError((e) => debugPrint("Video init error: $e"));
  }

  @override
  void didUpdateWidget(covariant VideoSliderItem old) {
    super.didUpdateWidget(old);
    if (_isInitialized) {
      widget.play ? _controller.play() : _controller.pause();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildThumbnail() {
    if (widget.thumbnailUrl == null || _thumbnailFailed) {
      return Container(color: Colors.black);
    }
    return Image.network(
      widget.thumbnailUrl!,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      loadingBuilder: (_, child, prog) =>
      prog == null ? child : const Center(child: CircularProgressIndicator(color: Colors.white)),
      errorBuilder: (_, __, ___) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!_thumbnailFailed && mounted) setState(() => _thumbnailFailed = true);
        });
        return Container(color: Colors.black);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: _isInitialized ? _controller.value.aspectRatio : 16 / 9,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (_isInitialized)
            VideoPlayer(_controller)
          else
            const Center(child: CircularProgressIndicator()),
          // fade‑out thumbnail when playing
          AnimatedOpacity(
            opacity: !_isInitialized || !_controller.value.isPlaying ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: _buildThumbnail(),
          ),
        ],
      ),
    );
  }
}
