import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/reuseable_components/components.dart';
import 'package:news_app/style/conts/colors.dart';

class PoliticssScreen extends StatelessWidget {
  static const String routName = 'politics screen';
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create:(context)=> NewsCubit()..getPolitics(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state){},
        builder: (context, state){
          var list = NewsCubit.get(context).politics;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Politics'),
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
            body:ConditionalBuilder(
              condition: state is! GetPoliticsLoadingState ,
              builder: (context)=> ListView.separated(
                  itemBuilder:(context, index)=> BuildArticleWidget(
                      article: list[index],
                  nullImage: "https://www.pakistangulfeconomist.com/wp-content/uploads/2018/07/Political-News-1.jpg",),
                  separatorBuilder: (context,index)=>Divider(height: 1,),
                  itemCount: list.length
              ),

              fallback: (context)=>Center(child: CircularProgressIndicator(
                  color: myMainGreenColor,
              ),),
            ),
          );
        },

      ),
    );
  }
}
