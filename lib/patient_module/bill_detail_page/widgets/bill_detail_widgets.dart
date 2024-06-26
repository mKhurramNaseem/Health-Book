import 'package:flutter/material.dart';
import 'package:health_book/models/test.dart';

class BillDetailTitle extends SliverToBoxAdapter {
  static const _title = 'Bill Details';
  BillDetailTitle({super.key})
      : super(child: Builder(builder: (context) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: LayoutBuilder(builder: (context, constraints) {
                  return Text(
                    _title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: constraints.maxHeight * 0.4,
                    ),
                  );
                }),
              ),
            ),
          );
        }));
}

class BillDetailTestsTable extends SliverToBoxAdapter {
  BillDetailTestsTable({super.key})
      : super(child: Builder(builder: (context) {
          final List<Test> tests =
              (ModalRoute.of(context)?.settings.arguments ?? []) as List<Test>;
          final total = tests.fold<double>(
            0.0,
            (previousValue, element) => previousValue + element.price,
          );
          return DataTable(
            columns: const [
              DataColumn(
                label: Text(
                  'Sr.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Test Name',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Test Price',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: [
              for (int index = 0; index < tests.length + 1; index++)
                index < tests.length
                    ? DataRow(
                        cells: [
                          DataCell(
                            Text("${index + 1}."),
                          ),
                          DataCell(
                            Text(tests[index].name),
                          ),
                          DataCell(
                            Text(tests[index].price.toString()),
                          ),
                        ],
                      )
                    : DataRow(
                        cells: [
                          const DataCell(
                            Text(''),
                          ),
                          const DataCell(
                            Text(
                              'Total',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          DataCell(
                            Text(
                              total.toString(),
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
            ],
          );
        }));
}

class BillDetailPaymentWay extends SliverToBoxAdapter {
  BillDetailPaymentWay({super.key})
      : super(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('Payment via Cash'),
                  Radio(
                    value: true,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                ],
              );
            },
          ),
        );
}
