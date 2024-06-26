import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_book/patient_module/bill_detail_page/bloc/bill_detail_bloc.dart';
import 'package:health_book/patient_module/bill_detail_page/widgets/patient_detail_add_sheet_widgets.dart';

class PatientDetailsAddSheet extends StatelessWidget {
  static const _mainFlex = 19, _btnFlex = 14;
  static const _titleFlex = 8, _bottomSpace = 2;
  const PatientDetailsAddSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BillDetailBloc>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: constraints.maxHeight,
              child: Form(
                key: bloc.formKey,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: _titleFlex,
                      child: PatientDetailSheetTitle(),
                    ),
                    Expanded(
                      flex: _mainFlex,
                      child: PatientDetailNameField(),
                    ),
                    // Spacer(flex: _mainSpace),
                    Expanded(
                      flex: _mainFlex,
                      child: PatientDetailAgeField(),
                    ),
                    // Spacer(flex: _mainSpace),
                    Expanded(
                      flex: _mainFlex,
                      child: PatientDetailAddress(),
                    ),
                    // Spacer(flex: _mainSpace),
                    Expanded(
                      flex: _mainFlex,
                      child: PatientDetailPhoneNo(),
                    ),
                    // Spacer(flex: _mainSpace),
                    Expanded(
                      flex: _btnFlex,
                      child: PatientDetailSubmitButton(),
                    ),
                    Spacer(flex: _bottomSpace),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
          ),
        ]);
      },
    );
  }
}
