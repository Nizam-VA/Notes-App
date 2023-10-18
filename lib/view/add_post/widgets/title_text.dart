import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key,
    required this.titleController,
  });

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return 'title canot be empty';
        return null;
      },
      textAlign: TextAlign.left,
      keyboardType: TextInputType.multiline,
      maxLines: 1,
      controller: titleController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: 'Title'),
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
