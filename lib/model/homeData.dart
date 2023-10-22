class Animal {
  final int id;
  final String tag;
  final String? image;
  final String dob;
  final double purchaseCost;
  final String status;
  final String sex;
  final String animalType;

  Animal({
    required this.id,
    required this.tag,
    this.image,
    required this.dob,
    required this.purchaseCost,
    required this.status,
    required this.sex,
    required this.animalType,
  });

  factory Animal.fromJson(Map<String, dynamic> json) {
    return Animal(
      id: json['id'],
      tag: json['tag'],
      image: json['image'],
      dob: json['dob'],
      purchaseCost: double.tryParse(json['purchase_cost'].toString()) ?? 0.0,
      status: json['status'],
      sex: json['sex'],
      animalType: json['animal_type'],
    );
  }

  String get age {
    // Calculate age based on 'dob' and return as a string
    // You can adjust this method based on how you want to display the age
    return "Some Age";
  }
}
