import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grrom_task/Utils/Widgets/home_header.dart';
Widget showSnack(String msg, BuildContext context, {timer=2}) {
  showToast(
    msg,
    context: context,
    animation: StyledToastAnimation.slideFromBottomFade,
    reverseAnimation: StyledToastAnimation.fade,
    position: StyledToastPosition.bottom,
    isHideKeyboard: true,
    fullWidth: true,
    animDuration: Duration(seconds: 1),
    duration: Duration(seconds: timer),
    curve: Curves.easeOutQuint,
    backgroundColor: Colors.yellowAccent,
    textStyle: GoogleFonts.montserrat(color: colorpallete.bgColor),
    reverseCurve: Curves.linear,

  );
}