import 'package:flutter/material.dart';

class BillDetailPage extends StatelessWidget {
  static const pageName = '/billdetails';
  const BillDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Hero(
            tag: 'page',
            child: Material(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Text('Bill Details'),
                      DataTable(
                        columns: const [
                          DataColumn(
                            label: Text('Test Name'),
                          ),
                          DataColumn(
                            label: Text('Test Price'),
                          ),
                        ],
                        rows: [
                          for (int i = 0; i < 5; i++)
                            i < 4
                                ? const DataRow(
                                    cells: [
                                      DataCell(
                                        Text('HB'),
                                      ),
                                      DataCell(
                                        Text('300'),
                                      ),
                                    ],
                                  )
                                : const DataRow(
                                    cells: [
                                      DataCell(
                                        Text('Total'),
                                      ),
                                      DataCell(
                                        Text('1200'),
                                      ),
                                    ],
                                  ),
                        ],
                      ),
                      const Text('Add Patient Details'),
                      SizedBox(
                        width: width * 0.8,
                        child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'Patient Name'),
                        ),
                      ),
                      SizedBox(
                        width: width * 0.8,
                        child: TextFormField(
                          decoration:
                              const InputDecoration(hintText: 'Patient Age'),
                        ),
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                value: true,
                                groupValue: false,
                                onChanged: (value) {},
                              ),
                              const Text('Male'),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                value: false,
                                groupValue: false,
                                onChanged: (value) {},
                              ),
                              const Text('Female'),
                            ],
                          ),
                        ],
                      ),
                      const Text("Confirm Address and phone no"),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          const Text("Address Here"),
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: false,
                            onChanged: (value) {},
                          ),
                          const Text("Phone no here"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: true,
                            groupValue: true,
                            onChanged: (value) {},
                          ),
                          const Text('Payment via Cash'),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {

                        },
                        child: const Text("Book Test/s"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
