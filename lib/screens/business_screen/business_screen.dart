import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/shared/reuseable_components/components.dart';

class BusinessScreen extends StatelessWidget {
  static const String routName = 'business screen';
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>NewsCubit().. getBusiness(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context, state){
          var list =NewsCubit.get(context).business;
          return  Scaffold(
            appBar: AppBar(
              title: const Text('Business'),
              leading: const Icon(
                Icons.menu,
                size: 34,
              ),
              actions: [
                const Padding(
                  padding: EdgeInsets.only(right: 12.0),
                  child: Icon(
                    Icons.search,
                    size: 34,

                  ),
                ),
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! GetBusinessLoadingState,
              fallback: (context)=> Center(child: CircularProgressIndicator(),),
              builder: (context)=> ListView.separated(
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context,index)=>Divider(height: 1,),
                itemCount: list.length,
                itemBuilder: (context,index)=>BuildArticleWidget(
                    article: list[index],
                     nullImage: "https://media.istockphoto.com/id/469186784/photo/newspaper-with-the-headline-business-news.jpg?s=1024x1024&w=is&k=20&c=VJiG7cNgAVKbQYzwtNWchHq0zdYAP_VftOT-VZb0W48="

                ),
              ) ,
            )
          );
        },

      ),
    );
  }
}
