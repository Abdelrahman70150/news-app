import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/reuseable_components/components.dart';

class ScienceScreen extends StatelessWidget {
  static const String routName = 'science screen';
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>NewsCubit()..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state){
          var list = NewsCubit.get(context).science;
          return Scaffold(
            appBar: AppBar(
              title: const Text('Science'),
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
            body:  ConditionalBuilder(
              condition: state is! GetScienceLoadingState,
              fallback: (context)=>Center(child: CircularProgressIndicator(),),
              builder: (context)=>ListView.separated(
                itemCount: list.length,
                separatorBuilder: (context, index)=>Divider(height:1 ,),
                itemBuilder: (context, index)=>BuildArticleWidget(
                    article: list[index],
                    nullImage: "https://www.sciencenews.org/wp-content/uploads/2019/08/sn-fallback.png"),
              ),
            )
          ) ;
        },

      ),
    );
  }
}
