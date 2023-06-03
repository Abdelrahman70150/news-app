import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/screens/search_screen/search_screen.dart';
import 'package:news_app/screens/webview_screen/webview_screen.dart';
import 'package:news_app/style/conts/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailsScreen extends StatelessWidget {
static const routName = 'DetailsScreen';

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context , state){
        var cubit = NewsCubit.get(context);
        return  Scaffold(
          appBar: AppBar(
            title: const Text('News App'),
            actions: [
              IconButton(
                icon: Icon(
                  cubit.themeMode==ThemeMode.light ? Icons.brightness_2_outlined : Icons.brightness_2,
                ),
                onPressed: (){
                  NewsCubit.get(context).changeAppMode();
                },

              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 15,),
                  Image.network("${cubit.urlToImage}"),
                  SizedBox(height: 15,),
                  Text("${cubit.authorName}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color : cubit.themeMode == ThemeMode.light ?  myMainGreenColor : myMainDarkColor,
                    ),),
                  SizedBox(height: 10,),
                  Text("${cubit.title}",
                      style:Theme.of(context).textTheme.bodyMedium),
                  SizedBox(height: 10,),
                  Text('${cubit.puplishedAt}',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color : cubit.themeMode == ThemeMode.light ?  myMainGreenColor : myMainDarkColor,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text(
                      cubit.content.length<150 ? cubit.content: cubit.content.substring(0,200),
                     style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize:15,
                     wordSpacing:3,
                     height:2),
                  ),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: (){
                            Navigator.pushNamed(context, WebViewScreen.routName);
                          },
                          child: Text(
                              'View Full Article',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color : cubit.themeMode == ThemeMode.light ?  myMainGreenColor : myMainDarkColor,
                            ),
                          ),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color : cubit.themeMode == ThemeMode.light ?  myMainGreenColor : myMainDarkColor,)
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
