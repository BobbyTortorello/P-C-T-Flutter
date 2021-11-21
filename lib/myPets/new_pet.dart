// ignore_for_file: unnecessary_null_comparison

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:p_c_t/main.dart';
import 'package:p_c_t/myPets/my_pets.dart';
import 'package:p_c_t/pet.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AddPet extends StatelessWidget {
  const AddPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    loadData();
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
  Image placeholderImage = Image.asset('assets/placeholderImage.jpg');
  String petImage = '';

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
            Image(
              image: placeholderImage.image,
              width: 150,
              height: 150,
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
            ListTile(
              onTap: () {
                Navigator.pop(context);
                imageFromCamera;
              },
              leading: const Icon(Icons.photo_camera),
              title: const Text('Take Picture with Camera'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context);
                imageFromGallery();
              },
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Photo Library'),
            )
          ],
        );
      },
    );
  }

  imageFromCamera() async {
    XFile? image = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );
    String imageFile = image!.path;
    // final Uint8List bytes = imageFile.readAsBytesSync();
    setState(() {
      petImage = imageFile;
      placeholderImage = Image.file(File(imageFile));
    });
  }

  imageFromGallery() async {
    XFile? image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    String imageFile = image!.path;
    // final Uint8List bytes = imageFile.readAsBytesSync();
    setState(() {
      petImage = imageFile;
      placeholderImage = Image.file(File(imageFile));
    });
  }

  void savePet() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
      join(await getDatabasesPath(), 'pets.db'),
    );

    Future<void> insertPet(Pet pet) async {
      final db = await database;
      await db.insert(
        'my_pets',
        pet.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    var newPet = Pet(
      petName: petName,
      petType: petType,
      petBreed: petBreed,
      petImage: petImage,
    );
    await insertPet(newPet);
  }
}

//MARK: Cancel Adding New Pet Dialog
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
    },
  );
}
