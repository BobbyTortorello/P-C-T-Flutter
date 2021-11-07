import 'package:flutter/material.dart';
import 'package:p_c_t/pet.dart';

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
              child: const Icon(Icons.add))
        ],
      ),
      body: const ListViewLayout(),
      backgroundColor: Colors.white,
    );
  }
}

class ListViewLayout extends StatelessWidget {
  const ListViewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return listView(context);
  }
}

Widget listView(BuildContext context) {
  List<Pet> myPets = [];

  return ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: myPets.length,
    itemBuilder: (context, i) {
      return ListTile(
        leading: myPets[i].petImage,
        title: Text(myPets[i].petName),
        subtitle: Text(myPets[i].petType + " " + myPets[i].petBreed),
      );
    },
    separatorBuilder: (context, index) => const Divider(
      color: Colors.grey,
      thickness: 2,
    ),
  );
}
