import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/style/conts/colors.dart';

class BuildArticleWidget extends StatelessWidget {
dynamic article;
String nullImage;
BuildArticleWidget({required this.article, required this.nullImage});
  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return   BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state){
        return Padding(
          padding:  EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                article["urlToImage"]==null ? nullImage : "${article["urlToImage"]}"
                ,fit: BoxFit.cover,),
              SizedBox(height: 10,),
              Text(
                article["author"] ==null ? '' : "${article["author"]}",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color : cubit.themeMode == ThemeMode.light ?  myMainGreenColor : myMainDarkColor,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                  "${article['title']}",
                  style:Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: 10,),
              Text(
                '${article["publishedAt"].toString().substring(0,10)}',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color : cubit.themeMode == ThemeMode.light ?  myMainGreenColor : myMainDarkColor,
                ),
                textAlign: TextAlign.end,
              ),

            ],
          ),
        );
      },

    );
  }
}
