import 'package:flutter/material.dart';
import 'package:posts_api/core/constants.dart';
import 'package:posts_api/model/post_model.dart';
import 'package:posts_api/view/add_post/widgets/body_text.dart';
import 'package:posts_api/view/add_post/widgets/save_button.dart';
import 'package:posts_api/view/add_post/widgets/title_text.dart';

enum PostAction { add, edit }

class ScreenAddPost extends StatelessWidget {
  ScreenAddPost({super.key, required this.action, this.post});

  final PostModel? post;
  final PostAction action;
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  initTextField() {
    titleController.text = post!.title;
    bodyController.text = post!.body;
  }

  @override
  Widget build(BuildContext context) {
    if (action == PostAction.edit) {
      initTextField();
    }
    return Scaffold(
      appBar: AppBar(
        title: action == PostAction.add
            ? const Text('Create Post')
            : const Text('Update post'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  kHeight20,
                  TitleTextWidget(titleController: titleController),
                  kHeight20,
                  BodyTextWidget(bodyController: bodyController),
                  kHeight20,
                  SaveButton(
                    formKey: formKey,
                    titleController: titleController,
                    bodyController: bodyController,
                    action: action,
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
