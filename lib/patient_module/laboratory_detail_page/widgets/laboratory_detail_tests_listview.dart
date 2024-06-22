import 'package:flutter/material.dart';
import 'package:health_book/models/test.dart';

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

class LaboratoryDetailTestsListTile extends StatelessWidget {
  final Test test;
  const LaboratoryDetailTestsListTile({
    super.key,
    required this.test,
  });

  @override
  Widget build(BuildContext context) {
    bool isExpanded = false;
    final ExpansionTileController controller = ExpansionTileController();
    return StatefulBuilder(builder: (context, setState) {
      return ExpansionTile(
        title: Text(test.name),
        leading: isExpanded
            ? const Icon(Icons.arrow_drop_up)
            : const Icon(Icons.arrow_drop_down),
        shape: const LinearBorder(),
        trailing: Text(isExpanded ? '' : 'Details'),
        controller: controller,
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = value;
          });
        },
        children: [
          Text('Description : ${test.userDescription}'),
          Text('Rate : ${test.price}'),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  if (controller.isExpanded) {
                    controller.collapse();
                  }
                },
                style: ButtonStyle(
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                child: const Text('Add'),
              ),
            ),
          ),
        ],
      );
    });
  }
}
