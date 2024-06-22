import 'package:flutter/material.dart';
import 'package:health_book/models/report.dart';

class ReportsPart extends StatelessWidget {
  final List<Report> reports;
  const ReportsPart({super.key, required this.reports});

  @override
  Widget build(BuildContext context) {
    final Size(:width, :height) = MediaQuery.sizeOf(context);
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          title: Text('Reports'),
        ),
        SliverList.builder(
          itemCount: reports.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  width: width * 0.9,
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(reports[index].laboratoryDetails.name),
                          Text(reports[index].patientDetails.name),
                          Text(reports[index].dateTime.toString()),
                        ],
                      ),
                      const CircleAvatar(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.download,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
