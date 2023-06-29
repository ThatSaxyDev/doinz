import 'package:doinz/base_nav/widgets/nav_bar_widget.dart';
import 'package:doinz/counter/views/counter_view.dart';
import 'package:doinz/theme/palette.dart';
import 'package:doinz/utils/app_constants.dart';
import 'package:doinz/webb/views/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

part '../views/base_nav_view.controller.dart';

class BaseNavWrapper extends ConsumerWidget {
  const BaseNavWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int indexFromController = ref.watch(baseNavControllerProvider);
    return Scaffold(
      // pages
      body: pages[indexFromController],

      // nav bar
      bottomNavigationBar: Material(
        elevation: 5,
        child: Container(
          // color: Pallete.whiteColor,
          padding: EdgeInsets.only(top: 17.h, left: 17.w, right: 17.w),
          height: 80.h,
          width: width(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              nav.length,
              (index) => NavBarWidget(nav: nav[index]),
            ),
          ),
        ),
      ),
    );
  }
}
