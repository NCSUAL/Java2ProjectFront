import 'package:flutter/material.dart';

class LocationPermissionDeny extends StatelessWidget {
  const LocationPermissionDeny({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("위치 권한 허용좀"),
      ),
    );
  }
}
