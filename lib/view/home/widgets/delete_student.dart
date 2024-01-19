import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_api/controller/blocs/post/bloc/post_bloc.dart';

deleteStudent(BuildContext ctx, int id) {
  showDialog(
    context: ctx,
    builder: (ctx) => AlertDialog(
      title: const Text('Delete Student'),
      content: const Text('Are you sure you want to delete this student?'),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.pop(ctx);
          },
        ),
        TextButton(
          child: const Text('Delete'),
          onPressed: () {
            ctx.read<PostBloc>().add(DeletePostEvent(id: id));
            Navigator.pop(ctx);
          },
        ),
      ],
    ),
  );
}
