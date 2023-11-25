// Automatic FlutterFlow imports
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

Future<int> genRandomPage() async {
  final List<int> numbers = List.generate(3, (index) => index + 1);
  final int randomIndex = Random().nextInt(numbers.length);
  return numbers[randomIndex];
}
