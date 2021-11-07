import 'package:flutter/material.dart';
import 'package:p_c_t/my_pets.dart';
import 'package:p_c_t/new_pet.dart';

void main() {
  runApp(const P_C_T());
  runApp(MaterialApp(initialRoute: '/home', routes: {
    '/home': (context) => const P_C_T(),
    '/myPets': (context) => const MyPets(),
    '/addPet': (context) => const AddPet()
  }));
}

class P_C_T extends StatelessWidget {
  const P_C_T({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'P-C-T',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.grey.shade500,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  textStyle: const TextStyle(fontSize: 20)))),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pet Community Tracker'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 300),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/myPets');
                },
                child: const Text('My Pets'),
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Lost Pets'),
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Settings'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
