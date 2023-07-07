import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Markers extends StatelessWidget {
  const Markers({
    super.key,
    required this.position,
  });

  final LatLng position;

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers: [
        Marker(
          point: position,
          builder: (context) => const Icon(Icons.place, size: 36, color: Colors.red),
        ),
      ],
    );
  }
}