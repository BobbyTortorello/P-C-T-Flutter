//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:p_c_t/main.dart';
import 'package:p_c_t/pet.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class MyPets extends StatelessWidget {
  const MyPets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pets'),
        centerTitle: true,
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addPet');
            },
            child: const Icon(Icons.add),
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
      ),
      body: listView(context),
      bottomSheet: const bottomBar(),
    );
  }
}

class ListViewLayout extends StatelessWidget {
  const ListViewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    loadData();
    return listView(context);
  }
}

List<Pet> myPets = [];
Widget listView(BuildContext context) {
  return ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: myPets.length,
    itemBuilder: (context, i) {
      return ListTile(
        //leading: myPets[i].petImage,
        title: Text(myPets[i].petName),
        subtitle: Text('${myPets[i].petType} - ${myPets[i].petBreed}'),
      );
    },
    separatorBuilder: (context, index) => const Divider(
      color: Colors.grey,
      thickness: 2,
    ),
  );
}

void loadData() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(join(await getDatabasesPath(), 'myPets.db'));

  Future<List<Pet>> pets() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('pets');

    return List.generate(maps.length, (i) {
      myPets.add(Pet(
        petName: maps[i]['name'],
        petType: maps[i]['type'],
        petBreed: maps[i]['breed'],
      ));
      print(
        Pet(
            petName: maps[i]['name'],
            petType: maps[i]['type'],
            petBreed: maps[i]['breed']),
      );
      return Pet(
        petName: maps[i]['name'],
        petType: maps[i]['type'],
        petBreed: maps[i]['breed'],
      );
    });
  }

  print(await pets());
}
