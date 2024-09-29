import 'package:equatable/equatable.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

//NaverMapBloc 상태(state) 추상 클래스
abstract class NaverMapBlocState extends Equatable {
  //상태 관리 할 필드
  //위치 권한을 받기 전엔 null이여야 함
  final NaverMapController? naverMapController;

  //추상클래스는 인스턴스화 되지 않음
  const NaverMapBlocState({required this.naverMapController});

  //getter
  @override
  // TODO: implement props
  List<Object?> get props => [naverMapController];
}

//NaverMapBloc 초기화 생태
class InitNaverMapBlocState extends NaverMapBlocState {
  const InitNaverMapBlocState() : super(naverMapController: null);
}

//위치 권한 거부 상태
class RefuseLocationPermissionState extends NaverMapBlocState {
  const RefuseLocationPermissionState() : super(naverMapController: null);
}

//위치 권한 허용 상태
class AcceptLocationPermissionState extends NaverMapBlocState {
  const AcceptLocationPermissionState() : super(naverMapController: null);
}

//컨트롤러 등록 상태
class RegisterNaverMapControllerState extends NaverMapBlocState {
  const RegisterNaverMapControllerState({required super.naverMapController});
}
