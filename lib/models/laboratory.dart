// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:health_book/models/test.dart';

class Laboratory {
  final String name;
  final String logo;
  final double ratings;
  final String address;
  final List<Test> tests;
  Laboratory({
    required this.name,
    required this.logo,
    required this.ratings,
    required this.address,
    required this.tests,
  });

  Laboratory copyWith({
    String? name,
    String? logo,
    double? ratings,
    String? address,
    List<Test>? tests,
  }) {
    return Laboratory(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      ratings: ratings ?? this.ratings,
      address: address ?? this.address,
      tests: tests ?? this.tests,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'logo': logo,
      'ratings': ratings,
      'address': address,
      'tests': tests.map((x) => x.toMap()).toList(),
    };
  }

  factory Laboratory.fromMap(Map<String, dynamic> map) {
    return Laboratory(
      name: map['name'] as String,
      logo: map['logo'] as String,
      ratings: map['ratings'] as double,
      address: map['address'] as String,
      tests: List<Test>.from((map['tests'] as List<int>).map<Test>((x) => Test.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Laboratory.fromJson(String source) => Laboratory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Laboratory(name: $name, logo: $logo, ratings: $ratings, address: $address, tests: $tests)';
  }

  @override
  bool operator ==(covariant Laboratory other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.logo == logo &&
      other.ratings == ratings &&
      other.address == address &&
      listEquals(other.tests, tests);
  }

  @override
  int get hashCode {
    return name.hashCode ^
      logo.hashCode ^
      ratings.hashCode ^
      address.hashCode ^
      tests.hashCode;
  }
}
