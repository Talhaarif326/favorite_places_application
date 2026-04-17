import 'package:favorite_places/models/places_models.dart';
import 'package:favorite_places/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PlacesDetailScreen extends StatelessWidget {
  PlacesDetailScreen({super.key, required this.place});
  final PlacesModels place;
  final String apiKey = dotenv.env["apiKey"] ?? "key not found";

  String get locationImage {
    double lat = place.lat;
    double long = place.long;
    return 'https://maps.locationiq.com/v3/staticmap?key=$apiKey&center=$lat,$long&zoom=15&maptype=streets&scale=2&format=jpg&size=480x480&markers=icon:large-red-cutout|$lat,$long';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Stack(
        children: [
          Image.file(
            place.image,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            MapScreen(isSelecting: false),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(locationImage),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black54, Colors.black45],
                    ),
                  ),
                  child: Text(
                    place.loaction,
                    style: Theme.of(context).textTheme.bodyLarge!
                        .copyWith(
                          color: Theme.of(
                            context,
                          ).colorScheme.onSurface,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
