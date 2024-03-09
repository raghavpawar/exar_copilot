import 'package:exar_copilot/constants/constants.dart';
import 'package:exar_copilot/provider/patient_list_provider.dart';
import 'package:exar_copilot/provider/search_field_provider.dart';
import 'package:exar_copilot/view/screen_info.dart';
import 'package:exar_copilot/view/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Screen.init(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PatientListProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchFieldProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'EXAR CoPilot',
        theme: themeData,
        home: const MainScreen(),
      ),
    );
  }
}
