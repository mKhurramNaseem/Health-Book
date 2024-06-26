import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_book/models/patient.dart';
import 'package:health_book/patient_module/bill_detail_page/bloc/bill_detail_bloc.dart';
import 'package:health_book/patient_module/bill_detail_page/bloc/bill_detail_states.dart';
import 'package:health_book/patient_module/bill_detail_page/widgets/patient_details_add_sheet.dart';

class PatientDetailTitle extends SliverToBoxAdapter {
  static const _title = 'Patient Details';
  PatientDetailTitle({super.key})
      : super(child: Builder(builder: (context) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
            child: Align(
              alignment: Alignment.centerLeft,
              child: LayoutBuilder(builder: (context, constraints) {
                return Row(
                  children: [
                    const Spacer(
                      flex: 5,
                    ),
                    Expanded(
                      flex: 80,
                      child: Text(
                        _title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: constraints.maxHeight * 0.4,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: BlocBuilder<BillDetailBloc,BillDetailState>(builder: (context, state) {
                        final bloc = context.read<BillDetailBloc>();
                        if (bloc.hasPatient) {
                          return InkWell(
                            onTap: () async {
                              await showModalBottomSheet(
                                useSafeArea: true,
                                isScrollControlled: true,
                                showDragHandle: true,
                                enableDrag: true,
                                context: context,
                                builder: (context) => SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.7,
                                  width: MediaQuery.sizeOf(context).width,
                                  child: BlocProvider.value(value: bloc,child: const PatientDetailsAddSheet()),
                                ),
                              );
                            },
                            borderRadius: BorderRadius.circular(100.0),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.edit,
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      }),
                    ),
                  ],
                );
              }),
            ),
          );
        }));
}

class PatientDetailsAddButton extends StatelessWidget {
  const PatientDetailsAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillDetailBloc, BillDetailState>(
        builder: (context, state) {
      final bloc = context.read<BillDetailBloc>();
      if (bloc.hasPatient) {
        return const SizedBox();
      }
      return FloatingActionButton.extended(
        onPressed: () async {
          await showModalBottomSheet(
            useSafeArea: true,
            isScrollControlled: true,
            showDragHandle: true,
            enableDrag: true,
            context: context,
            builder: (context) => SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.7,
              width: MediaQuery.sizeOf(context).width,
              child: BlocProvider.value(value: bloc,child: const PatientDetailsAddSheet()),
            ),
          );
        },
        isExtended: true,
        icon: const Icon(Icons.person_add),
        label: const Text('Details'),
      );
    });
  }
}

class PatientDetailBody extends SliverToBoxAdapter {
  PatientDetailBody({super.key})
      : super(child: BlocBuilder<BillDetailBloc, BillDetailState>(
          builder: (context, state) {
            final bloc = context.read<BillDetailBloc>();
            final height = MediaQuery.sizeOf(context).height;
            if (bloc.hasPatient) {
              return SizedBox(
                height: height * 0.4,
                child: PatientDetailAvailable(
                  patient: bloc.patient!,
                ),
              );
            } else {
              return const PatientDetailUnavailable();
            }
          },
        ));
}

class PatientDetailUnavailable extends StatelessWidget {
  const PatientDetailUnavailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.person_search_sharp,
          color: Colors.grey.shade300,
          size: 200,
        ),
        const Text('Patient Details Missing'),
      ],
    );
  }
}

class PatientDetailAvailable extends StatelessWidget {
  final Patient patient;
  const PatientDetailAvailable({
    super.key,
    required this.patient,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PatientDetailTile(attribute: 'Name', value: patient.name),
        ),
        const Divider(),
        Expanded(
          child: PatientDetailTile(
              attribute: 'Age', value: '${patient.age.toInt()} years'),
        ),
        const Divider(),
        Expanded(
          child: PatientDetailTile(
              attribute: 'Gender', value: patient.isMale ? 'Male' : 'Female'),
        ),
        const Divider(),
        Expanded(
          child: PatientDetailTile(
            attribute: 'Address',
            value: patient.address,
            maxLines: 3,
          ),
        ),
        const Divider(),
        Expanded(
          child:
              PatientDetailTile(attribute: 'Phone No', value: patient.phoneNo),
        ),
      ],
    );
  }
}

class PatientDetailTile extends StatelessWidget {
  final String attribute, value;
  final int maxLines;
  const PatientDetailTile({
    super.key,
    required this.attribute,
    required this.value,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 5,
        ),
        Expanded(
          flex: 20,
          child: Text(
            attribute,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 70,
          child: Text(
            value,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Spacer(
          flex: 5,
        ),
      ],
    );
  }
}
