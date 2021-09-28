import 'package:flutter/material.dart';

class AddEditScreen extends StatelessWidget {
  const AddEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("Add todos"),
      ),
    );
  }
}
