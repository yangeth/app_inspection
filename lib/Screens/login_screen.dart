import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:app_inspection/generated/l10n.dart';
import 'package:app_inspection/utils/locale_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final settingsController = Get.find<SettingsController>();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundImage = isDark
        ? 'assets/tr_background_dark.png'
        : 'assets/tr_background_light.png';
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(backgroundImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              onPressed: () {
                settingsController.toggleLocale();
              },
              icon: Text(
                settingsController.locale.value.languageCode.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 40,
            left: 20,
            child: IconButton(
              onPressed: () {
                settingsController.toggleTheme();
              },
              icon: Icon(
                settingsController.themeMode.value == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        'The Truck Savers',
                        style: TextStyle(
                            fontFamily: 'Inter Tight',
                            color: Colors.white,
                            fontSize: 30,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(14.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(
                              0,
                              2,
                            ),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(S.current.welcome_lbl,
                              style: TextStyle(
                                  fontFamily: 'Inter Tight',
                                  letterSpacing: 0.0,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 20),
                          _buildTextField(
                              S.current.email, _emailController, false),
                          const SizedBox(height: 20),
                          _buildTextField(
                              S.current.password, _passwordController, true),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: _login,
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              S.current.login_btn,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, bool isPassword) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.current.required(label);
        }
        return null;
      },
    );
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      final response = await http
          .post(
            Uri.parse('http://192.168.0.3:8080/photodoc/isValidUser'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'email': _emailController.text,
              'password': _passwordController.text,
            }),
          )
          .timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final username = data['username'];
        final id = data['id'].toString();

        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => WelcomeScreen(username: username, id: id),
          ),
        );
      } else if (response.statusCode == 401) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red.withOpacity(0.2),
            content: Row(
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.white,
                ),
                const SizedBox(width: 8.0),
                Text(
                  S.current.invalidEP,
                  style: GoogleFonts.varela(),
                ),
              ],
            ),
          ),
        );
      }
    } on TimeoutException {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.withOpacity(0.2),
          content: Row(
            children: [
              const Icon(
                Icons.error_outline,
                color: Colors.white,
              ),
              const SizedBox(width: 8.0),
              Text(
                S.current.serverTimeout,
                style: GoogleFonts.varela(),
              ),
            ],
          ),
        ),
      );
    } on SocketException {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(
                Icons.error_outline,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              const SizedBox(width: 8.0),
              Text(
                S.current.checkServer,
                style: GoogleFonts.varela(),
              ),
            ],
          ),
        ),
      );
    }
  }
}
