import 'package:flutter/material.dart';
import 'package:p_c_t/pet.dart';

class MyPets extends StatelessWidget {
  const MyPets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String intendedRoute;
    return MaterialApp(
      theme: ThemeData(
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.black),
        appBarTheme: const AppBarTheme(backgroundColor: Colors.green),
      ),
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: const Text('My Pets'),
      //     centerTitle: true,
      //     actions: <Widget>[
      //       ElevatedButton(
      //         onPressed: () {
      //           Navigator.pushNamed(context, '/addPet');
      //         },
      //         child: const Icon(Icons.add),
      //       )
      //     ],
      //     automaticallyImplyLeading: false,
      //   ),
      //   body: const ListViewLayout(),
      // ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('My Pets'),
            centerTitle: true,
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/addPet');
                },
                child: const Icon(Icons.add),
              )
            ],
            automaticallyImplyLeading: false,
          ),
          body: const ListViewLayout(),
          bottomSheet: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.directions_car),
                text: 'My Pets',
                intendedRoute = '/myPets',
                navigate(context, intendedRoute),
              ),
              Tab(
                icon: Icon(Icons.directions_car),
                text: 'Lost Pets',
                intendedRoute = '/lostPets',
                navigate(context, intendedRoute),
              ),
              Tab(
                icon: Icon(Icons.directions_car),
                text: 'Settings Pets',
                intendedRoute = '/addPets',
                navigate(context, intendedRoute),
              ),
            ],
            onTap: ,
          ),
        ),
      ),
    );
  }

  void navigate(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
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
        //leading: myPets[i].petImage,
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
