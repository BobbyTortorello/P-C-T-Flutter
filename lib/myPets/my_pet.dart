import 'package:flutter/material.dart';
import 'package:p_c_t/main.dart';

class MyPet extends StatelessWidget {
  const MyPet(
      {Key? key,
      required this.petName,
      required this.petBreed,
      required this.petType})
      : super(key: key);

  final String petName;
  final String petType;
  final String petBreed;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(petName),
      ),
      bottomSheet: const bottomBar(),
    );
  }
}
