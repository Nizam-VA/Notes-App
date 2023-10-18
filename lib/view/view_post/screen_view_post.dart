import 'package:flutter/material.dart';
import 'package:posts_api/model/post_model.dart';

class ScreenViewPost extends StatelessWidget {
  ScreenViewPost({super.key, required this.post});

  final PostModel post;

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  initText() {
    titleController.text = post.title;
    bodyController.text = post.body;
  }

  @override
  Widget build(BuildContext context) {
    initText();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              readOnly: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: bodyController,
              readOnly: true,
              maxLines: 10,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ],
        ),
      ),
    );
  }
}
