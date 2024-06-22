import 'package:flutter/cupertino.dart';
import 'package:health_book/patient_module/bill_detail_page/view/bill_detail_page.dart';
import 'package:health_book/patient_module/home_page/view/home_page.dart';
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
          builder: (context) => const LaboratoryDetailPage(),
          settings: settings,
        ),
      BillDetailPage.pageName => CupertinoPageRoute(
          builder: (context) => const BillDetailPage(),
        ),
      _ => CupertinoPageRoute(
          builder: (context) => const AppErrorPage(), settings: settings),
    };
  }
}
