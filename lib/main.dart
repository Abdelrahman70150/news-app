import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/bloc/mybloc_observer/mybloc_observer.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/screens/business_screen/business_screen.dart';
import 'package:news_app/screens/enviroment_screen/enviroment_screen.dart';
import 'package:news_app/screens/health_screen/health_screen.dart';
import 'package:news_app/screens/layout_screen.dart';
import 'package:news_app/screens/politics_screen/politics_screen.dart';
import 'package:news_app/screens/science_screen/science_screen.dart';
import 'package:news_app/screens/settings_screen/settings_screen.dart';
import 'package:news_app/screens/sports_screen/sports_screen.dart';
import 'package:news_app/style/theming/theming.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'style/conts/colors.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

        return BlocProvider(
          create: (context)=>NewsCubit() ,
          child: BlocConsumer<NewsCubit,NewsStates>(
            listener: (context, state){},
            builder: (context,state){

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'News App',
                routes: {
                  LayoutScreen.routName : (c)=>LayoutScreen(),
                  SportsScreen.routName : (c)=> SportsScreen(),
                  PoliticssScreen.routName : (c)=> PoliticssScreen(),
                  HealthScreen.routName : (c)=> HealthScreen(),
                  BusinessScreen.routName : (c)=> BusinessScreen(),
                  EnviromentScreen.routName : (c)=> EnviromentScreen(),
                  ScienceScreen.routName : (c)=> ScienceScreen(),
                  SettingsScreen.routName : (c)=> SettingsScreen(),
                },
                initialRoute: LayoutScreen.routName,
                theme: MyThemeData.myLightTheme,
                darkTheme:MyThemeData.myDarkTheme,
                themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark: ThemeMode.light
                ,
              );
            },
          ),
        );



  }
}

