class Api {
  //定義根路徑
  static const String BASE_URL = 'https://www2.taimall.com.tw/tmgear/appinfo2.asmx';
  //主頁Icon
  static const String HOME_PAGE_ICON = BASE_URL + '/getinfo?&action=homepage&data=201905160000&pid=954f61ce-bae5-41b5-bcc9-12adc0ca3922&version=v2';
  //主頁廣告輪播
  static const String HOME_PAGE_AD = BASE_URL + '/getinfo?&action=banner&data=201904160000&pid=954f61ce-bae5-41b5-bcc9-12adc0ca3922&version=v2';
  //MORE利卡點數兌換列表
  static const String  MORE_POINT = BASE_URL + '/getinfo?&pid=954f61ce-bae5-41b5-bcc9-12adc0ca3922&action=giftlist&data=201411220911&version=v2';
  //檔期促銷
  static const String PROMOTION = BASE_URL + '/profiles/productionsList/getinfo?&pid=954f61ce-bae5-41b5-bcc9-12adc0ca3922&action=schsale&data=201601010000&version=v2';
  //訊息快報
  static const String MESSAGE = BASE_URL + '/getinfo?&pid=954f61ce-bae5-41b5-bcc9-12adc0ca3922&action=pushinfo&data=000000000000&version=v2';
  //會員權益
  static const String member = BASE_URL + '/getinfo?&pid=954f61ce-bae5-41b5-bcc9-12adc0ca3922&action=morecard&data=201412041500&version=v2';
  //超值商品列表
  static const String value_list = BASE_URL + '/getinfo?&action=appsale&data=201902070000&pid=954f61ce-bae5-41b5-bcc9-12adc0ca3922&version=v2';
  //超值商品數量
  static const String volue_quantity = BASE_URL + '/getinfo?&action=appsale&data=pageview&pid=954f61ce-bae5-41b5-bcc9-12adc0ca3922&version=v2';
  //贈品處等待人數
  static const String waiting_number = BASE_URL + '/getinfo?&pid=954f61ce-bae5-41b5-bcc9-12adc0ca3922&action=waiting&data=201408131030&version=v2';
  //美食推薦
  static const String food = BASE_URL + '/getinfo?&action=foodweb&data=000000000000&pid=954f61ce-bae5-41b5-bcc9-12adc0ca3922&version=v2';
  //潮流觀點
  static const String fashion = BASE_URL + '/getinfo?&action=vogue&data=201501010101&pid=954f61ce-bae5-41b5-bcc9-12adc0ca3922&version=v2';
}