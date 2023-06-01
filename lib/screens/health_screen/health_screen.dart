import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/reuseable_components/build_article_widget.dart';
import 'package:news_app/style/conts/colors.dart';

class HealthScreen extends StatelessWidget {
  static const String routName = 'health screen';
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state){
        var list = NewsCubit.get(context).health;
        var cubit = NewsCubit.get(context);
        return Scaffold(
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

            body: ConditionalBuilder(
            condition: state is! GetHealthLoadingState,
            fallback: (context)=>Center(child: CircularProgressIndicator(
              color: NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor,
            )),
            builder: (context) =>
                ListView.separated(
                  itemBuilder: (context, index)=>BuildArticleWidget(
                      article: list[index],
                      nullImage: "https://www.shutterstock.com/shutterstock/photos/148057970/display_1500/stock-photo-health-news-148057970.jpg"
                  ),
                    separatorBuilder: (context,index)=>Divider(height: 1,),
                  itemCount: list.length,
                ),

          )
        );
      },

    );
  }
}
