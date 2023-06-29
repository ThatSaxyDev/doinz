// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:doinz/base_nav/views/base_nav_view.dart';
import 'package:doinz/theme/palette.dart';
import 'package:doinz/utils/app_extensions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarWidget extends ConsumerWidget {
  final Nav nav;
  const NavBarWidget({
    Key? key,
    required this.nav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int indexFromController = ref.watch(baseNavControllerProvider);
    return SizedBox(
      width: 70.w,
      child: Column(
        children: [
          //! ICON
          Icon(
            nav.selectedIcon,
            color: switch (indexFromController == nav.index) {
              true => Pallete.orange,
              false => Pallete.whiteColor.withOpacity(0.7),
            },
          ),

          //! SPACER
          8.4.sbH,

          //! LABEL
          Text(
            nav.name.toTitleCase(),
            style: TextStyle(
              color: switch (indexFromController == nav.index) {
                true => Pallete.orange,
                false => Pallete.whiteColor.withOpacity(0.7),
              },
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    ).tap(
      onTap: () => moveToPage(
        context: context,
        ref: ref,
        index: nav.index,
      ),
    );
  }
}
