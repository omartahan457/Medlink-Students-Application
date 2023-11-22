// Automatic FlutterFlow imports
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

Future<int> genRandomPhy() async {
  final List<int> numbers = List.generate(61, (index) => index + 1);
  final int randomIndex = Random().nextInt(numbers.length);
  return numbers[randomIndex];
}
