// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:health_book/models/laboratory.dart';
import 'package:health_book/models/patient.dart';
import 'package:health_book/models/test.dart';

class Booking {
  Patient patientDetails;
  Laboratory laboratoryDetails;
  bool isPending;
  List<Test> tests;
  DateTime dateTime;
  Booking({
    required this.patientDetails,
    required this.laboratoryDetails,
    required this.isPending,
    required this.tests,
    required this.dateTime,
  });
  

  Booking copyWith({
    Patient? patientDetails,
    Laboratory? laboratoryDetails,
    bool? isPending,
    List<Test>? tests,
    DateTime? dateTime,
  }) {
    return Booking(
      patientDetails: patientDetails ?? this.patientDetails,
      laboratoryDetails: laboratoryDetails ?? this.laboratoryDetails,
      isPending: isPending ?? this.isPending,
      tests: tests ?? this.tests,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'patientDetails': patientDetails.toMap(),
      'laboratoryDetails': laboratoryDetails.toMap(),
      'isPending': isPending,
      'tests': tests.map((x) => x.toMap()).toList(),
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }

  factory Booking.fromMap(Map<String, dynamic> map) {
    return Booking(
      patientDetails: Patient.fromMap(map['patientDetails'] as Map<String,dynamic>),
      laboratoryDetails: Laboratory.fromMap(map['laboratoryDetails'] as Map<String,dynamic>),
      isPending: map['isPending'] as bool,
      tests: List<Test>.from((map['tests'] as List<int>).map<Test>((x) => Test.fromMap(x as Map<String,dynamic>),),),
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Booking.fromJson(String source) => Booking.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Booking(patientDetails: $patientDetails, laboratoryDetails: $laboratoryDetails, isPending: $isPending, tests: $tests, dateTime: $dateTime)';
  }

  @override
  bool operator ==(covariant Booking other) {
    if (identical(this, other)) return true;
  
    return 
      other.patientDetails == patientDetails &&
      other.laboratoryDetails == laboratoryDetails &&
      other.isPending == isPending &&
      listEquals(other.tests, tests) &&
      other.dateTime == dateTime;
  }

  @override
  int get hashCode {
    return patientDetails.hashCode ^
      laboratoryDetails.hashCode ^
      isPending.hashCode ^
      tests.hashCode ^
      dateTime.hashCode;
  }
}
