import 'package:flutter/material.dart';
import 'package:p_c_t/myPets/my_pets.dart';

class MyPet extends StatelessWidget {
  const MyPet(
      {Key? key,
      required this.petName,
      required this.petType,
      required this.petBreed})
      : super(key: key);

  final String petName;
  final String petType;
  final String petBreed;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Pet Page',
      theme: ThemeData(),
      home: MyPetPage(
        petName: petName,
        petType: petType,
        petBreed: petBreed,
      ),
    );
  }
}

class MyPetPage extends StatefulWidget {
  const MyPetPage(
      {Key? key,
      required this.petName,
      required this.petBreed,
      required this.petType})
      : super(key: key);

  final String petName;
  final String petType;
  final String petBreed;

  @override
  MyPetPageState createState() =>
      MyPetPageState(petName: petName, petBreed: petBreed, petType: petType);
}

class MyPetPageState extends State<MyPetPage> {
  MyPetPageState(
      {Key? key,
      required this.petName,
      required this.petBreed,
      required this.petType});

  final String petName;
  final String petType;
  final String petBreed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(petName),
        centerTitle: true,
        leading: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const MyPets()));
          },
          child: const Icon(Icons.arrow_back_ios_sharp),
        ),
      ),
      body: Column(
        children: <Widget>[
          //Sized Box to Move information down a bit
          const SizedBox(
            height: 25.0,
          ),
          //Row Containing Pet Picture and Pet Type/Breed
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.zoom_out,
              ),
              const SizedBox(
                width: 70.0,
                height: 100.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    petType,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: 100.0,
                    height: 40.0,
                  ),
                  Text(
                    petBreed,
                    style: const TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
