import 'package:favorite_places/models/places_models.dart';
import 'package:flutter/material.dart';

class PlacesDetailScreen extends StatelessWidget {
  const PlacesDetailScreen({super.key, required this.place});
  final PlacesModels place;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(place.title)));
  }
}
