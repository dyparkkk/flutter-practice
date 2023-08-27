import 'package:attendance_check/LocationPermission.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: FutureBuilder(
          // FutureBuilder -> future를 리턴하는 함수의 결과에 따라서 다시 빌드.
          future: checkPermission(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print('데이터가 있을때 렌더링');
            }

            if(snapshot.hasError) {
              print('에러가 있을때 렌더링');
            }

            // 로딩중일때 랜더링

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == locPermission.denied ||
                snapshot.data == locPermission.deniedForever) {
              return const Center(
                child: Text("위치 권한이 없습니다."),
              );
            }

            return FutureBuilder(
                future: getCurrentLatLng(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  // todo: snapshot.data가 null일 때 처리
                  var data = snapshot.data!;
                  return Column(
                    children: [
                      _MyGoogleMap(initialLatLng: data),
                      const _AttendanceBody(),
                    ],
                  );
                });
          }),
    );
  }

  // checkPermission() async
  Future<locPermission> checkPermission() async {
    final locationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (locationServiceEnabled == false) {
      return locPermission.locationServiceDisabled;
    }

    var locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission == LocationPermission.denied) {
        return locPermission.denied;
      }
    }

    if (locationPermission == LocationPermission.deniedForever) {
      return locPermission.deniedForever;
    }
    return locPermission.granted;
  }

  Future<LatLng> getCurrentLatLng() async {
    final position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text(
        'Attendance Check',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: Colors.blueAccent[200],
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {},
        ),
      ],
    );
  }
}

class _MyGoogleMap extends StatelessWidget {
  final LatLng initialLatLng;

  CameraPosition? initialCameraPosition;

  _MyGoogleMap({required this.initialLatLng}) {
    initialCameraPosition = CameraPosition(target: initialLatLng, zoom: 16);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: GoogleMap(
        initialCameraPosition: initialCameraPosition!,
        myLocationEnabled: true,
      ),
    );
  }
}

class _AttendanceBody extends StatelessWidget {
  const _AttendanceBody();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      flex: 1,
      child: Text("출근하기!"),
    );
  }
}
