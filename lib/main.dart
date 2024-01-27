import 'package:flutter/material.dart';
import 'package:internshala_assignment/screens/onboard/onboardProvider.dart';
import 'package:internshala_assignment/screens/onboard/onboardingscreen.dart';
import 'package:internshala_assignment/screens/searchscreen/search.dart';
import 'package:internshala_assignment/screens/splashscreen.dart';
import 'package:internshala_assignment/theme/theme.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'backend/datafromapi/data.dart';


bool isFirstTime = false;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await Tapidata.datagetter();
  isFirstTime = prefs.getBool('isFirstTime') ?? true;
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SonboardProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Intershala_assignment',
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,

        routes:  {
          'onboard':(context) => const SOnboarding(),
          'splash' :(context)=> const Tsplashscreen(),
          'search':(context)=> const Tsearchscreen(),
        },
        home: const Tsplashscreen(),
      ),
    );
  }
}
