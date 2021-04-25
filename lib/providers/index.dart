import 'package:flutter/foundation.dart';

class IndexItem {
  bool success;
  List<IndexData> indexData;
  String message;

  IndexItem({
    @required this.success,
    @required this.indexData,
    @required this.message,
  });

  IndexItem.fromJson(Map<String, dynamic> json) {
    success = json['Success'];
    if (json['Data'] != null) {
      indexData = [];
      json['Data'].forEach((v) {
        indexData.add(new IndexData.fromJson(v));
      });
    }
    message = json['Message'];
  }
  Map<String, dynamic> toJson() {
   final Map<String, dynamic> data = new Map<String, dynamic> ();
   if (this.indexData != null) {
     data['Data'] = this.indexData.map((v) => v.toJson()).toList();
   }
   return data;
  }
  // factory IndexItem.fromJson(Map<String, dynamic> json) {
  //   List<IndexData> dataList = (json['Data'] as List)
  //       .map((indexData) => IndexData.fromJson(indexData))
  //       .toList();
  //   return IndexItem(
  //     success: json['Success'],
  //     data: dataList,
  //     message: json['Message'],
  //   );
  // }
}

class IndexData {
  int id;
  String type;
  String title;
  String postDate1;
  String postDate2;
  String imageUrl;
  String redirectUrl;
  int sort;

  IndexData({
    @required this.id,
    @required this.type,
    @required this.title,
    @required this.postDate1,
    @required this.postDate2,
    @required this.imageUrl,
    @required this.redirectUrl,
    @required this.sort,
  });

  IndexData.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        type = json['type'];
        title = json['title'];
        postDate1 = json['post_date1'];
        postDate2 = json['post_date2'];
        imageUrl = json['image_url'];
        redirectUrl = json['redirect_url'];
        sort = json['sort'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['title'] = this.title;
    data['post_date1'] = this.postDate1;
    data['post_date2'] = this.postDate2;
    data['image_url'] = this.imageUrl;
    data['redirect_url'] = this.redirectUrl;
    data['sort'] = this.sort;
    return data;
  }
}
