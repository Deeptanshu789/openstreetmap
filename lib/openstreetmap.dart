import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:latlong2/latlong.dart';

class Openstreetmapscreen extends StatefulWidget {
  const Openstreetmapscreen({super.key});

  @override
  State<Openstreetmapscreen> createState() => _OpenstreetmapScreenState();
}

class _OpenstreetmapScreenState extends State<Openstreetmapscreen> {
  final MapController _mapcontroller = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("My Location"),
        backgroundColor: Colors.indigo,
      ),
      body: FlutterMap(
        mapController: _mapcontroller,
        options: MapOptions(
          initialCenter: LatLng(0, 0),
          initialZoom: 3.0,
          minZoom: 2.0,
          maxZoom: 18.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
          ),
          CurrentLocationLayer(
            style: const LocationMarkerStyle(
              marker: DefaultLocationMarker(
                color: Color.fromARGB(255, 255, 86, 86),
              ),
              markerSize: Size(35, 35),
              markerDirection: MarkerDirection.heading,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _mapcontroller.move(LatLng(0, 0), 15),
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.my_location, color: Colors.white),
      ),
    );
  }
}
