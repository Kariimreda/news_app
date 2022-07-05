import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/shared/components/components.dart';
import 'package:news_application/shared/cubit/cubit.dart';
import 'package:news_application/shared/cubit/states.dart';

class NewsAppLayoutScreen extends StatelessWidget {
  const NewsAppLayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        if (State == NewsGetCategoryLoadingState()) {
          const CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            //centerTitle: true,
            title: const Text('News App'),
            actions: [

              IconButton(
                  onPressed: () {
                    NewsCubit.get(context).ChangeAppMode();
                  },
                  icon: Icon(
                    Icons.brightness_4_outlined,
                    color: NewsCubit.get(context).isDark
                        ? Colors.white
                        : Colors.black,
                  ))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.ChangeBottomNav(index);
            },
            items: cubit.bottomItems,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
