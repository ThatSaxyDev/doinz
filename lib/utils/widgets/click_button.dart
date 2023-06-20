// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:doinz/theme/palette.dart';

class ClickButton extends StatefulWidget {
  final void Function()? onTap;
  final double? width;
  final double? height;
  final String? text;
  final bool? isActive;
  final bool? childIsText;
  final Widget? icon;
  const ClickButton({
    Key? key,
    this.onTap,
    this.width,
    this.height,
    this.text,
    this.isActive = true,
    this.childIsText = true,
    this.icon,
  }) : super(key: key);

  @override
  State<ClickButton> createState() => _ClickButtonState();
}

class _ClickButtonState extends State<ClickButton>
    with SingleTickerProviderStateMixin {
  bool isPlay = false;
  final ValueNotifier<bool> clicked = ValueNotifier(false);
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: clicked,
      child: const SizedBox.shrink(),
      builder: (context, value, child) {
        return InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (isPlay == false) {
              _controller.forward();
              isPlay = true;
            } else {
              _controller.reverse();
              isPlay = false;
            }

            if (widget.isActive == true) {
              clicked.value = true;
              Timer(const Duration(milliseconds: 100), () {
                clicked.value = false;
                widget.onTap?.call();
              });
            }
          },
          child: SizedBox(
            height: widget.height ?? 70.h,
            width: widget.width ?? double.infinity,
            child: Stack(
              children: [
                Align(
                  alignment: clicked.value == true
                      ? Alignment.bottomCenter
                      : Alignment.topCenter,
                  child: Container(
                    height: switch (widget.height != null) {
                      true => widget.height! - 2,
                      false => 68.h
                    },
                    width: widget.width ?? double.infinity,
                    decoration: BoxDecoration(
                      color: widget.isActive == true
                          ? Pallete.buttonBlue
                          : Pallete.inactiveButtonBlue,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: widget.isActive == true
                              ? Pallete.buttonShadow
                              : Pallete.inactiveButtonShadow,
                          offset: clicked.value == true
                              ? const Offset(0, 0)
                              : Offset(0, 5.h),
                        ),
                      ],
                    ),
                    child: Center(
                      child: widget.childIsText == true && widget.text != null
                          ? Text(
                              widget.text!,
                              style: TextStyle(
                                color: widget.isActive == true
                                    ? Pallete.textWhite
                                    : Pallete.textGrey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : AnimatedIcon(
                              icon: AnimatedIcons.play_pause,
                              progress: _controller,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
