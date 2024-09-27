import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:java2front/view/Home.dart';
import 'dart:developer';

void main() async {
  //네이버 지도 초기화 기다림
  await _initialize();

  return runApp(MaterialApp(
    home: Home(),
  ));
}

//네이버 지도 초기화
Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
      clientId: '', // 클라이언트 ID 설정
      onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed"));
}
