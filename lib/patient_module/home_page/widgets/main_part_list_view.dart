import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_book/models/laboratory.dart';
import 'package:health_book/patient_module/home_page/widgets/main_part_list_tile.dart';

class MainPartListView extends SliverList {
  MainPartListView({
    super.key,
    required List<Laboratory> list,
  }) : super(
          delegate: SliverChildBuilderDelegate((context, index) {
            return MainPartListTile(
              laboratory: list[index],
            );
          }, childCount: list.length),
        );
}
