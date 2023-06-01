import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/reuseable_components/build_article_widget.dart';
import 'package:news_app/style/conts/colors.dart';

class SportsScreen extends StatelessWidget {
static const String routName = 'sports screen';
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context, state){
        var cubit = NewsCubit.get(context);
        var list =NewsCubit.get(context).sports;
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
                  cubit.themeMode==ThemeMode.light ? Icons.brightness_2_outlined : Icons.brightness_2
                  ),
                  onPressed: (){
                    NewsCubit.get(context).changeAppMode();
                  },

                ),
              ),
            ],
          ),
          body:ConditionalBuilder(
            condition: state is! GetSportsLoadingState ,
            builder: (context)=> ListView.separated(
              physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=> BuildArticleWidget(
                    article: list[index],
                nullImage: "https://media.istockphoto.com/id/995133698/vector/background-screen-saver-on-soccer-sports-news-sports-news-live-on-world-map-background.jpg?s=612x612&w=0&k=20&c=kTjV3OcONpNQw3QhShzQmALMmUp7jTA2gOUis-URQfs="),
                separatorBuilder: (context,index)=>Divider(height: 1,),
                itemCount: list.length
            ),
            fallback: (context)=>Center(child: CircularProgressIndicator(
                color: NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor,
            )),
          ),
        );
      },

    );
  }
}
