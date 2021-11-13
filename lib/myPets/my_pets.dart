//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:p_c_t/main.dart';
import 'package:p_c_t/myPets/my_pet.dart';
import 'package:p_c_t/pet.dart';
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
