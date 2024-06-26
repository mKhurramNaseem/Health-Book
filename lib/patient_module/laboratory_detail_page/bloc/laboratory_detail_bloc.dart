import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_book/models/test.dart';
import 'package:health_book/patient_module/laboratory_detail_page/bloc/laboratory_detail_events.dart';
import 'package:health_book/patient_module/laboratory_detail_page/bloc/laboratory_detail_states.dart';

class LaboratoryDetailBloc extends Bloc<LaboratoryDetailEvent, LaboratoryDetailState> {

  static const _initialValue = 0.0;
  List<Test> bookedTests = [];

  LaboratoryDetailBloc() : super(const LaboratoryDetailUpdateTotalState(total: _initialValue),) {
    on<LaboratoryDetailBookTestEvent>(_handleBookTestEvent);
    on<LaboratoryDetailRemoveTestEvent>(_handleRemoveTestEvent);
  }

  FutureOr<void> _handleBookTestEvent(LaboratoryDetailBookTestEvent event, Emitter<LaboratoryDetailState> emit) {
    bookedTests.add(event.test);
    final total = bookedTests.fold<double>(_initialValue,(previousValue, element) => previousValue + element.price,);
    emit(LaboratoryDetailUpdateTotalState(total: total));
  }

  bool isBooked(Test test) => bookedTests.contains(test);

  FutureOr<void> _handleRemoveTestEvent(LaboratoryDetailRemoveTestEvent event, Emitter<LaboratoryDetailState> emit) {
    bookedTests.remove(event.test);
    final total = bookedTests.fold<double>(_initialValue,(previousValue, element) => previousValue + element.price,);
    emit(LaboratoryDetailUpdateTotalState(total: total));
  }
}