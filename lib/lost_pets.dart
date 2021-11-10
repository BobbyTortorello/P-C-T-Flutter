import 'package:flutter/material.dart';
import 'package:p_c_t/main.dart';

class LostPets extends StatelessWidget {
  const LostPets({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lost Pets'), centerTitle: true),
      bottomSheet: const bottomBar(),
    );
  }
}
