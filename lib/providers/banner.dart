import 'package:flutter/foundation.dart';

class BannerItem {
  bool success;
  List<BannerData> data;
  String message;

  BannerItem({
    @required this.success,
    @required this.data,
    @required this.message,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    List<BannerData> dataList = (json['Data'] as List)
        .map((bannerData) => BannerData.fromJson(bannerData))
        .toList();
    return BannerItem(
      success: json['Success'],
      data: dataList,
      message: json['Message'],
    );
  }
}

class BannerData {
  int bannerId;
  String bannerImage;
  String bannerLink;

  BannerData({
    @required this.bannerId,
    @required this.bannerImage,
    @required this.bannerLink,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) {
    return BannerData(
        bannerId: json['banner_id'],
        bannerImage: json['banner_image'],
        bannerLink: json['banner_link']);
  }
}

