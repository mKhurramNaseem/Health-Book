import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_book/models/test.dart';
import 'package:health_book/patient_module/laboratory_detail_page/bloc/laboratory_detail_bloc.dart';
import 'package:health_book/patient_module/laboratory_detail_page/bloc/laboratory_detail_events.dart';

class LaboratoryDetailTestsListview extends SliverList {
  LaboratoryDetailTestsListview({super.key, required List<Test> tests})
      : super(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return LaboratoryDetailTestsListTile(
                test: tests[index],
              );
            },
            childCount: tests.length,
          ),
        );
}

class LaboratoryDetailTestsListTile extends StatefulWidget {
  static const _rightPadding = 10.0, _borderRadius = 10.0;
  static const _detailsText = 'Details',
      _btnBookedText = 'Book',
      _btnCancelText = 'Cancel';
  static const _rateText = 'Rate', _descriptionText = 'Description';
  final Test test;
  const LaboratoryDetailTestsListTile({
    super.key,
    required this.test,
  });

  @override
  State<LaboratoryDetailTestsListTile> createState() =>
      _LaboratoryDetailTestsListTileState();
}

class _LaboratoryDetailTestsListTileState
    extends State<LaboratoryDetailTestsListTile> {
  late ExpansionTileController controller;
  @override
  void initState() {
    super.initState();
    controller = ExpansionTileController();
  }

  @override
  Widget build(BuildContext context) {    
    final bloc = context.read<LaboratoryDetailBloc>();
    bool isExpanded = false;
    return StatefulBuilder(builder: (context, setState) {
      return ExpansionTile(
        title: Text(widget.test.name),
        leading: isExpanded
            ? const Icon(Icons.arrow_drop_up)
            : const Icon(Icons.arrow_drop_down),
        shape: const LinearBorder(),
        trailing:
            Text(isExpanded ? '' : LaboratoryDetailTestsListTile._detailsText),
        controller: controller,
        onExpansionChanged: (value) {
          setState(() => isExpanded = value);
        },
        children: [
          Text(
              '${LaboratoryDetailTestsListTile._descriptionText} : ${widget.test.userDescription}'),
          Text(
              '${LaboratoryDetailTestsListTile._rateText} : ${widget.test.price}'),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: LaboratoryDetailTestsListTile._rightPadding),
              child: ElevatedButton(
                onPressed: () {
                  if (bloc.isBooked(widget.test)) {
                    bloc.add(
                        LaboratoryDetailRemoveTestEvent(test: widget.test));
                  } else {
                    bloc.add(LaboratoryDetailBookTestEvent(test: widget.test));
                  }
                  if (controller.isExpanded) {
                    controller.collapse();
                  }
                },
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          LaboratoryDetailTestsListTile._borderRadius),
                    ),
                  ),
                ),
                child: Text(bloc.isBooked(widget.test)
                    ? LaboratoryDetailTestsListTile._btnCancelText
                    : LaboratoryDetailTestsListTile._btnBookedText),
              ),
            ),
          ),
        ],
      );
    });
  }
}
