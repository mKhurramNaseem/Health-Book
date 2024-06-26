import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_book/models/patient.dart';
import 'package:health_book/patient_module/bill_detail_page/bloc/bill_detail_events.dart';
import 'package:health_book/patient_module/bill_detail_page/bloc/bill_detail_states.dart';

class BillDetailBloc extends Bloc<BillDetailEvent,BillDetailState>{

  late TextEditingController nameController , ageController , addressController , phoneNoController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isMale = true;
   
  Patient? patient;

  BillDetailBloc():super(BillDetailInitialState()){
    nameController = TextEditingController();
    ageController = TextEditingController();
    addressController = TextEditingController();
    phoneNoController = TextEditingController();
    // Handling Events
    on<PatientDetailAddEvent>(_handleDetailAddEvent);
  }

  FutureOr<void> _handleDetailAddEvent(PatientDetailAddEvent event, Emitter<BillDetailState> emit) {    
    if(formKey.currentState?.validate() ?? false){
      patient = Patient(name: nameController.text, isMale: isMale, age: double.parse(ageController.text), address: addressController.text, phoneNo: phoneNoController.text,);
    emit(BillPatientAddedState(patient: patient!));
    }    
  }

  bool get hasPatient => patient != null;

  @override
  Future<void> close() {
    nameController.dispose();
    ageController.dispose();
    addressController.dispose();
    phoneNoController.dispose();
    return super.close();
  }
}