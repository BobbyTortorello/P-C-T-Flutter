// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:p_c_t/lost_pets.dart';
import 'package:p_c_t/my_pets.dart';
import 'package:p_c_t/new_pet.dart';
import 'package:p_c_t/settings.dart';

void main() async {
  runApp(const PCT());
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const PCT(),
        '/myPets': (context) => const MyPets(),
        '/addPet': (context) => const AddPet(),
        '/lostPets': (context) => const LostPets(),
        '/settings': (context) => const Settings()
      },
    ),
  );
  loadData();
}

class PCT extends StatelessWidget {
  const PCT({Key? key}) : super(key: key);

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
                onPressed: () {
                  Navigator.pushNamed(context, '/lostPets');
                },
                child: const Text('Lost Pets'),
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                child: const Text('Settings'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class bottomBar extends StatelessWidget {
  const bottomBar({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/myPets');
          },
          child: const Text('My Pets'),
          style: ElevatedButton.styleFrom(primary: Colors.transparent),
        ),
        const SizedBox(
          width: 50,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/lostPets');
          },
          child: const Text('Lost Pets'),
          style: ElevatedButton.styleFrom(primary: Colors.transparent),
        ),
        const SizedBox(
          width: 50,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
          child: const Text('Settings'),
          style: ElevatedButton.styleFrom(primary: Colors.transparent),
        ),
      ],
    );
  }
}
