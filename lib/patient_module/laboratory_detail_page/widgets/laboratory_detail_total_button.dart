import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_book/patient_module/bill_detail_page/view/bill_detail_page.dart';
import 'package:health_book/patient_module/laboratory_detail_page/bloc/laboratory_detail_bloc.dart';
import 'package:health_book/patient_module/laboratory_detail_page/bloc/laboratory_detail_states.dart';

class LaboratoryDetailTotalButton extends StatelessWidget {
  static const _padding = 8.0, _widthPercent = 0.8, _heightPercent = 0.06;
  static const _borderRadius = 10.0, _elevation = 20.0;
  static const _totalBillText = 'Total Bill', _rupeesText = 'Rupees';
  const LaboratoryDetailTotalButton({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    final bloc = context.read<LaboratoryDetailBloc>();
    return BlocBuilder<LaboratoryDetailBloc, LaboratoryDetailState>(
        builder: (context, state) {
      if (state is LaboratoryDetailUpdateTotalState && state.total > 0.0) {
        return Padding(
          padding: const EdgeInsets.all(_padding),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                BillDetailPage.pageName,
                arguments: bloc.bookedTests,
              );
            },
            style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                Size(width * _widthPercent, height * _heightPercent),
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
              elevation: const WidgetStatePropertyAll(_elevation),
            ),
            child: BlocBuilder<LaboratoryDetailBloc, LaboratoryDetailState>(
                builder: (context, state) {
              if (state is LaboratoryDetailUpdateTotalState) {
                return Text('$_totalBillText : ${state.total} $_rupeesText');
              }
              return const Text('');
            }),
          ),
        );
      }
      return const SizedBox();
    });
  }
}
