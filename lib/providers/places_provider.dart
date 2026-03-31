import 'package:favorite_places/models/places_models.dart';
import 'package:flutter_riverpod/legacy.dart';

class PlacesProvider extends StateNotifier<List<PlacesModels>> {
  PlacesProvider() : super(const []);

  void addNewPlace(String title) {
    final newPlace = PlacesModels(title: title);
    state = [newPlace, ...state];
  }
}

final userPlaceProvider =
    StateNotifierProvider<PlacesProvider, List<PlacesModels>>(
      (ref) => PlacesProvider(),
    );
