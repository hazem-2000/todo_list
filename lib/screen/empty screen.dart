import 'package:flutter/material.dart';
class EmptyGroceryScreen extends StatelessWidget {
  const EmptyGroceryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO 3: Replace and add layout widgets
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/empty_list.png'),
              ),
            ),
            const Text(
              'No Groceries!',
              style: TextStyle(fontSize: 21.0),
            ),
            const SizedBox(height: 16.0),
            const Text('Shopping for indegrediants\n'
                'Tap the + button to write them down!',
              textAlign: TextAlign.center,
            ),
            // TODO 7: Add browse recipes button
          ],
        ),
      ),);
  }
}