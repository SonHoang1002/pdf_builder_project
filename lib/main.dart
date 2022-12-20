import 'package:cv_1/modules/edit/edit.dart';
import 'package:cv_1/modules/home/home.dart';
import 'package:cv_1/modules/onboading/on_boarding.dart';
import 'package:cv_1/tests/test.dart';
import 'package:cv_1/tests/test_dropdownlist.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}
const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);
// final c= Color(#F1F1F1);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: white,
        // primaryColor: Colors.white
      ),
      home:  Edit(),
      // home:Test(),
      // https://api.flutter.dev/flutter/widgets/Focus-class.html
    );
  }
}
