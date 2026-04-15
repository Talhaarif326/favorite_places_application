
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
  
  });



  @override
  State<MapScreen> createState() {
    return MapScreenState();
  }
}

class MapScreenState extends State<MapScreen> {
  late double lat;
  late double long;
  String apiKey = dotenv.env["apiKey"] ?? "key not found";

  late LatLng selectedPionts = LatLng(lat, long);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_sharp),
          ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: selectedPionts,
          initialZoom: 15,
          onTap: (tapPosition, point) => setState(() {
            selectedPionts = point;
          }),
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://{s}-tiles.locationiq.com/v2/obk/r/{z}/{x}/{y}.png?key=$apiKey',
            subdomains: ['a', 'b', 'c'],
            userAgentPackageName: 'com.favorite_place',
          ),
          MarkerLayer(
            markers: [
              Marker(
                height: 80,
                width: 80,
                point: selectedPionts,
                child: Icon(Icons.location_on, color: Colors.red),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, selectedPionts);
              },
              child: Text("Confirm Selected Location"),
            ),
          ),
        ],
      ),
    );
  }
}
