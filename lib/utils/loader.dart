import 'package:doinz/theme/palette.dart';
import 'package:doinz/utils/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

// class Loader extends StatelessWidget {
//   const Loader({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: LoadingAnimationWidget.halfTriangleDot(
//         color: Pallete.whiteColor,
//         size: 60.w,
//       ),
//     );
//   }
// }

class Loader extends ConsumerWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currenTheme = ref.watch(themeNotifierProvider);
    return Center(
      child: SizedBox(
        height: 60.h,
        width: 60.h,
        // child: CircularProgressIndicator(
        //   color: Pallete.blueColor,
        // ),
        child: LoadingAnimationWidget.inkDrop(
          color: Pallete.textBlack,
          size: 60.h,
        ),
      ),
    );
  }
}

class Loadinggg extends StatefulWidget {
  const Loadinggg({super.key});

  @override
  State<Loadinggg> createState() => _LoadingggState();
}

class _LoadingggState extends State<Loadinggg>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Center(
          //! TODO: replace loader
          child: 'AppGrafiks.logoo'.png
              .mage(h: 50.h + _animationController.value * 30.0),
        );
      },
    );
  }
}
