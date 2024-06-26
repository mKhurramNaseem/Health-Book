import 'package:flutter/material.dart';

@immutable
abstract class LaboratoryDetailState{
  const LaboratoryDetailState();
}

@immutable
class LaboratoryDetailUpdateTotalState extends LaboratoryDetailState{
  final double total;
  const LaboratoryDetailUpdateTotalState({required this.total});
}