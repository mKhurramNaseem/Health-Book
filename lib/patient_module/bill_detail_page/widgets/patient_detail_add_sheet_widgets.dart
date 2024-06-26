import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_book/patient_module/bill_detail_page/bloc/bill_detail_bloc.dart';
import 'package:health_book/patient_module/bill_detail_page/bloc/bill_detail_events.dart';
import 'package:health_book/patient_module/bill_detail_page/bloc/bill_detail_states.dart';

class PatientDetailSheetTitle extends StatelessWidget {
  const PatientDetailSheetTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Align(
          alignment: Alignment.center,
          child: Text(
            'Add Patient Details',
            style: TextStyle(
              fontSize: constraints.maxWidth * 0.07,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        );
      },
    );
  }
}

class PatientDetailNameField extends StatelessWidget {
  const PatientDetailNameField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BillDetailBloc>();
    return Align(
      alignment: Alignment.bottomCenter,
      child: PatientDetailBaseWidget(
        child: TextFormField(
          controller: bloc.nameController,
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(
            hintText: 'Patient Name',
            helperText: '',
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}

class PatientDetailAgeField extends StatelessWidget {
  const PatientDetailAgeField({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BillDetailBloc>();
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(
            flex: 10,
          ),
          Expanded(
            flex: 20,
            child: TextFormField(
              controller: bloc.ageController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                hintText: 'Age',
                helperText: '',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const Spacer(
            flex: 10,
          ),
          const Expanded(flex: 50, child: PatientDetailGenderRow()),
          const Spacer(
            flex: 10,
          ),
        ],
      ),
    );
  }
}

class PatientDetailGenderRow extends StatelessWidget {
  const PatientDetailGenderRow({super.key});

  @override
  Widget build(BuildContext context) {
    bool groupValue = true;
    return StatefulBuilder(builder: (context, setState) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 20,
            child: Radio<bool>(
              value: true,
              groupValue: groupValue,
              onChanged: (value) {
                setState(
                  () => groupValue = value ?? true,
                );
              },
            ),
          ),
          const Expanded(
            flex: 30,
            child: Text('Male'),
          ),
          Expanded(
            flex: 20,
            child: Radio<bool>(
              value: false,
              groupValue: groupValue,
              onChanged: (value) {
                setState(
                  () => groupValue = value ?? false,
                );
              },
            ),
          ),
          const Expanded(
            flex: 30,
            child: Text('Female'),
          ),
        ],
      );
    });
  }
}

class PatientDetailAddress extends StatelessWidget {
  const PatientDetailAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BillDetailBloc>();
    return PatientDetailBaseWidget(
      child: TextFormField(
        controller: bloc.addressController,
        keyboardType: TextInputType.text,
        maxLines: 3,
        decoration: const InputDecoration(
          hintText: 'Address',
          helperText: '',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class PatientDetailPhoneNo extends StatelessWidget {
  const PatientDetailPhoneNo({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BillDetailBloc>();
    return PatientDetailBaseWidget(
      child: TextFormField(
        controller: bloc.phoneNoController,
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          PhoneNumberFormator(formatter: '####-#######', separator: '-'),
        ],
        decoration: const InputDecoration(
          hintText: 'Phone No',
          helperText: '',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}

class PatientDetailSubmitButton extends StatelessWidget {
  const PatientDetailSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BillDetailBloc>();
    return PatientDetailBaseWidget(
      child: LayoutBuilder(builder: (context, constraints) {
        return FloatingActionButton(
          onPressed: () {
            bloc.add(const PatientDetailAddEvent());
            Navigator.of(context).pop();
          },
          elevation: 10.0,
          child: FittedBox(
            child: Text(
              'Submit',
              style: TextStyle(
                  fontSize: constraints.maxHeight * 0.25,
                  fontStyle: FontStyle.italic),
            ),
          ),
        );
      }),
    );
  }
}

class PatientDetailBaseWidget extends StatelessWidget {
  final Widget child;
  const PatientDetailBaseWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 10,
        ),
        Expanded(
          flex: 80,
          child: child,
        ),
        const Spacer(
          flex: 10,
        ),
      ],
    );
  }
}

class ConfirmTestBookingButton extends SliverToBoxAdapter {
  ConfirmTestBookingButton({super.key})
      : super(child: BlocBuilder<BillDetailBloc, BillDetailState>(
            builder: (context, state) {
          final bloc = context.read<BillDetailBloc>();
          if (bloc.hasPatient) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.08,
              child: LayoutBuilder(builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FloatingActionButton(
                    onPressed: () {},
                    elevation: 10.0,
                    child: FittedBox(
                      child: Text(
                        'Verify Details and Confirm',
                        style: TextStyle(
                            fontSize: constraints.maxHeight * 0.25,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                );
              }),
            );
          } else {
            return const SizedBox();
          }
        }));
}

class PhoneNumberFormator extends TextInputFormatter {
  final String formatter, separator;
  PhoneNumberFormator({required this.formatter, required this.separator})
      : assert(separator.length == 1);
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;
    if (text.length >= formatter.length) {
      return oldValue;
    }
    String result = '';
    for (var i = 0; i < text.length; i++) {
      var formatCharacter = formatter.characters.toList()[i];
      if (formatCharacter == separator) {
        result = result + separator;
      }
      result = result + text.characters.toList()[i];
    }

    return TextEditingValue(text: result);
  }
}
