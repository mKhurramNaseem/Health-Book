import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_book/patient_module/bill_detail_page/bloc/bill_detail_bloc.dart';
import 'package:health_book/patient_module/bill_detail_page/view/bill_detail_page.dart';
import 'package:health_book/patient_module/home_page/view/home_page.dart';
import 'package:health_book/patient_module/laboratory_detail_page/bloc/laboratory_detail_bloc.dart';
import 'package:health_book/patient_module/laboratory_detail_page/view/laboratory_detail_page.dart';
import 'package:health_book/utils/error_page.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      HomePage.pageName => CupertinoPageRoute(
          builder: (context) => const HomePage(),
          settings: settings,
        ),
      LaboratoryDetailPage.pageName => CupertinoPageRoute(
          builder: (context) => BlocProvider<LaboratoryDetailBloc>(
              create: (context) => LaboratoryDetailBloc(),
              child: const LaboratoryDetailPage()),
          settings: settings,
        ),
      BillDetailPage.pageName => CupertinoPageRoute(
          builder: (context) => BlocProvider<BillDetailBloc>(create: 
          (context) => BillDetailBloc(),child: const BillDetailPage()),
          settings: settings,
        ),
      _ => CupertinoPageRoute(
          builder: (context) => const AppErrorPage(), settings: settings),
    };
  }
}
