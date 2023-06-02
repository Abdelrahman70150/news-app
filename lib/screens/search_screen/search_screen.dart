import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/reuseable_components/build_article_widget.dart';
import 'package:news_app/style/conts/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
static const String routName ='searchScreen';
  @override
  Widget build(BuildContext context) {
    var list =NewsCubit.get(context).search;
    var cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context,state){
        return  Scaffold(
          appBar: AppBar(
            title: SizedBox(
              height: 50,
              width: 270,
              child: TextFormField(
                style:Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 15,
                  color: NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor,
                ),
                cursorColor: NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor,
                cursorHeight: 20,
                onChanged: (value){
                  cubit.getSearch(value);
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Search!',
                    hintStyle: TextStyle(
                      color: NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor,
                    ),
                    focusColor: NewsCubit.get(context).themeMode == ThemeMode.light ? myMainGreenColor : myMainDarkColor,

                ),
              ),
            ),
          actions: [
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
          condition: list.isNotEmpty ,
          builder: (context)=> ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index)=> BuildArticleWidget(
                  article: list[index],
                  nullImage: "https://media.istockphoto.com/id/1182477852/photo/breaking-news-world-news-with-map-backgorund.jpg?s=612x612&w=0&k=20&c=SQfmzF39HZJ_AqFGosVGKT9iGOdtS7ddhfj0EUl0Tkc="),
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
