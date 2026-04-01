import 'dart:io';

import 'package:favorite_places/models/places_models.dart';
import 'package:flutter_riverpod/legacy.dart';

class PlacesProvider extends StateNotifier<List<PlacesModels>> {
  PlacesProvider() : super(const []);

  void addNewPlace(String title, File image ) {
    final newPlace = PlacesModels(title: title , image:  image);
    state = [newPlace, ...state];
  }
}

final userPlaceProvider =
    StateNotifierProvider<PlacesProvider, List<PlacesModels>>(
      (ref) => PlacesProvider(),
    );
