import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/layout/newsLayout.dart';
import 'package:news_application/shared/cubit/blocObserver.dart';
import 'package:news_application/shared/cubit/cubit.dart';
import 'package:news_application/shared/cubit/states.dart';
import 'package:news_application/shared/network/local/cash_Helper.dart';
import 'package:news_application/shared/network/remote/dio_helper.dart';
import 'package:news_application/shared/styles/theme.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Byt2aked n kul haga flmain khelset b3den byrun lapplictaion
  DioHelper.init();
  await CashHelper.init();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getTopHeadLines(),
      child: BlocConsumer<NewsCubit, NewsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: NewsCubit.get(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const NewsAppLayoutScreen(),
            );
          }),
    );
  }
}
