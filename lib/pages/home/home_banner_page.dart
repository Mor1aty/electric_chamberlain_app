import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class HomeBannerWidget extends StatelessWidget {
  // 图片路径
  List<String> banners = <String>[
    'assets/images/banners/1.jpg',
    'assets/images/banners/2.jpg',
    'assets/images/banners/3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(333),
      child: Swiper(
        itemCount: banners.length,
        scrollDirection: Axis.horizontal,
        autoplay: true,
        pagination: SwiperPagination(),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 5, left: 5, right: 5),
            child: Image.asset(
              banners[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
