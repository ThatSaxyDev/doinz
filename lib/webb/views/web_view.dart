import 'dart:math';

import 'package:doinz/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_builder/responsive_builder.dart';

part '../views/web_view.widgets.dart';

const overlayDescriptionText =
    'always stay positive. always stay positive. always stay positive. always stay positive. always stay positive. always stay positive. always stay positive. always stay positive. always stay positive. always stay positive. always stay positive. always stay positive. always stay positive. always stay positive always stay positive. always stay positive. always stay positive. always stay positive. always stay positive. always stay positive. always stay positive. always stay positive.';
const backgroundImageUrl =
    'https://images.unsplash.com/photo-1585468274952-66591eb14165?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=900&q=60';

class WebView extends StatelessWidget {
  const WebView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffFEE5CA),
      body: ScrollTransformView(
        children: [
          ScrollTransformItem(
            builder: (double scrollOffset) {
              double offScreenPercentage =
                  min(scrollOffset / screenSize.height, 1.0);
              return Image.network(
                height: screenSize.height -
                    (screenSize.height * offScreenPercentage),
                width:
                    screenSize.width - (screenSize.width * offScreenPercentage),
                backgroundImageUrl,
                fit: BoxFit.cover,
              );
            },
            offsetBuilder: (double scrollOffset) {
              double offScreenPercentage =
                  min(scrollOffset / screenSize.height, 1.0);
              double heightShrinkageAmount =
                  screenSize.height * 0.2 * offScreenPercentage;

              final bool startMovingImage =
                  scrollOffset >= screenSize.height * 0.8;
              final double onScreenOffset =
                  scrollOffset + heightShrinkageAmount / 2;
              return Offset(
                  0,
                  !startMovingImage
                      ? onScreenOffset
                      : onScreenOffset -
                          (scrollOffset - screenSize.height * 0.8));
            },
          ),
          ScrollTransformItem(
            builder: (double scrollOffset) => const OverlayTextSection(),
            offsetBuilder: (double scrollOffset) =>
                Offset(0, -screenSize.height),
          ),
          ScrollTransformItem(
            builder: (double scrollOffset) => const BottomSection(),
          ),
        ],
      ),
    );
  }
}
