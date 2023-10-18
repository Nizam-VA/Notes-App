import 'package:flutter/material.dart';
import 'package:posts_api/view/add_post/screen_add_post.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ScreenAddPost(action: PostAction.add)));
        });
  }
}
