import 'package:flutter/material.dart';

class BodyTextWidget extends StatelessWidget {
  const BodyTextWidget({
    super.key,
    required this.bodyController,
  });

  final TextEditingController bodyController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) return 'title canot be empty';
        return null;
      },
      textAlign: TextAlign.left,
      keyboardType: TextInputType.multiline,
      maxLines: 20,
      controller: bodyController,
      decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          hintText: 'Description'),
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}
