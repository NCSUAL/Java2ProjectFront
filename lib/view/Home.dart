import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final thisWeight = MediaQuery.of(context).size.width;
    final thisHeight = MediaQuery.of(context).size.height;

    double fontsize =
        thisWeight > thisHeight ? thisWeight * 0.035 : thisHeight * 0.025;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: thisWeight,
        height: thisHeight,
        child: Column(
          children: [
            SizedBox(
              height: thisHeight * 0.12,
            ),
            Text(
              '자바2 프로젝트 프론트',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF171B1C),
                fontSize: fontsize,
                fontFamily: 'Gmarket',
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
            Flexible(
                child: NaverMap(
              options: NaverMapViewOptions(
                  minZoom: 15.5, locationButtonEnable: true),
            ))
          ],
        ),
      ),
    ));
  }
}
