import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:white_card/ui/dashboard/dashboard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
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
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "White Card",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            onPrimary: const Color(0xff34647A),
                            primary: const Color(0xffDEDEDE),
                            onSurface: const Color(0xff34647A),
                            elevation: 0,
                            fixedSize: const Size(double.infinity, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Icon(
                                Icons.email_sharp,
                                size: 40,
                                color: Color(0xff3282B8),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Continue with Email",
                                style: TextStyle(fontSize: 18),
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          onPrimary: const Color(0xff34647A),
                          primary: const Color(0xffDEDEDE),
                          onSurface: const Color(0xff34647A),
                          elevation: 0,
                          fixedSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Dashboard()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "assets/google_logo.svg",
                              width: 40,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Continue with Google",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
