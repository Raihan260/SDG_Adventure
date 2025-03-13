import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FluentIcons.arrow_left_32_regular),
                  color: Colors.black,
                ),
                const SizedBox(height: 48),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'Montserrat_Bold',
                        color: Color(0xFFFFBB00),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Sign in to continue",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat_Medium',
                        color: Color(0xFF1A3365),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 96),
                const Column(
                  children: const [
                    inputFile(label: "Username"),
                    SizedBox(height: 16),
                    inputFile(label: "Password", obscureText: true),
                  ],
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(212, 55),
                      backgroundColor: Color(0xFFFFBB00),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
                    ),
                    child: const Text("Sign in",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat_SemiBold',
                        color: Colors.white
                      ),
                    )
                  )
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text("Forgot password?",
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Montserrat_Medium',
                        color: Color(0xFF1A3365),
                      )
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        )
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("or",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat_Medium',
                            color: Colors.black
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.black,
                        )
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                signButton(
                  label: "Sign in with Google",
                  logo: "assets/images/google_icon.png",
                  background: Colors.white,
                  textColor: Colors.black
                ),
                const SizedBox(height: 8),
                signButton(
                  label: "Sign in with Facebook",
                  logo: "assets/images/facebook_icon.png",
                  background: Colors.blue,
                  textColor: Colors.white
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class inputFile extends StatelessWidget {
  final String label;
  final bool obscureText;

  const inputFile({super.key, required this.label, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: 'Montserrat_Medium',
            color: Color(0xFF1A3365),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            filled: true,
            fillColor: Color(0xFFD9D9D9),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), 
              borderSide: const BorderSide(color: Color(0xFFD9D9D9))
            ),
          ),
        ),
      ],
    );
  }
}

class signButton extends StatelessWidget {
  final String label;
  final String logo;
  final Color background;
  final Color textColor;

  const signButton({super.key, required this.label, required this.logo, required this.background, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        minimumSize: const Size(364, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))
      ),
      child: Row(
        children: [
          Image.asset(logo,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 8),
          Text(label,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Montserrat_Medium',
              color: textColor
            ),
          )
        ],
      ),
    );
  }
}