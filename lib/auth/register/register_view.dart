import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_assets.dart';
import 'package:flutter_project/core/routes/page_routes.dart';
import 'package:flutter_project/core/widgets/custom_text_form_field.dart';
import 'package:flutter_project/network/shared_prefs_helper.dart';
import '../../core/theme_manager/collor_pallete.dart';
import '../../core/widgets/custom_button.dart';
import '../../network/api_requests.dart';

class RegisterView extends StatefulWidget {

  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final SharedPrefsHelper _prefsHelper = SharedPrefsHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Register',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: ColorPallete.yellow,
          ),
        ),
        iconTheme: IconThemeData(
            color: ColorPallete.yellow,
            size: 30
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(AppAssets.registerr),
                  SizedBox(height: 30,),
                  CustomTextFormField(
                    controller: _nameController,
                    hintText: 'Name',
                    prefixIcon: Icon(Icons.person,size: 30,),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30,),
                  CustomTextFormField(
                    controller: _emailController,
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email,size: 30,),
                    validator: (value) {
                      final RegExp emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if(!emailRegex.hasMatch(value)){
                        return 'Please enter a valid email';
                      }
          
                      return null;
                    },
                  ),
                  SizedBox(height: 30,),
                  CustomTextFormField(
                    controller: _passwordController,
                    hintText: 'Password',
                    isPassword: true,
                    prefixIcon: Icon(Icons.lock,size: 30,),
                    validator: (value) {
                      final RegExp passwordRegex = RegExp(
                          r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&^#()_+=\-[\]{};:"\\|,.<>\/?]).{8,20}$'
                      );
                      if(value == null || value.isEmpty){
                        return 'Please enter your password';
                      }
                      if(!passwordRegex.hasMatch(value)){
                        return 'Please enter a valid password';
                      }
                      return null;
                    },
          
          
                  ),
                  SizedBox(height: 30,),
                  CustomTextFormField(
                    hintText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock,size: 30,),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please re-enter your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Password does not match';
                      }
                    },
          
                    isPassword: true,
                  ),
                  SizedBox(height: 30,),
                  CustomTextFormField(
                    controller: _phoneController,
                    hintText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone,size: 30,),
                    validator: (value) {
                      final RegExp phoneRegex = RegExp(r'^(?:\+201|01)[0-2,5]\d{8}$');
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      if(!phoneRegex.hasMatch(value)){
                      return 'Please enter a valid phone number';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30,),
                  CustomButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        final userData = {
                          "name": _nameController.text,
                          "email": _emailController.text,
                          "password": _passwordController.text,
                          "confirmPassword": _passwordController.text,
                          "phone": _phoneController.text,
                          "avaterId": 1,
                        };

                        final response = await ApiRequests.register(userData);
                        final responseData = jsonDecode(response.body);

                        if (response.statusCode == 200 || response.statusCode == 201) {
                          print("Register Success: $responseData");

                          await _prefsHelper.saveName(_nameController.text);
                          await _prefsHelper.savePhone(_phoneController.text);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Register Success")),
                          );
                          Navigator.pushNamed(context, PageRouteName.login);
                        } else {
                          print("Register Failed: $responseData");
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${responseData['message']}")),
                          );
                        }
                      }
                    },

                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: ColorPallete.scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Have Account ?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: ColorPallete.white,
                          decorationColor: ColorPallete.yellow,
                          decorationThickness: 2,
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text("Login",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: ColorPallete.yellow,
                            decorationColor: ColorPallete.yellow,
                            decorationThickness: 2,
                          ),
          
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 330.0),
                    child: CustomButton(
                        backgroundColor: Colors.transparent,
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Image.asset(AppAssets.en)),
                            const SizedBox(width: 9),
                            Expanded(child: Image.asset(AppAssets.eg)),
                          ],
                        )
          
          
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
