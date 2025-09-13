import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/core/theme_manager/collor_pallete.dart';
import 'package:flutter_project/network/api_requests.dart';
import '../../core/routes/page_routes.dart';
import '../../core/constants/app_assets.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../network/shared_prefs_helper.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.appLogo,height: 185,),

              SizedBox(height: 50,),
              CustomTextFormField(
                controller: emailController,
                hintText: 'Email',
                prefixIcon: Icon(Icons.email,size: 30,),
                validator: (value){
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
                controller: passwordController,
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock,size: 30,),
                isPassword: true,
                validator: (value){
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
              Align(
            alignment: Alignment.centerRight,
            child: TextButton(onPressed: () {
              Navigator.pushNamed(context, PageRouteName.forget_password);
            },
              child: Text('Forget Password?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorPallete.yellow,
                  decorationColor: ColorPallete.yellow,
                  decorationThickness: 2,
                ),
              ),
            ),
          ),

              SizedBox(height: 30,),
              CustomButton(
                onTap: ()async {
                  if(_formKey.currentState!.validate()){
                    final loginData = {
                      "email": emailController.text,
                      "password": passwordController.text,
                    };
                    final response = await ApiRequests.login(loginData);
                    
                    if(response.statusCode == 200){
                      final Map<String, dynamic> data = jsonDecode(response.body);
                      print(data);

                      final tokenFromServer = data['data'] as String;

                      final SharedPrefsHelper _prefsHelper = SharedPrefsHelper();
                      await _prefsHelper.saveToken(tokenFromServer);

                      print("Login Success: ${data["data"]}");
                      Navigator.pushNamed(context, PageRouteName.home);
                    }else{
                      print("Login Failed: ${response.body}");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Login failed")),
                      );
                    };
                  }
                },
                child: Text(
                    'Login',
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
              Text("Don't Have Account ?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ColorPallete.white,
                  decorationColor: ColorPallete.yellow,
                  decorationThickness: 2,
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, PageRouteName.register),
                child: Text("Create One",
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
                padding: const EdgeInsets.symmetric(horizontal: 230.0),
                child: Row(
                  children: [
                    Expanded(child: Divider(
                      color: ColorPallete.yellow,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text("OR",style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ColorPallete.yellow,
                        decorationColor: ColorPallete.yellow,
                        decorationThickness: 2,
                      ),),),
                    Expanded(child: Divider(
                      color: ColorPallete.yellow,
                    )),
                  ],
                ),
              ),

              SizedBox(height: 30,),
              CustomButton(
                onTap: () {},
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppAssets.google,color: ColorPallete.scaffoldBackgroundColor,),
                    SizedBox(width: 1,),
                    Text(
                      'Login With Google',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: ColorPallete.scaffoldBackgroundColor,
                      ),)
                  ],
                )

              ),

              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 325.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.yellow, width: 2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: (){},
                          icon:
                          Image.asset(AppAssets.en)
                      ),
                      SizedBox(width: 10,),
                      IconButton(
                          onPressed: (){},
                          icon:
                          Image.asset(AppAssets.eg)
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
