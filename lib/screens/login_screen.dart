import '../widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import '../widgets/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_inkwell_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _obscureText = true;

  // Hardcoded credentials (replace with actual authentication logic later)
  final String correctUsername = "admin";
  final String correctPassword = "password123";

  void _validateLogin() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      String enteredUsername = usernameController.text;
      String enteredPassword = passwordController.text;

      if (enteredUsername == correctUsername && enteredPassword == correctPassword) {
        // Show Success Dialog
        _showDialog(
          title: "Login Successful",
          content: "Welcome, $enteredUsername!",
          isSuccess: true,
        );
      } else {
        // Show Error Dialog
        _showDialog(
          title: "Login Failed",
          content: "Invalid username or password. Please try again.",
          isSuccess: false,
        );
      }
    }
  }

  void _showDialog({required String title, required String content, required bool isSuccess}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title, style: TextStyle(color: isSuccess ? Colors.green : Colors.red)),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                if (isSuccess) {
                  Navigator.pushNamed(context, '/home', arguments: usernameController.text);
                }
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: ScreenUtil().setHeight(40),
                  width: ScreenUtil().screenWidth,
                  color: FB_DARK_PRIMARY,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(25)),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/assets/images/literexia.png', // Fixed image path
                        height: ScreenUtil().setHeight(190),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(30)),
                      
                      // Username Field
                      CustomTextFormField(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: usernameController,
                        validator: (value) => value!.isEmpty ? 'Enter your username' : null,
                        fontSize: ScreenUtil().setSp(15),
                        fontColor: FB_DARK_PRIMARY,
                        hintTextSize: ScreenUtil().setSp(15),
                        hintText: 'Username', 
                        onSaved: (String? value) {  },
                      ),
                      SizedBox(height: ScreenUtil().setHeight(30)),

                      // Password Field
                      CustomTextFormField(
                        height: ScreenUtil().setHeight(10),
                        width: ScreenUtil().setWidth(10),
                        controller: passwordController,
                        validator: (value) => value!.isEmpty ? 'Enter your password' : null,
                        fontSize: ScreenUtil().setSp(15),
                        fontColor: FB_DARK_PRIMARY,
                        hintTextSize: ScreenUtil().setSp(15),
                        hintText: 'Password',
                        isObscure: _obscureText,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText; // Toggle visibility
                            });
                          },
                        ), 
                        onSaved: (String? value) {  },
                      ),
                      SizedBox(height: ScreenUtil().setHeight(50)),

                      // Login Button
                      CustomInkwellButton(
                        onTap: _validateLogin, // Call validation function
                        height: ScreenUtil().setHeight(40),
                        width: ScreenUtil().screenWidth,
                        buttonName: 'Login',
                        fontSize: ScreenUtil().setSp(15),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(40),
                  color: FB_DARK_PRIMARY,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You do not have any account?',
                        style: TextStyle(
                          color: Colors.grey.shade200,
                          fontSize: ScreenUtil().setSp(15),
                        ),
                      ),
                      SizedBox(width: ScreenUtil().setWidth(5)),
                      GestureDetector(
                        onTap: () => Navigator.popAndPushNamed(context, '/register'),
                        child: Text(
                          'Register here',
                          style: TextStyle(
                            color: FB_LIGHT_PRIMARY,
                            fontSize: ScreenUtil().setSp(15),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
