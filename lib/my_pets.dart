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
      ),
      body: ListViewLayout(),
      backgroundColor: Colors.white,
    );
  }
}

class ListViewLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return listView(context);
  }
}

Widget listView(BuildContext context) {
  final myPets = [Pet];

  return ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: myPets.length,
    itemBuilder: (context, index) {
      return const ListTile(
        leading: Icon(Icons.ac_unit),
        title: Text('myPets[index]'),
        subtitle: Text('data'),
      );
    },
    separatorBuilder: (context, index) => const Divider(
      color: Colors.grey,
      thickness: 2,
    ),
  );
}
