import 'package:flutter/material.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:project_sofeng/bottom_nav_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final Map<String, String> _accounts = {
    "user": "user123",  // User account
    "admin": "admin123", // Admin account
  };

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  // Check if user is already logged in
  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavScreen()),
      );
    }
  }

  // Save login status
  Future<void> _saveLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  // Login function
  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      if (_accounts.containsKey(username) && _accounts[username] == password) {
        await _saveLoginStatus();

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Invalid username or password")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(FluentIcons.arrow_left_32_regular),
            color: Colors.black,
          ),
          const SizedBox(height: 48),
          const Text(
            "Sign In",
            style: TextStyle(
              fontSize: 35,
              fontFamily: 'Montserrat_Bold',
              color: Color(0xFFFFBB00),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Sign in to continue",
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Montserrat_Medium',
              color: Color(0xFF1A3365),
            ),
          ),
          const SizedBox(height: 96),
          Form(
            key: _formKey,
            child: Column(
              children: [
                InputField(label: "Username", controller: _usernameController),
                const SizedBox(height: 16),
                InputField(
                  label: "Password",
                  controller: _passwordController,
                  obscureText: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(212, 55),
                backgroundColor: const Color(0xFFFFBB00),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text(
                "Sign in",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat_SemiBold',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot password?",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Montserrat_Medium',
                  color: Color(0xFF1A3365),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          const DividerWithText(),
          const SizedBox(height: 24),
          SignButton(
            label: "Sign in with Google",
            logo: "assets/images/google_icon.png",
            background: Colors.white,
            textColor: Colors.black,
          ),
          const SizedBox(height: 8),
          SignButton(
            label: "Sign in with Facebook",
            logo: "assets/images/facebook_icon.png",
            background: Colors.blue,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

// Input Field Widget
class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;

  const InputField({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
  });

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
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            filled: true,
            fillColor: const Color(0xFFD9D9D9),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
            ),
          ),
        ),
      ],
    );
  }
}

// Sign-in Button Widget
class SignButton extends StatelessWidget {
  final String label;
  final String logo;
  final Color background;
  final Color textColor;

  const SignButton({
    super.key,
    required this.label,
    required this.logo,
    required this.background,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: background,
        minimumSize: const Size(364, 55),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(logo, height: 24, width: 24),
          const SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Montserrat_Medium',
              color: textColor,
            ),
          )
        ],
      ),
    );
  }
}

// Divider with Text Widget
class DividerWithText extends StatelessWidget {
  const DividerWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(thickness: 1, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: const Text(
            "or",
            style: TextStyle(
              fontSize: 14,
              fontFamily: 'Montserrat_Medium',
              color: Colors.black,
            ),
          ),
        ),
        const Expanded(
          child: Divider(thickness: 1, color: Colors.black),
        ),
      ],
    );
  }
}
