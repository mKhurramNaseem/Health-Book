import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_book/laboratory_module/upload_report_page/view/upload_report_page.dart';
import 'package:health_book/models/booking.dart';

class LaboratoryPendingPart extends StatelessWidget {
  final List<Booking> bookings;
  const LaboratoryPendingPart({super.key, required this.bookings});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                height: height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Patient Name : ${bookings[index].patientDetails.name}'),
                        Text('Age : ${bookings[index].patientDetails.age}'),
                        Text(bookings[index].dateTime.toString()),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) => UploadReportPage(
                                  booking: bookings[index],
                                )));
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}
