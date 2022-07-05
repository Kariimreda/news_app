class News {
  List<Article> articles = [];
  News.fromList(List<dynamic> list) {
    for (var element in list) {
      articles.add(Article.fromJson(element));
    }
  }
}

class Article {
  String? sourceName;
  String? author;
  String? title;
  String? description;
  String? url;
  String? image;
  String? publishedAt;
  String? content;

  Article.fromJson(Map<String, dynamic> json) {
    sourceName = json['source']['name'];
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    image = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
}
