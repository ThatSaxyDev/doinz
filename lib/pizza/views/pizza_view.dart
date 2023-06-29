import 'package:doinz/theme/palette.dart';
import 'package:doinz/utils/app_constants.dart';
import 'package:doinz/utils/app_extensions.dart';
import 'package:doinz/utils/button.dart';
import 'package:doinz/utils/specific_size_text_exrension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:local_hero/local_hero.dart';

class PizzaView extends ConsumerStatefulWidget {
  const PizzaView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PizzaViewState();
}

class _PizzaViewState extends ConsumerState<PizzaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 'Half & half'.txt16(fontWeight: FontWeight.bold),
      ),
      body: LocalHeroScope(
        child: SizedBox(
          height: height(context),
          width: width(context),
          child: Container(
            height: height(context),
            // color: Colors.amber,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  colors.length,
                  (index) => LocalHero(
                    tag: '$index',
                    child: Container(
                      margin: 10.padV,
                      color: colors[index],
                      height: 60.h.h,
                      width: 60.w,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Material(
        elevation: 5,
        child: Container(
          color: Pallete.greyAccent.withOpacity(0.2),
          height: 120.h,
          width: width(context),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'Price: N9000'.txt14(),
                12.sbH,
                BButton(
                  onTap: () {},
                  height: 40.h,
                  radius: 40.r,
                  width: 200.w,
                  text: 'Create',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Color> colors = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.pink,
  Colors.orange,
  Colors.purple,
  Colors.lime,
  Colors.lightBlue,
  Colors.teal,
  Colors.amber
];
