import 'package:doinz/counter/views/counter_view.dart';
import 'package:doinz/webb/views/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Doinz(),
    ),
  );
}

class Doinz extends StatelessWidget {
  const Doinz({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple, brightness: Brightness.dark),
              brightness: Brightness.dark,
              useMaterial3: true,
            ),
            home: const WebView(),
          );
        });
  }
}
