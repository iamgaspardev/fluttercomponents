import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/services.dart';

class CustomGeoMap extends StatefulWidget {
  const CustomGeoMap({super.key});

  @override
  _CustomGeoMapState createState() => _CustomGeoMapState();
}

class _CustomGeoMapState extends State<CustomGeoMap> {
  List<Polygon> polygons = [];

  @override
  void initState() {
    super.initState();
    loadCustomGeoJson();
  }

  Future<void> loadCustomGeoJson() async {
    final String data =
        await rootBundle.loadString('assets/arusha_geofeature.json');
    final List<dynamic> json = jsonDecode(data);

    for (var region in json) {
      final List<dynamic> coordinates = jsonDecode(region['co']);
      List<LatLng> points = [];

      for (var coord in coordinates[0]) {
        points.add(LatLng(coord[1], coord[0]));
      }

      polygons.add(
        Polygon(
          points: points,
          color: Colors.blue.withOpacity(0.3),
          borderColor: Colors.blue,
          borderStrokeWidth: 2,
        ),
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(-2.3487, 36.4188),
          initialZoom: 7.5,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
          ),
          if (polygons.isNotEmpty) PolygonLayer(polygons: polygons),
        ],
      ),
    );
  }
}
