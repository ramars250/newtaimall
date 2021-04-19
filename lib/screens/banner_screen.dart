import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newtaimall/widgets/webviewservice.dart';

import '../config/api.dart';
import '../providers/banner.dart';

class BannerScreen extends StatefulWidget {
  @override
  _BannerScreenState createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  //設置bannerItem列表用來放置banner內資料
  BannerItem bannerItem;

  int curIndex = 0;
  //設置banner的Api網址
  final url = Uri.parse(Api.HOME_PAGE_AD);
  //設置輪播控制器
  PageController _pageController;
  //設置自動輪播定時器
  Timer _timer;
  //設置頁面圖片
  // List _bannerPage = [];
  @override
  void initState() {
    super.initState();
    getBannerData();
    _pageController = PageController(initialPage: curIndex);
    setTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        buildPageViewWidget(),
      ],
    );
  }
  //建立banner顯示畫面
  Widget buildPageViewWidget() {
    var length = bannerItem.data.length;
    return Container(
      //設置容器高度為裝置的1/3
      height: MediaQuery.of(context).size.height / 3,
      //設置容器寬度為裝置寬度
      width: MediaQuery.of(context).size.width,
      //對齊方式為置中
      alignment: Alignment.center,
      child: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              curIndex = index;
              if (index == 0) {
                curIndex = length;
              }
            });
          },
          itemBuilder: (context, index) {
            return GestureDetector(
              onPanDown: (details) {
                _cancelTimer();
              },
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WebViewService(
                          link: bannerItem.data[index % length].bannerLink,
                        )));
                return curIndex;
              },
              child: Image.network(
                bannerItem.data[index % length].bannerImage,
                fit: BoxFit.cover,
              ),
            );
          }),
    );
  }
  //建立取得廣告資料函數getBannerData
  Future getBannerData() async {
    //獲取Api內banner的資料
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //獲取json字串並轉為Banner物件
      Map<String, dynamic> jsonMap = json.decode(response.body);
      bannerItem = BannerItem.fromJson(jsonMap);
      //解析json返回的類別
      bannerItem.data.forEach((value) => print(bannerItem.data[0].bannerId));
      return bannerItem;
    } else {
      throw Exception('Failed to load Data');
    }
  }
  //設置定時器
  setTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(Duration(seconds: 3), (t) {
        curIndex++;
        _pageController.animateToPage(
          curIndex,
          duration: Duration(milliseconds: 300),
          curve: Curves.linear,
        );
      });
    }
  }
  //取消定時器
  _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
      _timer = null;
      setTimer();
    }
  }
}
