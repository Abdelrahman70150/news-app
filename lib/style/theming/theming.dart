import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/style/conts/colors.dart';

class MyThemeData {
 static ThemeData myLightTheme = ThemeData(
   primarySwatch: Colors.green,
   scaffoldBackgroundColor: Colors.white,
   primaryColor: myMainGreenColor,
   appBarTheme: const AppBarTheme(
       toolbarHeight: 70,
     backgroundColor: myMainGreenColor,
     centerTitle: true,
     systemOverlayStyle: SystemUiOverlayStyle(
       statusBarIconBrightness: Brightness.light,
       statusBarBrightness: Brightness.light,
       statusBarColor: Colors.transparent// <-- SEE HERE
       //<-- For Android SEE HERE (dark icons)
     ),
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.vertical(
         bottom: Radius.circular(40),
       ),
     ),
   ),
   textTheme: TextTheme(
     bodyLarge: GoogleFonts.poppins(
       fontSize: 22,
       fontWeight:FontWeight.bold,
       color: myMainTextColor,
     ),
     bodyMedium: GoogleFonts.poppins(
       fontSize: 14,
       fontWeight:FontWeight.bold,
       color: myMainTextColor,
     ),
     bodySmall: GoogleFonts.poppins(
       fontSize: 10,

       color: myMainTextColor,
     ),
   ),

 );

 static ThemeData myDarkTheme = ThemeData(
   scaffoldBackgroundColor: myDarkScaffoldColor,
   primaryColor: myMainDarkColor,
   appBarTheme: const AppBarTheme(
     toolbarHeight: 70,
     backgroundColor:myMainDarkColor,
     centerTitle: true,
     systemOverlayStyle: SystemUiOverlayStyle(
         statusBarIconBrightness: Brightness.light,
         statusBarBrightness: Brightness.light,
         statusBarColor: Colors.transparent// <-- SEE HERE
       //<-- For Android SEE HERE (dark icons)
     ),
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.vertical(
         bottom: Radius.circular(40),
       ),
     ),
   ),
   textTheme: TextTheme(
     bodyLarge: GoogleFonts.poppins(
       fontSize: 22,
       fontWeight:FontWeight.bold,
       color:Colors.white,
     ),
     bodyMedium: GoogleFonts.poppins(
       fontSize: 14,
       fontWeight:FontWeight.bold,
       color: Colors.white,
     ),
     bodySmall: GoogleFonts.poppins(
       fontSize: 10,
       color: Colors.white,
     ),
   ),

 );
}