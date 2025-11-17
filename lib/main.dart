import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'providers/preference_provider.dart';
import 'screens/cuisine_selection_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PreferenceProvider(),
      child: MaterialApp(
        title: 'Restaurant Finder',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.black,
          primaryColor: const Color(0xFFD4AF37),
          textTheme: GoogleFonts.poppinsTextTheme(
            ThemeData.dark().textTheme,
          ),
          colorScheme: ColorScheme.dark(
            primary: const Color(0xFFD4AF37),
            secondary: const Color(0xFFD4AF37),
            background: Colors.black,
            surface: const Color(0xFF1A1A1A),
          ),
        ),
        home: const CuisineSelectionScreen(),
      ),
    );
  }
}