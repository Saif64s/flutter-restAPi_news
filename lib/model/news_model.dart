import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class NewsModel {
  final String? newsId;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? dateToShow;
  final String? readingTime;
  final String? content;

  NewsModel(
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.newsId,
    this.dateToShow,
    this.readingTime,
  );

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);

  static List<NewsModel> newsFromSnapshot(List newSnapshot) {
    return newSnapshot.map((json) {
      return NewsModel.fromJson(json);
    }).toList();
  }
}
