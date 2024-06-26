
import 'package:flutter/material.dart';
import 'package:health_book/models/patient.dart';

@immutable
abstract class BillDetailState{
  const BillDetailState();
}

@immutable
class BillDetailInitialState extends BillDetailState{}

@immutable
class BillPatientAddedState extends BillDetailState{
  final Patient patient;
  const BillPatientAddedState({required this.patient});
}