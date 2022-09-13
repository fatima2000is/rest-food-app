import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialLoginBtn extends StatefulWidget {
  const SocialLoginBtn({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SocialLoginBtnState createState() => _SocialLoginBtnState();
}

class _SocialLoginBtnState extends State<SocialLoginBtn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          height: 45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          color: Colors.brown,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Login with Google",
                style: TextStyle(
                  color: Color.fromARGB(76, 255, 193, 7),
                  fontSize: 16,
                ),
              ),
              SvgPicture.asset(
                "images/googl_icon.svg",
                height: 20,
                width: 20,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        //fb button
        MaterialButton(
          height: 45,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          color: Color.fromARGB(151, 167, 142, 68),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Login with Facebook",
                style: TextStyle(
                  color: Colors.amberAccent,
                  fontSize: 16,
                ),
              ),
              SvgPicture.asset(
                "images/facebook-svgrepo-com.svg",
                height: 20,
                width: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
