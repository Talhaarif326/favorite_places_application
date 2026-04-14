import 'dart:convert';

import 'package:favorite_places/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onselectLocation});

  final void Function(String location, double lat, double long)
  onselectLocation;

  @override
  State<LocationInput> createState() {
    return LocationInputState();
  }
}

class LocationInputState extends State<LocationInput> {
  String? formatedLocation;
  bool loadingUserLocation = false;
  double? lat;
  double? long;

  String? apiKey;
  @override
  void initState() {
    apiKey = dotenv.env["apiKey"] ?? "key not found";
    super.initState();
  }

  String get locationImage {
    if (lat == null || long == null) {
      return "";
    }
    return 'https://maps.locationiq.com/v3/staticmap?key=$apiKey&center=$lat,$long&zoom=15&maptype=streets&scale=2&format=jpg&size=480x480&markers=icon:large-red-cutout|$lat,$long';
  }

  void userLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();

    setState(() {
      loadingUserLocation = true;
    });

    if (!serviceEnabled) {
      return;
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted == PermissionStatus.denied) {
        return;
      }
    }

    locationData = await location.getLocation();
    setState(() {
      loadingUserLocation = false;
    });

    lat = locationData.latitude;
    long = locationData.longitude;

    Uri url = Uri.parse(
      'https://us1.locationiq.com/v1/reverse?key=$apiKey&lat=$lat&lon=$long&format=json&',
    );

    final response = await http.get(url);
    final resData = json.decode(response.body);
    setState(() {
      formatedLocation = resData['display_name'];
    });
    if (formatedLocation == null || lat == null || long == null) {
      return;
    }
    widget.onselectLocation(formatedLocation!, lat!, long!);
  }

  @override
  Widget build(BuildContext context) {
    Widget privewContent = Text(
      "No Location Selected",
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
        color: Theme.of(context).colorScheme.onSurface,
      ),
    );

    if (formatedLocation != null) {
      privewContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      );
    }
    if (loadingUserLocation) {
      privewContent = CircularProgressIndicator();
    }
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          child: privewContent,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: userLocation,
              label: Text('Get User Location'),
              icon: Icon(Icons.location_on_outlined),
            ),
            TextButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MapScreen(),
                  ),
                );
              },
              label: Text('Select on Map'),
              icon: Icon(Icons.map),
            ),
          ],
        ),
      ],
    );
  }
}
