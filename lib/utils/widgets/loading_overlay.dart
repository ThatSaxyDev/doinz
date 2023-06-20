import 'dart:ui';

import 'package:doinz/utils/loader.dart';
import 'package:flutter/material.dart';

class LoadingOverLay extends StatelessWidget {
  const LoadingOverLay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: const Loadinggg(),
      ),
    );
  }
}
