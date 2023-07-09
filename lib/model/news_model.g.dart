// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      json['author'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      json['url'] as String?,
      json['urlToImage'] ??
          "https://png.pngtree.com/png-vector/20200224/ourmid/pngtree-colorful-loading-icon-png-image_2152960.jpg",
      json['publishedAt'] as String?,
      json['content'] as String?,
      json['source']['newsId'] as String?,
      json['dateToShow'] as String?,
      json['readingTime'] as String?,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'newsId': instance.newsId,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'dateToShow': instance.dateToShow,
      'readingTime': instance.readingTime,
      'content': instance.content,
    };
