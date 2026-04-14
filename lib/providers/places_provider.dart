import 'dart:io';

import 'package:favorite_places/models/places_models.dart';
import 'package:flutter_riverpod/legacy.dart';

class PlacesProvider extends StateNotifier<List<PlacesModels>> {
  PlacesProvider() : super(const []);

  void addNewPlace(
    String title,
    File image,
    String location,
    double lat,
    double long,
  ) {
    final newPlace = PlacesModels(
      title: title,
      image: image,
      loaction: location,
      lat: lat,
      long: long,
    );
    state = [newPlace, ...state];
  }
}

final userPlaceProvider =
    StateNotifierProvider<PlacesProvider, List<PlacesModels>>(
      (ref) => PlacesProvider(),
    );
