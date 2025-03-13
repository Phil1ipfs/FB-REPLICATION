import 'package:fb_replication/widgets/constant.dart';
import 'package:fb_replication/widgets/customFont.dart';
import 'package:fb_replication/widgets/custom_inkwell_button.dart';
import '../widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/custom_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController mobilenumController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  bool isPasswordHidden = true;
  bool isConfirmPasswordHidden = true;

  void register() {
  if (_formKey.currentState!.validate()) {
    if (firstnameController.text.isEmpty &&
        lastnameController.text.isEmpty &&
        mobilenumController.text.isEmpty &&
        usernameController.text.isEmpty &&
        passwordController.text.isEmpty &&
        confirmpasswordController.text.isEmpty) {
      showErrorDialog(context, "All fields are required");
      return;
    }
    // ✅ Successful Registration Message
    showErrorDialog(context, "Registration complete!");
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().screenHeight,
          width: ScreenUtil().screenWidth,
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(25),
            vertical: ScreenUtil().setHeight(40),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: ScreenUtil().setHeight(25)),
                CustomFont(
                  text: 'Register Here',
                  fontSize: ScreenUtil().setSp(50),
                  color: FB_DARK_PRIMARY,
                  fontStyle: FontStyle.normal,
                ),
                SizedBox(height: ScreenUtil().setHeight(25)),
                
                // First Name
                CustomTextFormField(
                  height: ScreenUtil().setHeight(10),
                  width: ScreenUtil().setWidth(10),
                   onSaved: (value) {}, // 
                  fontColor: Colors.black,
                  hintText: 'First Name',
                  validator: (value) =>
                      value!.isEmpty ? 'First Name is required' : null,
                  hintTextSize: ScreenUtil().setSp(15),
                  fontSize: ScreenUtil().setSp(15),
                  controller: firstnameController,
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),

                // Last Name
                CustomTextFormField(
                  height: ScreenUtil().setHeight(10),
                  width: ScreenUtil().setWidth(10),
                  onSaved: (value) {}, // 
                  fontColor: Colors.black,
                  hintText: 'Last Name',
                  validator: (value) =>
                      value!.isEmpty ? 'Last Name is required' : null,
                  hintTextSize: ScreenUtil().setSp(15),
                  fontSize: ScreenUtil().setSp(15),
                  controller: lastnameController,
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),

                // Mobile Number
                CustomTextFormField(
                    maxLength: 11,
                    keyboardType: TextInputType.number,
                    height: ScreenUtil().setHeight(10),
                    width: ScreenUtil().setWidth(10),
                    onSaved: (value) {}, 
                    fontColor: Colors.black,
                    hintText: 'Mobile Number',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        showErrorDialog(context, "All fields are required");
                        return '';
                      } else if (value.isEmpty){
                        showErrorDialog(context, "Mobile Number is required");
                        return '';
                      } else if (value.length != 11 || !RegExp(r'^[0-9]{11}$').hasMatch(value)) {
                        showErrorDialog(context, "The mobile number must be 11 digits");
                        return '';
                      }
                      return null;
                    },
                    hintTextSize: ScreenUtil().setSp(15),
                    fontSize: ScreenUtil().setSp(15),
                    controller: mobilenumController,
                  ),
                SizedBox(height: ScreenUtil().setHeight(10)),

                // Password
                CustomTextFormField(
                  isObscure: isPasswordHidden,
                  height: ScreenUtil().setHeight(10),
                  width: ScreenUtil().setWidth(10),
                  onSaved: (value) {}, 
                  fontColor: Colors.black,
                  hintText: 'Password',
                  validator: (value) {
                   if (value == null || value.isEmpty) {
                        showErrorDialog(context, "All fields are required");
                        return '';
                   } else if (value.isEmpty){
                        showErrorDialog(context, "Password are required");
                        return '';
                    } else if (value.length < 8 ||
                        !RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])').hasMatch(value)) {
                      showErrorDialog(context, "Password should be 8 characters, a mixture of letters and numbers, and contain at least one special character with uppercase and lowercase letters.");
                      return '';
                    }
                    return null;
                  },
                  hintTextSize: ScreenUtil().setSp(15),
                  fontSize: ScreenUtil().setSp(15),
                  controller: passwordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordHidden ? Icons.visibility_off : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),

                Text(
                  '(Password should be at least 8 characters, with a mixture of letters, numbers, and special characters.)',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: ScreenUtil().setSp(10),
                  ),
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),

                // Confirm Password
                CustomTextFormField(
                  isObscure: isConfirmPasswordHidden,
                  height: ScreenUtil().setHeight(10),
                  width: ScreenUtil().setWidth(10),
                   onSaved: (value) {}, // 
                  fontColor: Colors.black,
                  hintText: 'Confirm Password',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Confirm Password is required';
                    } else if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  hintTextSize: ScreenUtil().setSp(15),
                  fontSize: ScreenUtil().setSp(15),
                  controller: confirmpasswordController,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConfirmPasswordHidden
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isConfirmPasswordHidden = !isConfirmPasswordHidden;
                      });
                    },
                  ),
                ),
                const Spacer(),

                // Already have an account? Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You have an account?',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: ScreenUtil().setSp(15),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.popAndPushNamed(context, '/login'),
                      child: Text(
                        ' Login Here',
                        style: TextStyle(
                          color: FB_DARK_PRIMARY,
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: ScreenUtil().setHeight(10)),

                // Submit Button
                CustomInkwellButton(
                  onTap: register,
                  height: ScreenUtil().setHeight(45),
                  width: ScreenUtil().setWidth(230),
                  fontSize: ScreenUtil().setSp(15),
                  fontWeight: FontWeight.bold,
                  buttonName: 'Submit',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
