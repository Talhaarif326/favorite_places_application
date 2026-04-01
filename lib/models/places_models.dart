import 'dart:io';

import 'package:uuid/uuid.dart';

const uuid = Uuid();

class PlacesModels {
  PlacesModels({required this.title , required this.image}) : id = uuid.v4();

  String id;
  String title;
  File image;
}
