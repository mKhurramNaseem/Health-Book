import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:health_book/patient_module/notifications_page/view/notifications_page.dart';
import 'package:health_book/utils/app_images.dart';

class MainPartAppBar extends SliverAppBar {
  static const _padding = 8.0, _borderRadius = 50.0, _elevation = 10.0;
  static const _title = 'Health Book';
  MainPartAppBar({super.key, required BuildContext context})
      : super(
          title: const Text(_title),
          floating: true,
          elevation: _elevation,
          leading: const Padding(
            padding: EdgeInsets.all(_padding),
            // Brand Logo
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(AppImages.logo),
            ),
          ),
          actions: [
            // Notifications Button to see notifications send by Business Owner
            InkWell(
              borderRadius: BorderRadius.circular(_borderRadius),
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(context).push(
                  CupertinoPageRoute(
                    builder: (context) => const NotificationsPage(),
                  ),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(_padding),
                child: Icon(Icons.notifications),
              ),
            ),
          ],
        );
}
