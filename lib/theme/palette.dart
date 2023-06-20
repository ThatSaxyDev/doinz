import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeData>((ref) {
  return ThemeNotifier();
});

class Pallete {
  //! ****
  static const inactiveButtonBlue = Color(0xff40407F);
  static const orange = Color(0xffFA8126);
  static const textBlack = Color(0xff101828);
  static const textGrey = Color(0xff344054);
  static const whiteColor = Color(0xffffffff);
  static const borderGrey = Color(0xffD0D5DD);
  static const dotGrey = Color(0xffF2F4F7);
  static const textLighterGrey = Color(0xff667085);
  static const greyColor = Color(0xffEAECF0);
  static const greey = Color(0xffF9FAFB);
  static const activegreen = Color(0xff039855);
  static const grn = Color(0xff6CE9A6);
  static const grnn = Color(0xff12B76A);
  static const darkgrn = Color(0xff042619);
  static const activegreenBack = Color(0xffECFDF3);
  static const endedRed = Color(0xffB42318);
  static const inactiveButtonShadow = Color(0xff252559);
  static const endedRedBack = Color(0xffFEE4E2);
  static const greyAccent = Color(0xff2D454F);
  static const anothertextBlack = Color(0xff1D2939);
  static const lightBlue = Color(0xffE7F5FB);
  static const newBlack = Color(0xff161C1F);
  static const textWhite = Color(0xffFCFCFD);
  static const downBorderGRey = Color(0xffF4F4F4);
  static const borderRed = Color(0xffF97066);
  static const someNewGrey = Color(0xffB8B8B8);
  static const cream = Color(0xffFFF4ED);

  //! for the car condition
  static const carExcellent = Color(0xff00FF00);
  static const carVeryGood = Color(0xff66CCCC);
  static const carGood = Color(0xffFFCC99);
  static const carFair = Color(0xffFF6666);

  //! driving routines
  static const cityDrivingRed = Color(0xffFF3300);
  static const highwayBlue = Color(0xff0066CC);
  static const commutingGrey = Color(0xff666666);
  static const longDistanceTravelGreen = Color(0xff009900);
  static const dailyShortTripsYellow = Color(0xffFFCC00);
  static const businessProfessionalGrey = Color(0xff333333);
  static const weekendLeisurePink = Color(0xffFF6699);

  //! ****

  // Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  // secondary color
  static const drawerColor = Color.fromRGBO(18, 18, 18, 1);

  static const brownColor = Color(0xff593C2A);
  static const primaryTeal = Color(0xff057672);

  static const backButtonGrey = Color(0xffF4F5F5);

  static var imagePlaceHolder2 = const Color(0xff969696).withOpacity(0.29);
  static const imagePlaceHolder3 = Color(0xffECE9D9);

  static const blackTint = Color(0xff121212);
  static const lightbrownColor = Color(0xffB48669);

  static const blueColor = Color(0xff034DC6);

  //!

  static const backgroundBlue = Color(0xff0D0D1A);
  static const notifbackgroundBlue = Color(0xff0D0D19);

  static const textHintGrey = Color(0xff7A7A87);
  static const buttonBlue = Color(0xff7373E5);
  static const redColor = Color(0xffEF4444);

  static const darkBlueGrey = Color(0xff090912);
  static const buttonShadow = Color(0xff3D3D99);

  static const answerBorder = Color(0xff22222E);

  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    // textTheme: GoogleFonts.spaceGroteskTextTheme(),
    // textTheme: ThemeData.dark().textTheme.apply(
    //       fontFamily: 'Sk-Modernist',
    //     ),
    scaffoldBackgroundColor: blackColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: drawerColor,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: blueColor, // will be used as alternative background color
    canvasColor: greyColor, colorScheme: ColorScheme.fromSwatch(),
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    // textTheme: GoogleFonts.spaceGroteskTextTheme(),
    // textTheme: ThemeData.light().textTheme.apply(
    //       fontFamily: 'Sk-Modernist',
    //     ),
    scaffoldBackgroundColor: whiteColor,
    cardColor: greyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: blueColor,
    canvasColor: blackColor,
    colorScheme: ColorScheme.fromSwatch(),
  );
}

class ThemeNotifier extends StateNotifier<ThemeData> {
  ThemeMode _mode;
  ThemeNotifier({ThemeMode mode = ThemeMode.dark})
      : _mode = mode,
        super(
          Pallete.darkModeAppTheme,
        ) {
    getTheme();
  }

  ThemeMode get mode => _mode;

  void getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');

    if (theme == 'light') {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
    }
  }

  void toggleTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_mode == ThemeMode.dark) {
      _mode = ThemeMode.light;
      state = Pallete.lightModeAppTheme;
      prefs.setString('theme', 'light');
    } else {
      _mode = ThemeMode.dark;
      state = Pallete.darkModeAppTheme;
      prefs.setString('theme', 'dark');
    }
  }
}
