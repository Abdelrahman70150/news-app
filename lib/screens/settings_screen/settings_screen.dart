import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/style/conts/colors.dart';


class SettingsScreen extends StatefulWidget {
  static const String routName = 'settings screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String dropDownLangValue='English';
  String dropDownThemeValue='Light';

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return  Scaffold(
      appBar: AppBar(

        title: const Text('Sports'),

        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            onPressed: (){
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Icon(
                  cubit.themeMode==ThemeMode.light ? Icons.brightness_2_outlined : Icons.brightness_2),
              onPressed: (){
                NewsCubit.get(context).changeAppMode();
              },

            ),
          ),
        ],
      ),

      body:Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Language',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                value: dropDownLangValue,
                decoration:  InputDecoration(
                  enabledBorder: OutlineInputBorder( //<-- SEE HERE
                    borderSide: BorderSide(color: NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor,
                        width: 2),
                  ),
                  focusedBorder: OutlineInputBorder( //<-- SEE HERE
                    borderSide: BorderSide(color: NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                dropdownColor: Colors.white,
                  onChanged: (String? newValue){
                    setState(() {
                      dropDownLangValue=newValue!;
                    });
                  },
                items: <String>['English','Arabic'].map<DropdownMenuItem<String>>(
                    (String? value ){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value!,
                          style: TextStyle(
                          color: dropDownLangValue == value ?NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor : Colors.black
                          ),
                        ),
                      );
                    }
                ).toList(),
              ),
            ),
            SizedBox(height: 70,),
            Text(
              'Theme',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                value: dropDownThemeValue,
                decoration:  InputDecoration(
                  enabledBorder: OutlineInputBorder( //<-- SEE HERE
                    borderSide: BorderSide(color: NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor,width: 2),
                  ),
                  focusedBorder: OutlineInputBorder( //<-- SEE HERE
                    borderSide: BorderSide(color: NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                dropdownColor: Colors.white,
                onChanged: (String? newValue){
                  setState(() {
                    dropDownThemeValue=newValue!;
                  });
                },
                items: <String>['Light','Dark'].map<DropdownMenuItem<String>>(
                        (String? value ){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value!,
                          style: TextStyle(
                              color: dropDownThemeValue == value ?
                               NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor:Colors.black,
                          ),
                        ),
                      );
                    }
                ).toList(),
              ),
            ),
        ],
      ),
      ),
    );
  }
}
