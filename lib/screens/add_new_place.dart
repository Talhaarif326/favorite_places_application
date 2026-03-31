import 'package:favorite_places/providers/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddNewPlace extends ConsumerStatefulWidget {
  const AddNewPlace({super.key});
  @override
  ConsumerState<AddNewPlace> createState() {
    return AddNewPlaceState();
  }
}

class AddNewPlaceState extends ConsumerState<AddNewPlace> {
  final _inputControler = TextEditingController();

  @override
  void dispose() {
    _inputControler.dispose();
    super.dispose();
  }

  void savePlace() {
    final enteredText = _inputControler.text;
    if (enteredText.isEmpty) {
      return;
    }
    ref
        .read(userPlaceProvider.notifier)
        .addNewPlace(_inputControler.text);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add new Place")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(label: Text('Title')),
              controller: _inputControler,
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: savePlace,
              icon: Icon(Icons.add),
              label: Text('Add Place'),
            ),
          ],
        ),
      ),
    );
  }
}
