import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../providers/index.dart' as topnavigator;
import '../config/api.dart';

class TopNavigator extends StatefulWidget {
  @override
  _TopNavigatorState createState() => _TopNavigatorState();
}

class _TopNavigatorState extends State<TopNavigator> {
  //建立圖標Api網址
  final url = Uri.parse(Api.HOME_PAGE_ICON);

  //設置indexList放置IndexItem資料
  List<topnavigator.IndexData> indexList;

  int index = 1;

  List<Widget> list = [];

  @override
  void initState() {
    getIndexIconData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(8),
          child: FutureBuilder(
            future: getIndexIconData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var data = snapshot.data;
                print(data[index].title);
                for (index = 1; index < data.length; index++) {
                  list.add(
                    Column(children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: Image.network('${data[index].imageUrl}'),
                      ),
                      Text(
                        '${data[index].title}',
                      ),
                    ]),
                  );
                }
              } else {
                print('Error');
              }
              return GridView.count(
                crossAxisCount: 4,
                padding: EdgeInsets.all(5),
                children: list,
              );
            },
          ),
        ),
      ),
    );
  }

  Future getIndexIconData() async {
    //獲取Api內主頁ICON資料
    final response = await http.get(url);
    if (response.statusCode == 200) {
      //獲取json字串並轉為Banner物件
      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      setState(() {
        indexList = topnavigator.IndexItem.fromJson(jsonMap).indexData;
        //解析json返回的類別
        indexList.forEach((value) => print(indexList[index].id));
      });
    } else {
      throw Exception('Failed to load Data');
    }
    // print(indexList);
    return indexList;
  }
}
