import 'package:flutter/material.dart';
import 'package:health_book/models/booking.dart';

class UploadReportPage extends StatelessWidget {
  final Booking booking;
  const UploadReportPage({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Test Details'),
              ),
              SliverToBoxAdapter(
                child: Text(booking.patientDetails.name),
              ),
              SliverToBoxAdapter(
                child: Text(booking.patientDetails.age.toString()),
              ),
              SliverToBoxAdapter(
                child: Text(booking.patientDetails.isMale ? 'Male' : 'Female'),
              ),
              SliverList.builder(
                itemCount: booking.tests.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: Text(booking.tests[index].name),
                  );
                },
              )
            ],
          ),
          Positioned.fill(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height * 0.08,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Upload Report',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.upload,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
