import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/models/news_model.dart';
import 'package:news_application/modules/business/business.dart';
import 'package:news_application/modules/science/science.dart';
import 'package:news_application/modules/sports/sports.dart';
import 'package:news_application/shared/cubit/states.dart';
import 'package:news_application/shared/network/remote/dio_helper.dart';
import 'package:news_application/shared/network/remote/end_points.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screens = [
    const BuisnessScreen(),
    const SportsScreen(),
    const ScienceScreen(),
  ];

  void ChangeBottomNav(int index) {
    currentIndex = index;

    emit(NewsChangePageState());
  }

  News? news;
  void getTopHeadLines() {
    emit(NewsGetHeadLinesLoadingState());
    DioHelper.getData(url: topHeadlines, query: {
      "country": "eg",
      "apiKey": apiKey,
    }).then((value) {
      news = News.fromList(value.data['articles']);
      print(news!.articles[1].title);
      emit(NewsGetHeadLinesSuccessState());
    }).catchError((onError) {
      emit(NewsGetHeadLinesErrorState());
    });
  }

  News? searchedNews;
  void searchNews(String val) {
    emit(NewsGetSearchedNewsLoadingState());
    DioHelper.getData(url: everyThing, query: {
      "q": val,
      "apiKey": apiKey,
    }).then((value) {
      searchedNews = News.fromList(value.data['articles']);
      print(searchedNews!.articles[1].title);
      emit(NewsGetSearchedNewsSuccessState());
    }).catchError((onError) {
      emit(NewsGetSearchedNewsErrorState());
    });
  }

  News? categoryN;
  void categoryNews(String category) {
    emit(NewsGetCategoryLoadingState());
    DioHelper.getData(url: topHeadlines, query: {
      "country": "eg",
      "category": category,
      "apiKey": apiKey,
    }).then((value) {
      categoryN = News.fromList(value.data['articles']);
      //print(categoryN!.articles[1].title);
      emit(NewsGetCategorySuccessState());
    }).catchError((onError) {
      emit(NewsGetCategoryErrorState());
    });
  }

  bool isDark = false;

  void ChangeAppMode() {
    isDark = !isDark;
    emit(ChangeAppModeState());
  }
}
