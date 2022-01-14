import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pendataan_warga_sipil/screen/home.dart';
import 'package:pendataan_warga_sipil/widgets/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
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