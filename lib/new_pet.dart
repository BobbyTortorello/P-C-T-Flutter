import 'package:flutter/material.dart';

class AddPet extends StatelessWidget {
  const AddPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Pet'),
        centerTitle: true,
      ),
    );
  }
}
