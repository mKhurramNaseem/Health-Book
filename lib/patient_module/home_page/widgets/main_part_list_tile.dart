import 'package:cached_network_image/cached_network_image.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_book/models/laboratory.dart';
import 'package:health_book/patient_module/laboratory_detail_page/view/laboratory_detail_page.dart';

class MainPartListTile extends StatelessWidget {
  static const _topPadding = 10.0, _bottomPadding = 10.0;
  static const _heightPercent = 0.15;
  // Row (Tile) Flex Values
  static const _logoFlex = 30, _tileFlex = 48, _btnFlex = 10;
  static const _logoLeftSpace = 5, _logoRightSpace = 2;
  static const _btnLeftSpace = 1, _btnRightSpace = 4;
  // Column Flex Values
  static const _nameFlex = 6 , _ratingFlex = 2;
  static const _ratingTopFlex = 1 , _ratingBottomFlex = 1;
  // Instance member
  final Laboratory laboratory;
  const MainPartListTile({
    super.key,
    required this.laboratory,
  });

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.only(top: _topPadding, bottom: _bottomPadding),
      child: SizedBox(
        height: height * _heightPercent,
        child: Row(
          children: [
            const Spacer(
              flex: _logoLeftSpace,
            ),
            Expanded(
              flex: _logoFlex,
              child: LaboratoryLogo(laboratory: laboratory),
            ),
            const Spacer(
              flex: _logoRightSpace,
            ),
            Expanded(
              flex: _tileFlex,
              child: Column(
                children: [
                  Expanded(
                    flex: _nameFlex,
                    child: LaboratoryName(name: laboratory.name),
                  ),
                  const Spacer(
                    flex: _ratingTopFlex,
                  ),
                  Expanded(
                    flex: _ratingFlex,
                    child: LaboratoryRatings(
                      ratings: laboratory.ratings,
                    ),
                  ),
                  const Spacer(
                    flex: _ratingBottomFlex,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: _btnLeftSpace,
            ),
            Expanded(
              flex: _btnFlex,
              child: LaboratoryDetailPageButton(
                laboratory: laboratory,
              ),
            ),
            const Spacer(
              flex: _btnRightSpace,
            ),
          ],
        ),
      ),
    );
  }
}

class LaboratoryLogo extends StatelessWidget {
  static const _widthPercent = 0.3, _borderRadius = 10.0;
  final Laboratory laboratory;
  const LaboratoryLogo({super.key, required this.laboratory});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Hero(
      tag: laboratory.hashCode,
      child: Container(
        width: width * _widthPercent,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: CachedNetworkImageProvider(
              laboratory.logo,
            ),
          ),
        ),
      ),
    );
  }
}

class LaboratoryName extends StatelessWidget {
  static const _maxLines = 3, _fontSizePercent = 0.25;
  final String name;
  const LaboratoryName({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: LayoutBuilder(builder: (context, constraints) {
        return Text(
          name,
          overflow: TextOverflow.ellipsis,
          maxLines: _maxLines,
          style: TextStyle(fontSize: constraints.maxHeight * _fontSizePercent),
        );
      }),
    );
  }
}

class LaboratoryRatings extends StatelessWidget {
  static const _maxRating = 5;
  final double ratings;
  const LaboratoryRatings({
    super.key,
    required this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.readOnly(
      maxRating: _maxRating,
      initialRating: ratings,
      filledIcon: Icons.star,
      emptyIcon: Icons.star_outline,
      emptyColor: Colors.grey,
      halfFilledColor: Colors.green,
      halfFilledIcon: Icons.star_half,
      filledColor: Colors.yellow,
    );
  }
}

class LaboratoryDetailPageButton extends StatelessWidget {
  static const _heightPercent = 0.6, _borderRadius = 10.0;
  final Laboratory laboratory;
  const LaboratoryDetailPageButton({super.key, required this.laboratory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HapticFeedback.vibrate();
        Navigator.of(context)
            .pushNamed(LaboratoryDetailPage.pageName, arguments: laboratory);
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight * _heightPercent,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(_borderRadius),
          ),
          child: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        );
      }),
    );
  }
}
