import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_book/models/laboratory.dart';
import 'package:health_book/patient_module/laboratory_detail_page/bloc/laboratory_detail_bloc.dart';
import 'package:health_book/patient_module/laboratory_detail_page/bloc/laboratory_detail_states.dart';

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
  static const _heightPercent = 0.25;
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
                  height: height * _heightPercent,
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
  static const _heightPercent = 0.1, _addressText = 'Address';
  static const _maxLines = 3, _fontSizePercent = 0.2;
  LaboratoryDetailAddress({super.key})
      : super(
          child: Builder(builder: (context) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * _heightPercent,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final laboratory = (ModalRoute.of(context)?.settings.arguments
                      as Laboratory);
                  return Align(
                    alignment: Alignment.center,
                    child: Text(
                      '$_addressText : ${laboratory.address}',
                      maxLines: _maxLines,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: constraints.maxHeight * _fontSizePercent),
                    ),
                  );
                },
              ),
            );
          }),
        );
}

class LaboratoryDetailAvailableTests extends SliverToBoxAdapter {
  static const _heightPercent = 0.05,
      _leftPadding = 10.0,
      _fontSizePercent = 0.4;
  static const _maxLines = 3, _text = 'Available Tests';
  LaboratoryDetailAvailableTests({super.key})
      : super(
          child: Builder(builder: (context) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * _heightPercent,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: _leftPadding),
                      child: Text(
                        _text,
                        maxLines: _maxLines,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: constraints.maxHeight * _fontSizePercent),
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        );
}

class LaboratoryDetailBottomSpace extends SliverToBoxAdapter {
  static const _heightPercent = 0.08;
  LaboratoryDetailBottomSpace({super.key})
      : super(
          child: Builder(
            builder: (context) {
              return BlocBuilder<LaboratoryDetailBloc, LaboratoryDetailState>(
                builder: (context, state) {
                  if (state is LaboratoryDetailUpdateTotalState &&
                      state.total > 0.0) {
                    return SizedBox(
                      height:
                          MediaQuery.sizeOf(context).height * _heightPercent,
                    );
                  }
                  return const SizedBox();
                },
              );
            },
          ),
        );
}
