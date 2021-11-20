import 'package:flutter/material.dart';
import 'package:p_c_t/myPets/my_pets.dart';
import 'package:p_c_t/pet.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AddPet extends StatelessWidget {
  const AddPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Pet Page',
      theme: ThemeData(),
      home: const AddPetForm(),
    );
  }
}

class AddPetForm extends StatefulWidget {
  const AddPetForm({Key? key}) : super(key: key);

  @override
  AddPetFormState createState() => AddPetFormState();
}

class AddPetFormState extends State<AddPetForm> {
  final petNameField = TextEditingController();
  final petTypeField = TextEditingController();
  final petBreedField = TextEditingController();

  String petName = '';
  String petType = '';
  String petBreed = '';
  String petImagePath = '';
  @override
  void dispose() {
    petNameField.dispose();
    petTypeField.dispose();
    petBreedField.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: () {
            cancelAlertDialog(context);
          },
          child: const Icon(Icons.arrow_back_ios_sharp),
        ),
        title: const Text('Add a New Pet'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Pet Name',
              ),
              controller: petNameField,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Pet Type',
              ),
              controller: petTypeField,
            ),
            const SizedBox(
              height: 15,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Pet Breed',
              ),
              controller: petBreedField,
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                showOptions(context);
              },
              child: const Text('Pick a Pet Picture'),
            ),
            const SizedBox(
              height: 75,
            ),
            ElevatedButton(
              onPressed: () {
                petName = petNameField.text;
                petType = petTypeField.text;
                petBreed = petBreedField.text;
                savePet();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const MyPets()));
              },
              child: const Text('Save Pet Information'),
            ),
          ],
        ),
      ),
    );
  }

  void showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.photo_camera),
              title: Text('Take Picture with Camera'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                //showPhotoLibrary();
              },
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Photo Library'),
            )
          ],
        );
      },
    );
  }

  // void showPhotoLibrary() async {
  //   final imageFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   //print(file.path);
  // }

  void savePet() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(join(await getDatabasesPath(), 'myPets.db'));
    Future<void> insertPet(Pet pet) async {
      final db = await database;
      await db.insert(
        'pets',
        pet.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    var newPet = Pet(petName: petName, petType: petType, petBreed: petBreed);
    await insertPet(newPet);
  }
}

cancelAlertDialog(BuildContext context) {
  Widget yesButton = ElevatedButton(
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const MyPets()));
    },
    child: const Text('Yes'),
  );

  Widget noButton = ElevatedButton(
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop();
    },
    child: const Text('No'),
  );

  AlertDialog alert = AlertDialog(
    title: const Text("Stop Adding Pet?"),
    content: const Text("Are you sure you want to stop adding a new pet?"),
    actions: [yesButton, noButton],
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
