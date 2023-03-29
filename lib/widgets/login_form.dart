import 'package:flutter/material.dart';
import 'package:flutter_crud/api/authentication_api.dart';
import 'package:flutter_crud/pages/home_page.dart';
import 'package:flutter_crud/utils/dialogs.dart';
import 'package:flutter_crud/utils/responsive.dart';
import 'input_text.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email_instructor = '', _password_instructor = '';
  AuthenticationAPI _authenticationAPI = AuthenticationAPI();

  Future<void> _submit() async {
    final isOk = _formKey.currentState!.validate();
    print("form isOk $isOk");
    if (isOk) {
      final response = await _authenticationAPI.login(
        email_instructor: _email_instructor,
        password_instructor: _password_instructor,
      );

      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.routeName, (_) => false);
    } else {
      print("email is not available");
    }
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Positioned(
      bottom: 30,
      child: Form(
        key: _formKey,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 400,
          ),
          child: Column(
            children: <Widget>[
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: "EMAIL ADDRESS",
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                onChanged: (String text) {
                  _email_instructor = text;
                },
                validator: (text) {
                  if (!text!.contains("@")) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black38,
                    ),
                  ),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InputText(
                        label: "PASSWORD",
                        obscureText: true,
                        borderEnabled: false,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        onChanged: (String text) {
                          _password_instructor = text;
                        },
                        validator: (text) {
                          if (text!.trim().length == 0) {
                            return "Invalid password";
                          }
                          return null;
                        },
                      ),
                    ),
                    MaterialButton(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: this._submit,
                  color: Colors.pinkAccent,
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "New to Friendly Desi?",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  MaterialButton(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                  )
                ],
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
