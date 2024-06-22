import 'package:flutter/material.dart';
import 'package:health_book/patient_module/bill_detail_page/view/bill_detail_page.dart';

class LaboratoryDetailTotalButton extends StatelessWidget {
  const LaboratoryDetailTotalButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            BillDetailPage.pageName,
          );
        },
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size(width * 0.8, height * 0.06),),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: const Text('Total Bill : 300'),
      ),
    );
  }
}
