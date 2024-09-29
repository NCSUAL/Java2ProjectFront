import 'package:bloc/bloc.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:java2front/viewModel/event/NaverMapBlocState.dart';
import 'package:java2front/viewModel/state/NaverMapBlocEvent.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';

class NaverMapBloc extends Bloc<NaverMapBlocEvent, NaverMapBlocState> {
  //생성자
  NaverMapBloc() : super(InitNaverMapBlocState()) {
    //위치 권한 이벤트
    on<RequestLocationPermission>(_requestLocationPermission);

    //컨트롤러 등록 이벤트
    on<RegisterNaverMapControllerEvent>(_registerNaverMapControllerEvent);

    //블록이 생성될 때 해당 이벤트 실행 (lazy 옵션)
    add(RequestLocationPermission());
  }

  //컨트롤러 등록 이벤트
  _registerNaverMapControllerEvent(event, emit) async {
    //컨트롤러 등록
    emit(RegisterNaverMapControllerState(
        naverMapController: event.naverMapController));

    // 컨트롤러 설정
    // face: 현재 위치와 방향을 표시하고 지도가 따라감
    event.naverMapController
        .setLocationTrackingMode(NLocationTrackingMode.face);
  }

  //위치 권한 이벤트 메소드
  _requestLocationPermission(event, emit) async {
    //현재 위치 권한 상태 가져옴
    PermissionStatus status = await Permission.location.status;

    switch (status) {
      case PermissionStatus.denied:
        //권한 요청
        status = await Permission.location.request();
        emit(RefuseLocationPermissionState());
        break;

      case PermissionStatus.permanentlyDenied:
        // 영구적으로 거부된 경우 설정으로 이동하도록 안내
        await openAppSettings();
        emit(RefuseLocationPermissionState());
        break;

      case PermissionStatus.granted:
        //위치 권한 허용
        emit(AcceptLocationPermissionState());

      default:
        //예기치 않은 오류
        log("NavermapBloc -> RequestLocationPermission: 예기치 않은 오류");
        break;
    }
  }
}
