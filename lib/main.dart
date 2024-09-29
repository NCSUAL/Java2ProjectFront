import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:java2front/view/Home.dart';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:java2front/view/etc/LocationPermissionDeny.dart';
import 'package:java2front/viewModel/bloc/NaverMapBloc.dart';
import 'package:java2front/viewModel/event/NaverMapBlocState.dart';

void main() async {
  //네이버 지도 초기화 기다림
  await _initialize();

  return runApp(MultiBlocProvider(
      providers: [
        //NaverMapBloc 주입(DI)
        //lazy: bloc이 생성될 때 이벤트를 실행함
        BlocProvider(create: (context) => NaverMapBloc(), lazy: true)
      ],
      child: MaterialApp(
        home: BlocBuilder<NaverMapBloc, NaverMapBlocState>(
            builder: (context, state) {
          //현재 상태가 위치 권한 허용 상태가 아니라면
          if (state is RefuseLocationPermissionState) {
            return LocationPermissionDeny();
          }
          //현재 상태가 위치 권한 허용 상태이면
          else {
            return Home();
          }
        }),
      )));
}

//네이버 지도 초기화
Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
      clientId: '0f9mwavxum', // 클라이언트 ID 설정
      onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed"));
}
