//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:p_c_t/main.dart';
import 'package:p_c_t/myPets/my_pet.dart';
import 'package:p_c_t/myPets/new_pet.dart';
import 'package:p_c_t/pet.dart';

class MyPets extends StatelessWidget {
  const MyPets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Pets Page',
      theme: ThemeData(),
      home: const MyPetsPage(),
    );
  }
}

class MyPetsPage extends StatefulWidget {
  const MyPetsPage({Key? key}) : super(key: key);

  @override
  MyPetsPageState createState() => MyPetsPageState();
}

class MyPetsPageState extends State<MyPetsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Pets'),
        centerTitle: true,
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const AddPet(),
              ));
            },
            child: const Icon(Icons.add),
            style: ElevatedButton.styleFrom(primary: Colors.transparent),
          )
        ],
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
      ),
      body: const ListViewLayout(),
      bottomSheet: const bottomBar(),
    );
  }
}

class ListViewLayout extends StatefulWidget {
  const ListViewLayout({Key? key}) : super(key: key);

  @override
  ListViewState createState() => ListViewState();
}

List<Pet> myPets = [];

class ListViewState extends State<ListViewLayout> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: myPets.length,
      itemBuilder: (context, i) {
        return ListTile(
          //leading: myPets[i].petImage,
          title: Text(myPets[i].petName),
          subtitle: Text('${myPets[i].petType} - ${myPets[i].petBreed}'),
          onTap: () {
            loadPet(
              context,
              myPets[i].petName,
              myPets[i].petType,
              myPets[i].petBreed,
            );
          },
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.grey,
        thickness: 2,
      ),
    );
  }
}

void loadPet(
  BuildContext context,
  String petName,
  String petType,
  String petBreed,
) {
  MyPet(
    petName: petName,
    petBreed: petBreed,
    petType: petType,
  );
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) =>
        MyPet(petName: petName, petBreed: petBreed, petType: petType),
  ));
}
