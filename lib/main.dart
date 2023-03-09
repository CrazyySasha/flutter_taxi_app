import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

void main() {
  AndroidYandexMap.useAndroidViewSurface = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initRoute();
  }

  initRoute() async {
    DrivingSessionResult result = await YandexDriving.requestRoutes(
      points: [
        const RequestPoint(
          point: Point(
            latitude: 41.270596015711774,
            longitude: 69.21607867287398,
          ),
          requestPointType: RequestPointType.wayPoint,
        ),
        const RequestPoint(
          point: Point(
            latitude: 41.280596015711774,
            longitude: 69.20607867287398,
          ),
          requestPointType: RequestPointType.viaPoint,
        ),
        const RequestPoint(
          point: Point(
            latitude: 41.310850622326775,
            longitude: 69.28429408768147,
          ),
          requestPointType: RequestPointType.wayPoint,
        ),
      ],
      drivingOptions: const DrivingOptions(),
    ).result;
    route = Polyline(points: result.routes!.first.geometry);
    setState(() {});
  }

  Polyline route = const Polyline(
    points: [
      Point(
        latitude: 41.270596015711774,
        longitude: 69.21607867287398,
      ),
      Point(
        latitude: 41.310850622326775,
        longitude: 69.28429408768147,
      ),
      Point(
        latitude: 41.280596015711774,
        longitude: 69.20607867287398,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YandexMap(
        onUserLocationAdded: (UserLocationView view) {
          print(view);
        },
        onMapCreated: (controller) {
          print("created");
        },
        onMapTap: (Point point) {
          print(point);
          initRoute();
        },
        mapObjects: [
          PolylineMapObject(
            mapId: const MapObjectId("route"),
            strokeWidth: 2,
            polyline: route,
          ),
        ],
      ),
    );
  }
}
