import 'package:flutter/material.dart';
import 'package:flutter_calculator/themes/textColor.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              color: const Color.fromRGBO(126, 120, 210, 1),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Kalkulators',
                    style: TextStyle(
                        fontSize: 50, color: Color.fromRGBO(255, 255, 255, 1)),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset('assets/main_page_image.svg'),
          const GoogleLogin(),
        ],
      ),
    );
  }
}

class GoogleLogin extends StatefulWidget {
  const GoogleLogin({super.key});

  @override
  State<GoogleLogin> createState() => GoogleLoginState();
}

class GoogleLoginState extends State<GoogleLogin> {
  GoogleLoginState();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(126, 120, 210, 1)),
        ),
        onPressed: () {
          Navigator.pushNamed(context, "/kalkulators");
        },
        child: 
          Text("Iejiet",
              textScaler: const TextScaler.linear(2),
              style: defaultElevatedButtonTextStyle()),
          // Container(
          //   padding: const EdgeInsets.all(4),
          //     margin: const EdgeInsets.all(10),
          //     decoration: const BoxDecoration(
          //           color: Color.fromRGBO(255, 255, 255, 1),

          //           borderRadius: BorderRadius.all(Radius.circular(20))
          //         ),
          //     child: SvgPicture.asset(
          //       'assets/google.svg',
          //       height: 100,
          //       width: 100,
          //     ))
        );
  }
}
