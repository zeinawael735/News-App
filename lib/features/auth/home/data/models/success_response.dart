class SuccessResponseModel {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  SuccessResponseModel({this.status, this.totalResults, this.articles});

  SuccessResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }


}

class Articles {

  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;

  String? content;

  Articles(
      {
        this.author,
        this.title,
        this.description,
        this.url,
        this.urlToImage,

        this.content});

  Articles.fromJson(Map<String, dynamic> json) {

    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];

    content = json['content'];
  }

}
