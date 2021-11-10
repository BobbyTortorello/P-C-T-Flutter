import 'package:flutter/material.dart';
import 'package:p_c_t/main.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      bottomSheet: const bottomBar(),
    );
  }
}
