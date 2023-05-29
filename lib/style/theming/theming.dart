import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/style/conts/colors.dart';

class MyThemeData {
 static ThemeData myLightTheme = ThemeData(
   scaffoldBackgroundColor: Colors.white,
   primaryColor: myMainGreenColor,
   appBarTheme: const AppBarTheme(
       toolbarHeight: 70,
     backgroundColor: myMainGreenColor,
     centerTitle: true,
     systemOverlayStyle: SystemUiOverlayStyle(
       statusBarColor: myMainGreenColor, // <-- SEE HERE
         statusBarBrightness: Brightness.light,
       systemNavigationBarIconBrightness: Brightness.light//<-- For Android SEE HERE (dark icons)
     ),
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.vertical(
         bottom: Radius.circular(40),
       ),
     ),
   ),
   textTheme: TextTheme(
     bodyMedium: GoogleFonts.poppins(
       fontSize: 22,
       fontWeight:FontWeight.bold,
       color: myMainTextColor,
     ),
    bodySmall: GoogleFonts.poppins(
       fontSize: 14,
       fontWeight:FontWeight.bold,
       color: myMainTextColor,
     ),
   ),

 );
}