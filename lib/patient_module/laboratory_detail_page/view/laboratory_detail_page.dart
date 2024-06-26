import 'package:flutter/material.dart';
import 'package:health_book/models/laboratory.dart';
import 'package:health_book/patient_module/laboratory_detail_page/widgets/laboratory_detail_header_widgets.dart';
import 'package:health_book/patient_module/laboratory_detail_page/widgets/laboratory_detail_tests_listview.dart';
import 'package:health_book/patient_module/laboratory_detail_page/widgets/laboratory_detail_total_button.dart';

class LaboratoryDetailPage extends StatelessWidget {
  static const pageName = '/laboratorydetails';
  const LaboratoryDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final laboratory =
        (ModalRoute.of(context)?.settings.arguments as Laboratory);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Stack(
            children: [
              CustomScrollView(
                physics: const ClampingScrollPhysics(),
                slivers: [
                  // App Bar
                  LaboratoryDetailAppBar(),
                  // Logo
                  LaboratoryDetailLogo(),
                  // Address
                  LaboratoryDetailAddress(),
                  // Available Tests
                  LaboratoryDetailAvailableTests(),
                  // Available Tests List
                  LaboratoryDetailTestsListview(tests: laboratory.tests),
                  // Bottom Space => To make list visible otherwise one or two list tiles will be behind total button
                  LaboratoryDetailBottomSpace(),
                ],
              ),
              const Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: LaboratoryDetailTotalButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
