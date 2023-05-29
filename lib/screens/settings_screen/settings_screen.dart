import 'package:flutter/material.dart';
import 'package:news_app/style/conts/colors.dart';

class SettingsScreen extends StatefulWidget {
  static const String routName = 'settings screen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String dropDownValue='English';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: const Icon(
          Icons.menu,
          size: 34,
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.search,
              size: 34,

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
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButtonFormField(
                value: dropDownValue,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder( //<-- SEE HERE
                    borderSide: BorderSide(color: myMainGreenColor, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder( //<-- SEE HERE
                    borderSide: BorderSide(color: myMainGreenColor, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                dropdownColor: Colors.white,
                  onChanged: (String? newValue){
                    setState(() {
                      dropDownValue=newValue!;
                    });
                  },
                items: <String>['English','Arabic'].map<DropdownMenuItem<String>>(
                    (String? value ){
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value!,
                          style: TextStyle(
                          color: dropDownValue == value ? myMainGreenColor : Colors.black
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