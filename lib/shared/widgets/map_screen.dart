import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapComponent extends StatelessWidget {
  const MapComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.79,
      child: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-6.369028, 34.888822),
          zoom: 5.3,
        ),
        mapType: MapType.normal,
        zoomGesturesEnabled: true,
        scrollGesturesEnabled: true,
        compassEnabled: true,
        rotateGesturesEnabled: true,
        tiltGesturesEnabled: true,
      ),
    );
  }
}
