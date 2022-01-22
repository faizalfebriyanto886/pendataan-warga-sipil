import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pendataan_warga_sipil/screen/home.dart';
import 'package:pendataan_warga_sipil/widgets/colors.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  // final List<User> _listUser = [];
  

  Future<List> getData() async{
    final responce = await http.get(Uri.parse("http://10.219.68.101/db-sipil/user.php?function=get_user"));
    debugPrint(responce.body);
    return jsonDecode(responce.body);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: primary,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: LottieBuilder.asset('assets/images/38964-group-of-people-communicating.json', fit: BoxFit.cover,),
              ),
            ],
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 350),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _username,
                      decoration: const InputDecoration(
                        labelText: "Username",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.email_outlined,
                        )
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(
                          Icons.password_outlined,
                        )
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      padding: const EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ElevatedButton(
                        onPressed: ()  {
                          getData().then((value) {
                            for (var doc in value) {
                              if (_username.text == doc['username'] && _password.text == doc['password']) {
                                _username.text = doc['username'];
                                _password.text = doc['password'];
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                                // ignore: avoid_print
                                print(doc['username']);
                              }
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 15
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
