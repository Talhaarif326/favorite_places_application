import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlacesModels {
  PlacesModels({
    required this.title,
    required this.image,
    required this.loaction,
  }) : id = uuid.v4();

  String id;
  String title;
  File image;
  String loaction;
}

// class PlaceLoaction {
//   PlaceLoaction({
//     required this.latitude,
//     required this.longitude,
//     required this.address,
//   });

//   double latitude;
//   double longitude;
//   String address;
// }
