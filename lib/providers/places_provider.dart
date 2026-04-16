import 'dart:io';

import 'package:favorite_places/models/places_models.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, "places.db"),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE user_places(id TEXT PRIMARY KEY , title TEXT, image TEXT, location TEXT , lat REAL , long REAL)",
      );
    },
    version: 1,
  );
  return db;
}

class PlacesProvider extends StateNotifier<List<PlacesModels>> {
  PlacesProvider() : super(const []);

  Future<void> loadPlaces() async {
    try {
      final db = await getDatabase();
    final data = await db.query("user_places");
    final places = data
        .map(
          (item) => PlacesModels(
            id: item["id"] as String,
            title: item["title"] as String,
            image: File(item["image"] as String),
            loaction: item["location"] as String,
            lat: item["lat"] as double,
            long: item["long"] as double,
          ),
        )
        .toList();
    state = places;
    } catch (e) {
      print(e);
    }
    
  }

  void addNewPlace(
    String title,
    File image,
    String location,
    double lat,
    double long,
  ) async {
    final imgDir = await syspath.getApplicationDocumentsDirectory();
    final filename = path.basename(image.path);
    final copyiedImage = await image.copy("${imgDir.path}/$filename");

    final newPlace = PlacesModels(
      title: title,
      image: copyiedImage,
      loaction: location,
      lat: lat,
      long: long,
    );

    final db = await getDatabase();
    db.insert("user_places", {
      "id": newPlace.id,
      "title": newPlace.title,
      "image": newPlace.image.path,
      "location": newPlace.loaction,
      "lat": newPlace.lat,
      "long": newPlace.long,
    });
    state = [newPlace, ...state];
  }
}

final userPlaceProvider =
    StateNotifierProvider<PlacesProvider, List<PlacesModels>>(
      (ref) => PlacesProvider(),
    );
