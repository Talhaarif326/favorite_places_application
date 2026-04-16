import 'package:favorite_places/models/places_models.dart';

import 'package:favorite_places/screens/place_detail_screen.dart';
import 'package:flutter/material.dart';


class PlacesListWidget extends StatelessWidget {
  const PlacesListWidget({super.key, required this.places});

  final List<PlacesModels> places;

  @override
  Widget build(BuildContext context) {
    

    if (places.isEmpty) {
      return Center(
        child: Text(
          "No Places Added yet",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      );
    }
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    PlacesDetailScreen(place: places[index]),
              ),
            );
          },
          child: ListTile(
            leading: CircleAvatar(
              radius: 20,
              backgroundImage: FileImage(places[index].image),
            ),
            title: Text(
              places[index].title,
              style: Theme.of(context).textTheme.titleMedium!
                  .copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            subtitle: Text(places[index].loaction),
          ),
        );
      },
    );
  }
}
