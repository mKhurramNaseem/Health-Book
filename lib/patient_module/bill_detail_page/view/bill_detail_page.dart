import 'package:flutter/material.dart';
import 'package:health_book/patient_module/bill_detail_page/widgets/bill_detail_widgets.dart';
import 'package:health_book/patient_module/bill_detail_page/widgets/patient_detail_add_sheet_widgets.dart';
import 'package:health_book/patient_module/bill_detail_page/widgets/patient_detail_widgets.dart';

class BillDetailPage extends StatelessWidget {
  static const pageName = '/billdetails';
  const BillDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Verify Details'),
        ),
        body: Center(
          child: CustomScrollView(
            slivers: [
              // Bill Details
              BillDetailTitle(),
              BillDetailTestsTable(),
              BillDetailPaymentWay(),
              // Patient Details
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 30,
                ),
              ),
              PatientDetailTitle(),
              PatientDetailBody(),
              ConfirmTestBookingButton()
            ],
          ),
        ),
        floatingActionButton: const PatientDetailsAddButton(),
      ),
    );
  }
}
