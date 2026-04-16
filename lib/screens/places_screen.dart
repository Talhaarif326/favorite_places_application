import 'package:favorite_places/providers/places_provider.dart';
import 'package:favorite_places/screens/add_new_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  late Future<void> loadPlaces;

  @override
  void initState() {
    loadPlaces = ref.read(userPlaceProvider.notifier).loadPlaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final places = ref.watch(userPlaceProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => AddNewPlace()),
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: loadPlaces,
          builder: (context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
              ? Center(child: CircularProgressIndicator())
              : PlacesListWidget(places: places),
        ),
      ),
    );
  }
}
