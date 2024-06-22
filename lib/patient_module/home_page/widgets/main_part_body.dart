import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_book/models/laboratory.dart';
import 'package:health_book/patient_module/home_page/widgets/main_part_app_bar.dart';
import 'package:health_book/patient_module/home_page/widgets/main_part_list_view.dart';
import 'package:health_book/patient_module/home_page/widgets/main_part_search_bar.dart';

class MainPart extends StatelessWidget {
  final List<Laboratory> laboratories;
  const MainPart({super.key, required this.laboratories});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // App Bar with App Name and Notification Icon
        MainPartAppBar(context: context),
        // Search Bar to search Laboratories List
        MainPartSearchBar(),
        // Main Part With List of laboratories
        MainPartListView(list: laboratories),
      ],
    );
  }
}
