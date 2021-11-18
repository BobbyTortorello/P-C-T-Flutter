import 'package:flutter/material.dart';
import 'package:p_c_t/main.dart';

class LostPets extends StatelessWidget {
  const LostPets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lost Pets Page',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.amber),
        backgroundColor: Colors.grey.shade400,
      ),
      home: const LostPetsPage(),
    );
  }
}

class LostPetsPage extends StatefulWidget {
  const LostPetsPage({Key? key}) : super(key: key);

  @override
  LostPetsPageState createState() => LostPetsPageState();
}

class LostPetsPageState extends State<LostPetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lost Pets'), centerTitle: true),
      bottomSheet: const bottomBar(),
    );
  }
}
