import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_api/controller/blocs/post/bloc/post_bloc.dart';
import 'package:posts_api/model/post_model.dart';
import 'package:posts_api/view/add_post/screen_add_post.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.formKey,
    required this.titleController,
    required this.bodyController,
    required this.action,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController bodyController;
  final PostAction action;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 100,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          if (formKey.currentState!.validate()) {
            final post = PostModel(
              userId: 0,
              id: 0,
              title: titleController.text,
              body: bodyController.text,
            );
            action == PostAction.add
                ? context.read<PostBloc>().add(AddPostEvent(post: post))
                : context.read<PostBloc>().add(UpdatePostEvent(post: post));
          }
          Navigator.pop(context);
        },
        child: action == PostAction.add
            ? const Text(
                'Save',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )
            : const Text(
                'Update',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
      ),
    );
  }
}
