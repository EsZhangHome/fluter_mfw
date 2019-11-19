import 'package:flutter/material.dart';
import 'package:flutter_mfw/pages/travel/widget/travel_banner_widget.dart';
import 'package:flutter_mfw/pages/travel/widget/travel_grid_widget.dart';
import 'package:flutter_mfw/pages/travel/widget/travel_recommend_widget.dart';
import 'package:flutter_mfw/pages/travel/widget/travel_everyday_widget.dart';


import 'package:flutter_mfw/dao/travel_dao.dart';
import 'package:flutter_mfw/model/travel_header_model.dart';
class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {


  //轮播图信息
  var _bannerData = BannerData();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  void _getData(){

    TravelHeaderDao.fetch().then((response){
      setState(() {

        for(var item in response.data.bannerList){
          if(item.style == "banner"){
            _bannerData = item.bannerData;
          }
        }
      });

      }
    ).catchError((error){
      print(error);
    });

  }

  @override
  Widget build(BuildContext context) {




    return ListView(
      children: <Widget>[
        TravelBannerWidget(
          bannerData: _bannerData,
        ),
        TravelGridWidget(),
        TravelRecommendWidget(),
        TravelEverydayWidget()
      ],
    );
  }
}
