import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(),
            Column(
              children: [
                SvgPicture.asset(
                  "assets/whitecard.svg",
                  width: 150,
                ),
                const SizedBox(height: 20,),
                const Text("White Card",textAlign: TextAlign.center,style: TextStyle(fontSize: 30,letterSpacing: 2,fontWeight: FontWeight.w300),),
              ],
            ),
            Column(
              children: [
                LinearProgressIndicator(
                  color: Theme.of(context).primaryColor,
                  backgroundColor: Theme.of(context).splashColor,
                  semanticsLabel: 'Loading...',
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Made with ❤ by  ",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
