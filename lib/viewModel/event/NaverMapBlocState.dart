import 'package:equatable/equatable.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

//NaverMapBloc 상태(state) 추상 클래스
abstract class NaverMapState extends Equatable {
  //상태 관리 할 필드
  //위치 권한을 받기 전엔 null이여야 함
  final NaverMapController? naverMapController;

  //naverView 옵션
  final NaverMapViewOptions? naverMapViewOptions;

  //추상클래스는 인스턴스화 되지 않음
  const NaverMapState(
      {required this.naverMapController, required this.naverMapViewOptions});

  //getter
  @override
  // TODO: implement props
  List<Object?> get props => [naverMapController];
}

//NaverMapBloc 초기화 생태
class InitNaverMapState extends NaverMapState {
  const InitNaverMapState()
      : super(
            naverMapController: null,
            naverMapViewOptions: const NaverMapViewOptions());
}

//위치 권한 거부 상태
class RefuseLocationPermissionState extends NaverMapState {
  const RefuseLocationPermissionState()
      : super(
            naverMapController: null,
            naverMapViewOptions: const NaverMapViewOptions());
}

//위치 권한 허용 상태
class AcceptLocationPermissionState extends NaverMapState {
  const AcceptLocationPermissionState()
      : super(
            naverMapController: null,
            naverMapViewOptions: const NaverMapViewOptions());
}

//컨트롤러 등록 상태
class RegisterNaverMapControllerState extends NaverMapState {
  const RegisterNaverMapControllerState(
      {required super.naverMapController, required super.naverMapViewOptions});
}
