import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_book/laboratory_module/home_page/widget/pending_part/laboratory_pending_part.dart';
import 'package:health_book/laboratory_module/home_page/widget/profile_part/profile_part.dart';
import 'package:health_book/models/booking.dart';
import 'package:health_book/models/laboratory.dart';
import 'package:health_book/models/patient.dart';
import 'package:health_book/models/test.dart';

class LaboratoryHomePage extends StatefulWidget {
  const LaboratoryHomePage({super.key});

  @override
  State<LaboratoryHomePage> createState() => _LaboratoryHomePageState();
}

class _LaboratoryHomePageState extends State<LaboratoryHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pending Tests',
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) => ProfilePart(
                    laboratory: Laboratory(
                      name: 'Saeed Labs',
                      logo:
                          'https://images.unsplash.com/photo-1633621412960-6df85eff8c85?q=80&w=1854&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      ratings: 3.2,
                      address: 'Opposite Victoria Hospital Bahawalpur',
                      tests: [
                        Test(
                          name: 'HB',
                          userDescription: 'Test to check blood haemoglobin',
                          price: 300,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.person),
            ),
          ),
        ],
      ),
      body: Center(
        child: LaboratoryPendingPart(bookings: bookings),
      ),
    );
  }
}

List<Booking> bookings = [
  Booking(
      patientDetails: Patient(
          name: 'Khurram',
          isMale: true,
          age: 25,
          address:
              'Hosue no 335 Block E Government Employees Cooperative Housing Society Bahawalpur',
          phoneNo: '03017731831'),
      laboratoryDetails: Laboratory(
        name: 'Saeed Labs',
        logo:
            'https://images.unsplash.com/photo-1633621412960-6df85eff8c85?q=80&w=1854&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        ratings: 3.2,
        address: 'Opposite Victoria Hospital Bahawalpur',
        tests: [
          Test(
            name: 'HB',
            userDescription: 'Test to check blood haemoglobin',
            price: 300,
          ),
        ],
      ),
      isPending: true,
      tests: [
        Test(
          name: 'HB',
          userDescription: 'Test to check blood haemoglobin',
          price: 300,
        ),
      ],
      dateTime: DateTime.now()),
];
