class Pet {
  final String petName;
  final String petType;
  final String petBreed;
  final String petImage;

  Pet({
    required this.petName,
    required this.petType,
    required this.petBreed,
    required this.petImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': petName,
      'type': petType,
      'breed': petBreed,
      'image': petImage,
    };
  }

  @override
  String toString() {
    return 'Pet{name: $petName, type: $petType, breed: $petBreed, image: $petImage}';
  }
}
