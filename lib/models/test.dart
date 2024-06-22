// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Test {
  final String name;
  final String userDescription;
  final double price;
  Test({
    required this.name,
    required this.userDescription,
    required this.price,
  });
  

  Test copyWith({
    String? name,
    String? userDescription,
    double? price,
  }) {
    return Test(
      name: name ?? this.name,
      userDescription: userDescription ?? this.userDescription,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'userDescription': userDescription,
      'price': price,
    };
  }

  factory Test.fromMap(Map<String, dynamic> map) {
    return Test(
      name: map['name'] as String,
      userDescription: map['userDescription'] as String,
      price: map['price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Test.fromJson(String source) => Test.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Test(name: $name, userDescription: $userDescription, price: $price)';

  @override
  bool operator ==(covariant Test other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.userDescription == userDescription &&
      other.price == price;
  }

  @override
  int get hashCode => name.hashCode ^ userDescription.hashCode ^ price.hashCode;
}
