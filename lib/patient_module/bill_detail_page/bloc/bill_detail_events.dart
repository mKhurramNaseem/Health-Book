import 'package:flutter/material.dart';

@immutable
abstract class BillDetailEvent{
  const BillDetailEvent();
}

@immutable
class PatientDetailAddEvent extends BillDetailEvent{  
  const PatientDetailAddEvent();
}