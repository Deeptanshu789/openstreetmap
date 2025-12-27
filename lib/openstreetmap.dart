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
       foregroundColor: const Color.fromARGB(255, 58, 162, 226),
        title: const Text("Open Street Map"),
          backgroundColor: Colors.blue,
      ),
      body: Stack(
        children : [
         FlutterMap(
           mapController: _mapcontroller,
          options: MapOptions(
            initialCenter: LatLng(0, 0),
            initialZoom: 3.0,
            minZoom: 2.0,
            maxZoom: 100.0,
          ),
          children: [
            TileLayer(
              urlTemplate: "https://tile.opentopomap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c'],
            ),
            CurrentLocationLayer(
             style: const LocationMarkerStyle(
              marker: DefaultLocationMarker(
                markerSize: Size(35, 35),
              markerDirection: MarkerDirection.heading,
                child: Icon(
                  Icons.location_pin,
                  color: Colors.blue,
                              child: Icon(
                Icons.location_pin,
                color: Colors.blue,
              ),
            ),
            ),
         ) ,
          ],
        ),
        ],
          ),
        );
  }
}