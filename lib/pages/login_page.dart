import 'package:flutter/material.dart';
import 'package:flutter_crud/utils/responsive.dart';
import 'package:flutter_crud/widgets/circle.dart';
import 'package:flutter_crud/widgets/icon_container.dart';
import 'package:flutter_crud/widgets/login_form.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double pinkSize = responsive.wp(80);
    final double orangeSize = responsive.wp(57);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.hp(100),
            color: Color.fromARGB(255, 174, 168, 168),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: -100,
                  right: -50,
                  child: Circle(
                    size: pinkSize,
                    colors: [
                      Colors.pinkAccent,
                      Colors.pink,
                    ],
                    key: UniqueKey(),
                  ),
                ),
                Positioned(
                  top: -100,
                  left: -50,
                  child: Circle(
                    size: orangeSize,
                    colors: [
                      Colors.orange,
                      Colors.deepOrangeAccent,
                    ],
                    key: UniqueKey(),
                  ),
                ),
                Positioned(
                  top: 130,
                  child: Column(
                    children: <Widget>[
                      IconContainer(
                        size: responsive.wp(17),
                      ),
                      SizedBox(
                        height: responsive.dp(3),
                      ),
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: responsive.dp(2.2),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                LoginForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
