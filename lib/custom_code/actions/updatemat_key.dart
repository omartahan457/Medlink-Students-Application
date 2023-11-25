// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
// Imports other custom actions
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future updatematKey(String userData, String userCollectionData) async {
  // Increment score +10 and update it on firebase
// Assuming you have already initialized Firebase and have a reference to the student's document in Firestore

  final studentRef =
      FirebaseFirestore.instance.collection('MedlinkStudentsDB').doc(userData);

  // Get the current score
  final studentSnapshot = await studentRef.get();
  final currentuniversity = studentSnapshot.data()?['userUniversity'];
  final currentuniversity1 = studentSnapshot.data()?['userUniversity1'];
  final currentuniversity2 = studentSnapshot.data()?['userUniversity2'];
  final currentuniversity3 = studentSnapshot.data()?['userUniversity3'];
  final currentuniversity4 = studentSnapshot.data()?['userUniversity4'];
  int currentmatKey = studentSnapshot.data()?['matKey'];
  int currentoptionMat = studentSnapshot.data()?['optionMat'];

  List<String> universityArray = [
    "Plovdiv Medical University",
    "Sofia Medical University",
    "Varna Medical University",
    "Pleven Medical University",
    "Trakia University",
    "University Of Zagreb",
    "University Of Targu Mures Medical Campus Hamburg (UMCH)",
    "Titu Maiorescu University",
    "Riga Stradins University (RSU)",
    "Vilnius University",
    "Lithuanian University Of Health Sciences (LMSU)",
    "Karazin Kharkiv University",
    "University Of Nis Faculty Of Medicine",
    "University Of Novi Sad",
    "University Of Belgrade",
    "Humanitas University Milan",
    "Catholic University Of The Sacred Heart",
    "Sarajevo School Of Science And Technology",
    "Ilia State University",
    "European University In Tbilisi Georgia",
    "University Of Pecs",
    "University Of Veterinary Medicine, Budapest",
    "University Of Debrecen Medical School",
    "Semmelweis University Of Medicine",
    "Jessenius Faculty Of Medicine",
    "Comenius University In Bratislava",
    "Slovak Medical University",
    "Pavol Jozef Šafárik University",
    "Charles University Prague",
    "Charles University Faculty Of Medicine In Hradec Králové",
    "Charles University Faculty Of Medicine In Pilsen",
    "Medical University Of Lodz",
    "Medical University Of Lublin",
    "Medical University Of Gdańsk",
    "Medical University Of Warsaw",
    "Nicolaus Copernicus University – Collegium Medicum",
    "Jagiellonian University Medical College",
    "Poznan University Of Medical Sciences",
    "Medical University Of Silesia",
    "European University Of Madrid",
    "CEU San Pablo University"
  ];
  int i;
  for (i = 9; i <= universityArray.length; i++) {
    if (universityArray[i] == currentuniversity) {
      currentmatKey = i;
      await studentRef.update({'matKey': currentmatKey});
    }
    if (universityArray[i] == currentuniversity1) {
      currentoptionMat = i;
      await studentRef.update({'optionMat': currentoptionMat});
    }
    if (universityArray[i] == currentuniversity2) {
      currentoptionMat = i;
      await studentRef.update({'optionMat': currentoptionMat});
    }
    if (universityArray[i] == currentuniversity3) {
      currentoptionMat = i;
      await studentRef.update({'optionMat': currentoptionMat});
    }
    if (universityArray[i] == currentuniversity4) {
      currentoptionMat = i;
      await studentRef.update({'optionMat': currentoptionMat});
    }
    if (currentuniversity == "Slovak Medical University") {
      currentoptionMat = 34;
      await studentRef.update({'optionMat': currentoptionMat});
    }
  }
}
