// import 'package:file_picker/file_picker.dart';
import 'dart:async';
import 'package:doinz/theme/palette.dart';
import 'package:doinz/utils/type_defs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1000),
        content: Text(text),
      ),
    );
}

// Future<FilePickerResult?> pickImage() async {
//   final image = await FilePicker.platform.pickFiles(type: FileType.image);

//   return image;
// }

//! SHOW BANNER
showBanner({
  required BuildContext context,
  required String theMessage,
  required NotificationType theType,
}) {
  ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      elevation: 4.0.sp,
      padding: EdgeInsets.symmetric(
        vertical: 20.0.h,
        horizontal: 25.0.w,
      ),
      forceActionsBelow: true,
      backgroundColor: theType == NotificationType.failure
          ? Colors.red.shade400
          : theType == NotificationType.success
              ? Colors.green.shade400
              : Pallete.orange,

      //! THE CONTENT
      content: Text(
        theMessage,
        style: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Pallete.whiteColor,
        ),
      ),

      //! ACTIONS - DISMISS BUTTON
      actions: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
            style: ElevatedButton.styleFrom(
              elevation: 0.0,
              padding: const EdgeInsets.all(12.0),
              shadowColor: Colors.transparent,
              backgroundColor: Colors.white24,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21.0.r),
              ),
            ),
            child: Text(
              "Dismiss",
              style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: Pallete.whiteColor),
            ),
          ),
        ),
      ],
    ),
  );

  //! DISMISS AFTER 2 SECONDS
  Timer(
    const Duration(milliseconds: 2000),
    () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
  );
}
