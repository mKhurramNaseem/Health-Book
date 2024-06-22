import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_book/models/laboratory.dart';
import 'package:health_book/models/patient.dart';
import 'package:health_book/models/report.dart';
import 'package:health_book/models/test.dart';
import 'package:health_book/patient_module/home_page/widgets/main_part_body.dart';
import 'package:health_book/patient_module/profile_page/view/profile_part.dart';
import 'package:health_book/patient_module/reports_page/view/reports_part.dart';

class HomePage extends StatefulWidget {
  static const pageName = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Builder(
            builder: (context) {
              if (currentIndex == 0) {
                return MainPart(laboratories: laboratoryList);
              } else if (currentIndex == 1) {
                return ReportsPart(reports: reportList);
              }
              return const ProfilePart();
            },
          ),
        ),
        bottomNavigationBar: CupertinoTabBar(
          currentIndex: currentIndex,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          height: kToolbarHeight,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.text_snippet_rounded),
              icon: Icon(Icons.text_snippet_outlined),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.person),
              icon: Icon(Icons.person_outline),
            ),
          ],
        ),
      ),
    );
  }
}

List<Laboratory> laboratoryList = [
  Laboratory(
    name: 'Saeed Laboratory',
    logo:
        'https://images.unsplash.com/photo-1633621412960-6df85eff8c85?q=80&w=1854&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ratings: 3.5,
    address: 'Opposite Victoria Hospital Bahawalpur',
    tests: [
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      Test(
        name: 'HB',
        userDescription: 'Test to check blood haemoglobin',
        price: 300,
      ),
      
      

    ],
  ),
  Laboratory(
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
  Laboratory(
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
  Laboratory(
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
  Laboratory(
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
  Laboratory(
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
];

List<Report> reportList = [
  Report(
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
    patientDetails: Patient(
        name: 'Khurram',
        isMale: true,
        age: 25,
        address:
            'Hosue no 335 Block E Government Employees Cooperative Housing Society Bahawalpur',
        phoneNo: '03017731831'),
    dateTime: DateTime.now(),
  ),
  Report(
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
    patientDetails: Patient(
        name: 'Khurram',
        isMale: true,
        age: 25,
        address:
            'Hosue no 335 Block E Government Employees Cooperative Housing Society Bahawalpur',
        phoneNo: '03017731831'),
    dateTime: DateTime.now(),
  ),
  Report(
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
    patientDetails: Patient(
        name: 'Khurram',
        isMale: true,
        age: 25,
        address:
            'Hosue no 335 Block E Government Employees Cooperative Housing Society Bahawalpur',
        phoneNo: '03017731831'),
    dateTime: DateTime.now(),
  ),
  Report(
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
    patientDetails: Patient(
        name: 'Khurram',
        isMale: true,
        age: 25,
        address:
            'Hosue no 335 Block E Government Employees Cooperative Housing Society Bahawalpur',
        phoneNo: '03017731831'),
    dateTime: DateTime.now(),
  ),
  Report(
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
    patientDetails: Patient(
        name: 'Khurram',
        isMale: true,
        age: 25,
        address:
            'Hosue no 335 Block E Government Employees Cooperative Housing Society Bahawalpur',
        phoneNo: '03017731831'),
    dateTime: DateTime.now(),
  ),
  Report(
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
    patientDetails: Patient(
        name: 'Khurram',
        isMale: true,
        age: 25,
        address:
            'Hosue no 335 Block E Government Employees Cooperative Housing Society Bahawalpur',
        phoneNo: '03017731831'),
    dateTime: DateTime.now(),
  ),
  Report(
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
    patientDetails: Patient(
        name: 'Khurram',
        isMale: true,
        age: 25,
        address:
            'Hosue no 335 Block E Government Employees Cooperative Housing Society Bahawalpur',
        phoneNo: '03017731831'),
    dateTime: DateTime.now(),
  ),
];
