import 'package:doinz/counter/views/counter_view_controller.dart';
import 'package:doinz/theme/palette.dart';
import 'package:doinz/utils/app_extensions.dart';
import 'package:doinz/utils/keyboard_utils.dart';
import 'package:doinz/utils/widgets/click_button.dart';
import 'package:doinz/utils/widgets/text_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:substring_highlight/substring_highlight.dart';

class InstructionInputWidget extends ConsumerStatefulWidget {
  const InstructionInputWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InstructionInputWidgetState();
}

class _InstructionInputWidgetState
    extends ConsumerState<InstructionInputWidget> {
  late TextEditingController _instructionController;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 250.w,
          child: LayoutBuilder(builder: (context, constraints) {
            return RawAutocomplete(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text.isEmpty) {
                  return const Iterable<String>.empty();
                } else {
                  return instructions.where((word) => word
                      .toLowerCase()
                      .contains(textEditingValue.text.toLowerCase()));
                }
              },
              optionsViewBuilder:
                  (context, Function(String) onSelected, options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 0,
                    child: Container(
                      height: 52.0 * options.length,
                      width: constraints.biggest.width,
                      decoration: BoxDecoration(
                        color: Pallete.whiteColor.withOpacity(0.9),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(4.r),
                          bottomRight: Radius.circular(4.r),
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: Pallete.blackColor.withOpacity(0.5),
                              blurRadius: 9,
                              spreadRadius: 2,
                              offset: const Offset(3, 3)),
                        ],
                      ),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          final option = options.elementAt(index);

                          return ListTile(
                            title: SubstringHighlight(
                              text: option.toString(),
                              term: _instructionController.text,
                              textStyleHighlight: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                            ),
                            onTap: () {
                              onSelected(option.toString());
                            },
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
              onSelected: (selectedString) {
                selectedString.toLowerCase().log();
              },
              fieldViewBuilder:
                  (context, controller, focusNode, onEditingComplete) {
                _instructionController = controller;

                return TextInputWidget(
                  focusNode: focusNode,
                  onEditingComplete: onEditingComplete,
                  onFieldSubmitted: (p0) {
                    dropKeyboard();
                  },
                  textCapitalization: TextCapitalization.none,
                  onChanged: (text) {
                    controller.value = controller.value.copyWith(
                      text: text.toLowerCase(),
                      selection: TextSelection.collapsed(offset: text.length),
                    );
                  },
                  onTap: () {},
                  hintText: 'e.g add 4',
                  inputTitle: 'Count?',
                  controller: controller,
                );
              },
            );
          }),
        ),

        //! button
        ClickButton(
          onTap: () {
            ref.read(counterViewControllerProvider.notifier).calculate(
                  input: _instructionController.text.trim(),
                  context: context,
                );

            _instructionController.clear();
          },
          height: 40.h,
          width: 50.w,
          text: '=',
        ),
      ],
    );
  }
}

List<String> instructions = [
  'add ',
  'subtract ',
  'subtract from ',
  'divide by ',
  'multiply by ',
];
