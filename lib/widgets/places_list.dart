import 'package:favorite_places/providers/places_provider.dart';
import 'package:favorite_places/screens/place_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesListWidget extends ConsumerWidget {
  const PlacesListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final places = ref.watch(userPlaceProvider);

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
            title: Text(
              places[index].title,
              style: Theme.of(context).textTheme.titleMedium!
                  .copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          ),
        );
      },
    );
  }
}
