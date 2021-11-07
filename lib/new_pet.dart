import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPet extends StatelessWidget {
  const AddPet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a New Pet'),
        centerTitle: true,
      ),
      body: const AddPetForm(),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter Pet Name'),
              controller: petNameField,
            ),
            const SizedBox(
              height: 2,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter Pet Type'),
              controller: petTypeField,
            ),
            const SizedBox(
              height: 2,
            ),
            TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter Pet Breed'),
              controller: petBreedField,
            ),
            const SizedBox(
              height: 2,
            ),
            //const PhotoLibrary()
          ],
        ),
      ),
    );
  }
}

// class PhotoLibrary extends StatelessWidget {
//   const PhotoLibrary({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Image.asset(),
//             ElevatedButton(
//               onPressed: () {
//                 showOptions(context);
//               },
//               child: const Text('Enter Pet Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void showOptions(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return Container(
//           height: 100,
//           child: Column(
//             children: <Widget>[
//               const ListTile(
//                 leading: Icon(Icons.photo_camera),
//                 title: Text('Take Picture with Camera'),
//               ),
//               ListTile(
//                 onTap: () {
//                   Navigator.pop(context);
//                   _showPhotoLibrary();
//                 },
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text('Choose from Photo Library'),
//               )
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

// class Photo extends State<
// void _showPhotoLibrary() async {
//   final file = await ImagePicker().getImage(source: ImageSource.gallery);
//   print(file.path);
// }
