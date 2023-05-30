import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/screens/business_screen/business_screen.dart';
import 'package:news_app/screens/enviroment_screen/enviroment_screen.dart';
import 'package:news_app/screens/health_screen/health_screen.dart';
import 'package:news_app/screens/politics_screen/politics_screen.dart';
import 'package:news_app/screens/science_screen/science_screen.dart';
import 'package:news_app/screens/settings_screen/settings_screen.dart';
import 'package:news_app/screens/sports_screen/sports_screen.dart';
import 'package:news_app/style/conts/colors.dart';

class LayoutScreen extends StatelessWidget {
  static const String routName = 'layout screen';
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>NewsCubit()
      ,
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener: (context, states){},
        builder: (context, states){
          var cubit = NewsCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: const Text('News App'),
              ),
              drawer: Drawer(
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: myMainGreenColor,
                      ),
                      child: Center(child: Text(
                        'News App!',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white),)),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.list,
                        size: 35,
                        color: Colors.black,
                      ),
                      title:  Text(
                          'Categories',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black)),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.settings,
                        size: 35,
                        color: Colors.black,
                      ),
                      title:  Text('Settings',style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black)),
                      onTap: () {
                        Navigator.pushNamed(context, SettingsScreen.routName);
                      },
                    ),
                  ],
                ),
              ),

              body:Padding(
                padding: const EdgeInsets.all(18.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pick your category \nof interest',
                        style: Theme.of(context).textTheme.bodyLarge,),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                                onTap:(){
                                  Navigator.pushNamed(context, SportsScreen.routName);
                                 cubit.getSports();
                                },child: Container(child: Image.asset('assets/images/sports.png'),),),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap:(){
                                Navigator.pushNamed(context, PoliticssScreen.routName);
                              },child: Container(child: Image.asset('assets/images/politics.png'),),),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap:(){
                                Navigator.pushNamed(context, HealthScreen.routName);
                              },child: Container(child: Image.asset('assets/images/health.png'),),),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap:(){
                                Navigator.pushNamed(context, BusinessScreen.routName);
                              },child: Container(child: Image.asset('assets/images/business.png'),),),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap:(){
                                Navigator.pushNamed(context, EnviromentScreen.routName);
                              },child: Container(child: Image.asset('assets/images/enviroment.png'),),),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap:(){
                                Navigator.pushNamed(context, ScienceScreen.routName);
                              },child: Container(child: Image.asset('assets/images/science.png'),),),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
