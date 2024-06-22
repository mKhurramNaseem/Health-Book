// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:health_book/models/laboratory.dart';
import 'package:health_book/models/patient.dart';

class Report {
  final Laboratory laboratoryDetails;
  final DateTime dateTime;
  final Patient patientDetails;
  Report({
    required this.laboratoryDetails,
    required this.dateTime,
    required this.patientDetails,
  });

  Report copyWith({
    Laboratory? laboratoryDetails,
    DateTime? dateTime,
    Patient? patientDetails,
  }) {
    return Report(
      laboratoryDetails: laboratoryDetails ?? this.laboratoryDetails,
      dateTime: dateTime ?? this.dateTime,
      patientDetails: patientDetails ?? this.patientDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'laboratory': laboratoryDetails.toMap(),
      'dateTime': dateTime.millisecondsSinceEpoch,
      'patient': patientDetails.toMap(),
    };
  }

  factory Report.fromMap(Map<String, dynamic> map) {
    return Report(
      laboratoryDetails:
          Laboratory.fromMap(map['laboratory'] as Map<String, dynamic>),
      dateTime: DateTime.fromMillisecondsSinceEpoch(map['dateTime'] as int),
      patientDetails: Patient.fromMap(map['patient'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Report.fromJson(String source) =>
      Report.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Report(laboratory: $laboratoryDetails, dateTime: $dateTime, patient: $patientDetails)';

  @override
  bool operator ==(covariant Report other) {
    if (identical(this, other)) return true;

    return other.laboratoryDetails == laboratoryDetails &&
        other.dateTime == dateTime &&
        other.patientDetails == patientDetails;
  }

  @override
  int get hashCode =>
      laboratoryDetails.hashCode ^ dateTime.hashCode ^ patientDetails.hashCode;
}
