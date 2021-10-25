import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import '../Utils/Constants/colors.dart';
import '../Utils/initialdata.dart';
class SplashScreen extends StatefulWidget {
  static const routeName = "/splashscreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var screenWidth;
  var screenHeight;
  final colorpallete = ColorPallete();
  AnimationController _lottieAnimation;


  @override
  void initState() {
    super.initState();
    loadData(context);
    _lottieAnimation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    Future.delayed(Duration(seconds: 1))
        .then((value) => Duration(seconds: 1))
        .then(
          (value) => Future.delayed(Duration(seconds: 1)).then(
            (value) => _lottieAnimation.forward().then(
              (value) => Navigator.of(context)
              .pushNamedAndRemoveUntil('/navigation', (route) => false),
        ),
      ),
    );
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: colorpallete.bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/splash_animation.json'),
            _animatedTitleWidget()
          ],
        ),
      ),
    );
  }

  Widget _animatedTitleWidget() {
    return Container(
      child: SizedBox(
        child: DefaultTextStyle(
          style: GoogleFonts.eagleLake(fontSize: 30),
          child: AnimatedTextKit(animatedTexts: [
            TyperAnimatedText('GRROM APP',
                speed: const Duration(milliseconds: 200)),
          ]),
        ),
      ),
    );
  }
}
