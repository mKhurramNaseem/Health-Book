import 'package:flutter/material.dart';
import 'package:health_book/models/test.dart';

@immutable
abstract class LaboratoryDetailEvent{
  const LaboratoryDetailEvent();
}

@immutable
class LaboratoryDetailBookTestEvent extends LaboratoryDetailEvent{
  final Test test;
  const LaboratoryDetailBookTestEvent({required this.test});
}

@immutable
class LaboratoryDetailRemoveTestEvent extends LaboratoryDetailEvent{
  final Test test;
  const LaboratoryDetailRemoveTestEvent({required this.test});
}
