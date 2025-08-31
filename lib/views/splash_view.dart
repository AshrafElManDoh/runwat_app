import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:runway_app/views/home_view.dart';
import 'package:runway_app/widgets/animation_line.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 1500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/logo/logo.svg"),
            SizedBox(height: 10),
            AnimationLine(),
          ],
        ),
      ),
    );
  }
}
