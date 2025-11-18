import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_strings.dart';
import 'features/preferences/viewmodels/preference_viewmodel.dart';
import 'features/restaurants/viewmodels/restaurant_viewmodel.dart';
import 'features/preferences/views/cuisine_selection_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(AppTheme.lightSystemUiOverlay);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Preference ViewModel
        ChangeNotifierProvider(
          create: (_) => PreferenceViewModel(),
        ),
        // Restaurant ViewModel
        ChangeNotifierProvider(
          create: (_) => RestaurantViewModel(),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: const CuisineSelectionView(),
      ),
    );
  }
}