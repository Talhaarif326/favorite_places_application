import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, required this.isSelecting});

  final bool isSelecting;
  @override
  State<MapScreen> createState() {
    return MapScreenState();
  }
}

class MapScreenState extends State<MapScreen> {
  double lat = 34.50328618313398;
  double long = 71.9057313306817;
  String apiKey = dotenv.env["apiKey"] ?? "key not found";

  late LatLng selectedPionts = LatLng(lat, long);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: widget.isSelecting
                ? () {
                    Navigator.pop(context, selectedPionts);
                  }
                : null,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          interactionOptions: InteractionOptions(
            flags: widget.isSelecting
                ? InteractiveFlag.all
                : InteractiveFlag.none,
          ),
          initialCenter: selectedPionts,
          initialZoom: 15,
          onTap: widget.isSelecting == true
              ? null
              : (tapPosition, point) => setState(() {
                  selectedPionts = point;
                }),
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://{s}-tiles.locationiq.com/v3/streets/r/{z}/{x}/{y}.png?key=$apiKey',
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
        ],
      ),
    );
  }
}
