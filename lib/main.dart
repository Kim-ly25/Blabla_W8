import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'ui/screens/home/home_screen.dart';
import 'ui/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('en_US', null);
  runApp(const BlaBlaApp());
}

class BlaBlaApp extends StatelessWidget {
  const BlaBlaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: blaTheme,
      home: Scaffold(body: HomeScreen()),
    );
  }
}
