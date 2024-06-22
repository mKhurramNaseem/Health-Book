import 'dart:convert';

class Patient {
  final String name;
  final bool isMale;
  final double age;
  final String address;
  final String phoneNo;    
  Patient({
    required this.name,
    required this.isMale,
    required this.age,
    required this.address,
    required this.phoneNo,
  });

  Patient copyWith({
    String? name,
    bool? isMale,
    double? age,
    String? address,
    String? phoneNo,
  }) {
    return Patient(
      name: name ?? this.name,
      isMale: isMale ?? this.isMale,
      age: age ?? this.age,
      address: address ?? this.address,
      phoneNo: phoneNo ?? this.phoneNo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'isMale': isMale,
      'age': age,
      'address': address,
      'phoneNo': phoneNo,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      name: map['name'] as String,
      isMale: map['isMale'] as bool,
      age: map['age'] as double,
      address: map['address'] as String,
      phoneNo: map['phoneNo'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) => Patient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Patient(name: $name, isMale: $isMale, age: $age, address: $address, phoneNo: $phoneNo)';
  }

  @override
  bool operator ==(covariant Patient other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.isMale == isMale &&
      other.age == age &&
      other.address == address &&
      other.phoneNo == phoneNo;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      isMale.hashCode ^
      age.hashCode ^
      address.hashCode ^
      phoneNo.hashCode;
  }
}
