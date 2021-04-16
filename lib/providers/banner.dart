import 'package:flutter/foundation.dart';


class BannerItem {
  bool success;
  List<Data> data;
  String message;

  BannerItem({
    @required this.success,
    @required this.data,
    @required this.message,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    List<Data> dataList = (json['Data'] as List)
        .map((bannerData) => Data.fromJson(bannerData))
        .toList();
    return BannerItem(
      success: json['Success'],
      data: dataList,
      message: json['Message'],
    );
  }
}

class Data {
  int bannerId;
  String bannerImage;
  String bannerLink;

  Data({
    @required this.bannerId,
    @required this.bannerImage,
    @required this.bannerLink,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        bannerId: json['banner_id'],
        bannerImage: json['banner_image'],
        bannerLink: json['banner_link']);
  }
}

// class Banner with ChangeNotifier {
//   List<Data> _items = [];
// Future getBannerData(url) async {
//   final response = await http.get(url);
//   if (response.statusCode == 200) {
//     final data = jsonDecode(response.body);
//     final bannerDataFromJson = BannerItem.fromJson(data);
//   } else {
//     throw Exception('Failed to load Data');
//   }
//   // notifyListeners();
// }
// }
