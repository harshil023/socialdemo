import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class PostActionsWidget extends StatefulWidget {
  final String postId;

  const PostActionsWidget({super.key, required this.postId});

  @override
  State<PostActionsWidget> createState() => _PostActionsWidgetState();
}

class _PostActionsWidgetState extends State<PostActionsWidget> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border, color: Colors.red),
          onPressed: () {
            setState(() {
              isLiked = !isLiked;
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.comment, color: Colors.grey),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Comment tapped")),
            );
          },
        ),
        IconButton(
          icon: const Icon(Icons.share, color: Colors.blue),
          onPressed: () {
            Share.share("Check out this home! ID: ${widget.postId}");
          },
        ),
      ],
    );
  }
}
