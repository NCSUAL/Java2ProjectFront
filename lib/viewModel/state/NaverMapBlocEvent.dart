import 'package:equatable/equatable.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

//NaverMapBloc 이벤트 추상 클래스
abstract class NaverMapBlocEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

//위치 권한 요청 이벤트
class RequestLocationPermission extends NaverMapBlocEvent {}

//NaverMapController 등록 이벤트
class RegisterNaverMapControllerEvent extends NaverMapBlocEvent {
  //위치 권한을 얻고 컨트롤러를 등록해야함
  final NaverMapController naverMapController;

  //컨트롤러는 불변 객체가 아님.
  RegisterNaverMapControllerEvent({required this.naverMapController});
}
