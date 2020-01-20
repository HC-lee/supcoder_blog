import 'package:supcoder_blog/common/api.dart';

import 'HttpUtils.dart';
import 'dart:convert';
class DHttp{

  //请求首页banner
   dynamic sendMainBanner()async{

    var data = await get(UrlAddress.mainBannerUrl);
    if(data != null) {
//     var obj  = await json.decode(data,);
//     var arr = await  obj['data'];
//     List list = await json.decode(arr);
//    List<CardBean> cardbeanList = data.map((m) => new CardBean.fromJson(m)).toList();
//    CardBean cardBean = cardbeanList.first;
//     print("解析数据${arr[0]}\t${list.length}");

     return data;

   }

  }

}