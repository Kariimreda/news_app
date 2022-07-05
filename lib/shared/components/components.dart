import 'package:flutter/material.dart';
import 'package:news_application/models/news_model.dart';

Widget BuildArticlesItems(News news, index, context) => SafeArea(
      child: InkWell(
        onTap: () {
          // NavigateTo(context, WebViewExample());
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                  width: 120.0,
                  height: 120.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image:
                          NetworkImage(news.articles[index].image.toString()),
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(width: 20.0),
              Expanded(
                child: Container(
                  height: 120.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          news.articles[index].title.toString(),
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        news.articles[index].publishedAt.toString(),
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget defultTextFormFiled({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onchange,
  Function? ontap,
  required String? Function(String?) validate,
  String? label,
  String? hint,
  IconData? suffix,
  IconData? prefix,
}) =>
    Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        onFieldSubmitted: (s) {
          onSubmit!();
        },
        onChanged: (s) {
          onchange!();
        },
        onTap: () {
          ontap!();
        },
        validator: (s) {
          validate(s!);
        },
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          prefixIcon: Icon(prefix),
          suffixIcon: Icon(suffix),
          border: OutlineInputBorder(borderSide: BorderSide(width: 8.0)),
        ),
      ),
    );

void NavigateTo(Context, Widget) {
  Navigator.push(Context, MaterialPageRoute(builder: (Context) => Widget));
}

