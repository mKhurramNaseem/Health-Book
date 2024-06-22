import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:health_book/models/laboratory.dart';

class LaboratoryDetailAppBar extends SliverAppBar {
  LaboratoryDetailAppBar({super.key})
      : super(
        floating: true,
          title: Builder(
            builder: (context) {
              final laboratory =
                  (ModalRoute.of(context)?.settings.arguments as Laboratory);
              return Text(laboratory.name);
            },
          ),
        );
}

class LaboratoryDetailLogo extends SliverToBoxAdapter {
  LaboratoryDetailLogo({
    super.key,
  }) : super(
          child: Builder(
            builder: (context) {
              final height = MediaQuery.sizeOf(context).height;
              final laboratory =
                  (ModalRoute.of(context)?.settings.arguments as Laboratory);
              return Hero(
                tag: laboratory.hashCode,
                child: Container(
                  height: height * 0.2,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(laboratory.logo),
                        fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        );
}

class LaboratoryDetailAddress extends SliverToBoxAdapter {
  LaboratoryDetailAddress({super.key})
      : super(
          child: Builder(builder: (context) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final laboratory = (ModalRoute.of(context)?.settings.arguments
                      as Laboratory);
                  return Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Address : ${laboratory.address}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: constraints.maxHeight * 0.2),
                    ),
                  );
                },
              ),
            );
          }),
        );
}

class LaboratoryDetailAvailableTests extends SliverToBoxAdapter {
  LaboratoryDetailAvailableTests({super.key})
      : super(
          child: Builder(builder: (context) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.05,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Available Tests',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: constraints.maxHeight * 0.4),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        );
}
