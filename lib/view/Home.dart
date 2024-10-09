import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:java2front/viewModel/bloc/NaverMapBloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:java2front/viewModel/event/NaverMapBlocState.dart';
import 'package:java2front/viewModel/state/NaverMapBlocEvent.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final thisWeight = MediaQuery.of(context).size.width;
    final thisHeight = MediaQuery.of(context).size.height;

    double fontsize =
        thisWeight > thisHeight ? thisWeight * 0.035 : thisHeight * 0.021;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            BlocBuilder<NaverMapBloc, NaverMapState>(builder: (context, state) {
              return NaverMap(
                options: state.naverMapViewOptions!,
                onMapReady: (NaverMapController controller) {
                  //현재 위치를 받아오기 위해 위치 권한을 먼저 허용 해야 하고
                  //NaverMap이 그려진 다음에 컨트롤러를 초기화 해야함
                  context.read<NaverMapBloc>().add(
                      RegisterNaverMapControllerEvent(
                          naverMapController: controller));
                },
              );
            }),
            Container(
              decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25)))),
              width: thisWeight,
              height: thisHeight * 0.05,
              child: Center(
                child: Text(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
