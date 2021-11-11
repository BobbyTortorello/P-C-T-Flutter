class Pet {
  final String petName;
  final String petType;
  final String petBreed;
  //Image petImage;

  Pet({
    required this.petName,
    required this.petType,
    required this.petBreed,
    /*this.petImage*/
  });

  Map<String, dynamic> toMap() {
    return {
      'name': petName,
      'type': petType,
      'breed': petBreed,
    };
  }

  @override
  String toString() {
    return 'Pet{name: $petName, type: $petType, breed: $petBreed}';
  }
}
