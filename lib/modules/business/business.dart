import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/shared/components/components.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class BuisnessScreen extends StatelessWidget {
  const BuisnessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(listener: (context, state) {
      if (State == NewsGetCategoryLoadingState()) {
        const CircularProgressIndicator();
      }
    }, builder: (context, state) {
      NewsCubit.get(context).categoryNews("business");
      var data = NewsCubit.get(context).categoryN;
      if (State == NewsGetCategoryLoadingState()) {
        const CircularProgressIndicator(
          color: Color.fromARGB(255, 221, 52, 0),
        );
      }
      return SafeArea(
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return data != null
                  ? BuildArticlesItems(data, index, context)
                  : Container();
            },
            separatorBuilder: (context, index) =>
                const Padding(padding: EdgeInsets.all(5.0)),
            itemCount: NewsCubit.get(context).categoryN!.articles.length),
      );
    });
  }
}
