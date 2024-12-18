import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter/services.dart';

class CustomGeoMap extends StatefulWidget {
  const CustomGeoMap({Key? key}) : super(key: key);

  @override
  _CustomGeoMapState createState() => _CustomGeoMapState();
}

class _CustomGeoMapState extends State<CustomGeoMap> {
  List<Polygon> polygons = [];
  List<Marker> markers = [];
  LatLngBounds? bounds;
  late MapController mapController;
  double initialZoom = 7.6;
  bool showLabels = true;
  @override
  void initState() {
    super.initState();
    mapController = MapController();
    loadCustomGeoJson();
  }

  Future<void> loadCustomGeoJson() async {
    final String data =
        await rootBundle.loadString('assets/arusha_geofeature.json');
    final List<dynamic> json = jsonDecode(data);

    List<LatLng> allPoints = [];

    for (var region in json) {
      final List<dynamic> coordinates = jsonDecode(region['co']);
      List<LatLng> points = [];

      for (var coord in coordinates[0]) {
        points.add(LatLng(coord[1], coord[0]));
        allPoints.add(LatLng(coord[1], coord[0]));
      }

      Color polygonColor = region['le'] > 10
          ? Colors.red.withOpacity(0.3)
          : Colors.blue.withOpacity(0.3);

      Color borderColor = region['le'] > 10 ? Colors.red : Colors.blue;

      polygons.add(
        Polygon(
          points: points,
          color: polygonColor,
          borderColor: borderColor,
          borderStrokeWidth: 2,
        ),
      );

      final LatLng centroid = calculateCentroid(points);
      markers.add(
        Marker(
          point: centroid,
          width: 100,
          height: 30,
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.0),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              region['na'],
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    // Calculate map bounds for all polygons
    if (allPoints.isNotEmpty) {
      bounds = LatLngBounds.fromPoints(allPoints);
      initialZoom = calculateZoomLevel(bounds!);
      mapController.move(bounds!.center, initialZoom);
    }

    setState(() {});
  }

  LatLng calculateCentroid(List<LatLng> points) {
    double latSum = 0;
    double lngSum = 0;
    for (var point in points) {
      latSum += point.latitude;
      lngSum += point.longitude;
    }
    return LatLng(latSum / points.length, lngSum / points.length);
  }

  double calculateZoomLevel(LatLngBounds bounds) {
    final width = bounds.northEast.longitude - bounds.southWest.longitude;
    final height = bounds.northEast.latitude - bounds.southWest.latitude;

    double distance = Distance().as(
        LengthUnit.Kilometer,
        LatLng(bounds.southWest.latitude, bounds.southWest.longitude),
        LatLng(bounds.northEast.latitude, bounds.northEast.longitude));

    double zoomLevel = 10;

    if (distance > 1000) {
      zoomLevel = 5;
    } else if (distance > 500) {
      zoomLevel = 6;
    } else if (distance > 100) {
      zoomLevel = 7;
    } else if (distance > 50) {
      zoomLevel = 8;
    } else if (distance > 20) {
      zoomLevel = 9;
    } else {
      zoomLevel = 10;
    }

    return zoomLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: bounds?.center ?? LatLng(-2.3487, 36.4188),
          initialZoom: initialZoom,
        ),
        children: [
          // TileLayer(
          //   urlTemplate:
          //       "https://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}{r}.png",
          //   subdomains: ['a', 'b', 'c', 'd'],
          //   tileSize: 256,
          // ),
          TileLayer(
            urlTemplate:
                "https://{s}.basemaps.cartocdn.com/light_nolabels/{z}/{x}/{y}{r}.png",
            subdomains: ['a', 'b', 'c', 'd'],
            tileSize: 256,
          ),
          if (polygons.isNotEmpty) PolygonLayer(polygons: polygons),
          if (showLabels && markers.isNotEmpty) MarkerLayer(markers: markers),
        ],
      ),
    );
  }
}
