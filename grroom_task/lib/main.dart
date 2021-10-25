import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

//Others
import 'Services/statemanagement.dart';
import 'Utils/Constants/colors.dart';

//Screens
import 'Screens/splash_screen.dart';
import 'Screens/navigation_screen.dart';
import 'Screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharactersStateManagement()),
      ],
      builder: (context, child) {
        return myApp();
      }));
}

class myApp extends StatelessWidget {
  final colorpallete = ColorPallete();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CharactersStateManagement())
      ],
      builder: (context, child) {
        return new MaterialApp(
          title: "Grroom Task",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: colorpallete.bgColor,
          ),
          initialRoute: '/splashscreen',
          routes: {
            '/splashscreen': (context) => SplashScreen(),
            '/navigation': (context) => NavigationScreen(),
          },
        );
      },
    );
  }
}
