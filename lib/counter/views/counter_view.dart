import 'package:doinz/counter/views/counter_view_controller.dart';
import 'package:doinz/counter/widgets/instruction_input_widget.dart';
import 'package:doinz/utils/app_constants.dart';
import 'package:doinz/utils/app_extensions.dart';
import 'package:doinz/utils/specific_size_text_exrension.dart';
import 'package:doinz/utils/widgets/click_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double counterValueFromController =
        ref.watch(counterViewControllerProvider);
    List<String> actionsFromController =
        ref.watch(counterListControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: 'Counter'.txt24(),
      ),
      body: SizedBox(
        height: height(context),
        width: width(context),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          child: Padding(
            padding: 24.padH,
            child: Column(
              children: [
                // 30.sbH,
                // ClickButton(
                //   height: 50.h,
                //   width: 200.w,
                //   text: 'Instructions',
                // ),
                70.sbH,

                //! number
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    counterValueFromController == 0
                        ? 50.sbW
                        : SizedBox(
                            width: 50.w,
                            child: Center(
                              child: Icon(
                                PhosphorIcons.arrowsClockwise,
                                size: 30.sp,
                              ),
                            ),
                          ).tap(
                            onTap: () {
                              ref
                                  .read(counterViewControllerProvider.notifier)
                                  .resetCounter();
                              ref
                                  .read(counterListControllerProvider.notifier)
                                  .resetList();
                            },
                          ),
                    counterValueFromController
                        .toStringAsFixed(1)
                        .replaceAll(RegExp(r'\.0$'), '')
                        .txt(size: 50.sp, fontWeight: FontWeight.w700),
                    ClickButton(
                      onTap: () {
                        ref
                            .read(counterViewControllerProvider.notifier)
                            .countForward();
                      },
                      height: 50.h,
                      width: 50.w,
                    ),
                  ],
                ),
                50.sbH,

                //! 40.sbH,
                const InstructionInputWidget(),
                30.sbH,
                if (actionsFromController.isNotEmpty)
                  ...List.generate(
                    actionsFromController.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: actionsFromController[index].txt14(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
