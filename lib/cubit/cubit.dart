import 'dart:math';

import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/style/conts/api_url/api_url.dart';

class NewsCubit extends Cubit<NewsStates>{

  NewsCubit() : super (NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);


  List <dynamic>sports=[];

  void getSports(){
    emit(GetSportsLoadingState());
    DioHelper.getData(
        url: apiUrl,
        query: {
          "country": "us",
          "category" : "sports",
          "apiKey" :"f664ed17c384485490b22ba71c8aba77",
        }).then((value) {
      sports = value?.data["articles"];
      print(sports[0]["title"]);
      emit(GetSportsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetSportsErrorState(error.toString()));
    });
  }

  List<dynamic>politics=[];

  void getPolitics(){
    emit(GetPoliticsLoadingState());
    DioHelper.getData(
        url: apiUrl,
        query: {
          "country" : "us",
          "category" :"politics",
          "apiKey": "f664ed17c384485490b22ba71c8aba77"
        }
    ).then((value) {
      politics =value?.data["articles"];
      print(politics[0]["title"]);
      emit(GetPoliticsSuccessState());
    }).catchError((error){
      print(error.toString());
      print(politics[0]["description"]);
      emit(GetPoliticsErrorState(error));
    });

  }

   List<dynamic> health =[];

  void getHealth(){
    emit(GetHealthLoadingState());
    DioHelper.getData(
        url: apiUrl,
        query: {
          "country":"us",
          "category": "health",
          "apiKey":"f664ed17c384485490b22ba71c8aba77",
        }
    ).then((value) {
      health= value?.data["articles"];
      emit(GetHealthSuccessState());
    }).catchError(
        (error){
          print(error.toString());
          emit(GetHealthErrorState(error));
        }
    );
  }

   List<dynamic> business=[];

  void getBusiness(){
    emit(GetBusinessLoadingState());
    DioHelper.getData(
        url: apiUrl,
        query: {
          "country":"us",
          "category":"business",
          "apiKey":"f664ed17c384485490b22ba71c8aba77",
        }).then((value) {
          business=value?.data["articles"];
          emit(GetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(GetBusinessErrorState(error));
    });
  }

  List<dynamic>science=[];

   void getScience(){
     emit(GetScienceLoadingState());
     DioHelper.getData(
         url: apiUrl,
         query: {
           "country":"us",
           "category":"science",
           "apiKey":"f664ed17c384485490b22ba71c8aba77",
         }).then((value) {
           science=value?.data["articles"];
           emit(GetScienceSuccessState());
     }).catchError((error){
       print(error.toString());
       emit(GetScienceErrorState(error));
     });
   }


}