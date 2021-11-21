// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:p_c_t/lost_pets.dart';
import 'package:p_c_t/myPets/my_pets.dart';
import 'package:p_c_t/myPets/new_pet.dart';
import 'package:p_c_t/pet.dart';
import 'package:p_c_t/settings.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var database = openDatabase(join(await getDatabasesPath(), 'pets.db'),
      onCreate: (db, version) {
    return db.execute(
        'CREATE TABLE my_pets(name TEXT, type TEXT, breed TEXT, image TEXT)');
  }, version: 5);
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
  database = database;
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyPets()));
                },
                child: const Text('My Pets'),
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LostPets()));
                },
                child: const Text('Lost Pets'),
              ),
            ),
            const SizedBox(height: 100),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const Settings()));
                  //deleteData();
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

//Bottom Bar Class
class bottomBar extends StatelessWidget {
  const bottomBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 25,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const MyPets()));
          },
          child: const Text('My Pets'),
          style: ElevatedButton.styleFrom(primary: Colors.transparent),
        ),
        const SizedBox(
          width: 50,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const LostPets()));
          },
          child: const Text('Lost Pets'),
          style: ElevatedButton.styleFrom(primary: Colors.transparent),
        ),
        const SizedBox(
          width: 50,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Settings()));
          },
          child: const Text('Settings'),
          style: ElevatedButton.styleFrom(primary: Colors.transparent),
        ),
      ],
    );
  }
}

//Data Functions
void loadData() async {
  myPets.clear();
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(join(await getDatabasesPath(), 'pets.db'));
  Future<List<Pet>> pets() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('my_pets');

    return List.generate(maps.length, (i) {
      Pet currentPet = Pet(
        petName: maps[i]['name'],
        petType: maps[i]['type'],
        petBreed: maps[i]['breed'],
        petImage: maps[i]['image'],
      );
      myPets.add(currentPet);
      // ignore: avoid_print
      print(currentPet);
      return currentPet;
    });
  }

  await pets();
}

void deleteData() async {
  final database = openDatabase(join(await getDatabasesPath(), 'myPets.db'));
  final db = await database;

  await db.delete('my_pets');
}

void createDB(Database db, int newVersion) async {
  await db.execute(
      "CREATE TABLE pets(name TEXT, type TEXT, breed TEXT, image TEXT)");
}

void updateDB(Database db, int oldVersion, int newVersion) async {
  if (oldVersion < newVersion) {
    db.execute("ALTER TABLE pets ADD COLUMN image TEXT;");
  }
}

initDB() async {
  final database = openDatabase(join(await getDatabasesPath(), 'myPets.db'),
      onCreate: createDB, onUpgrade: updateDB);
  return database;
}
