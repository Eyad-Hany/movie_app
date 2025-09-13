import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_project/network/api_requests.dart';
import 'package:flutter_project/network/shared_prefs_helper.dart';
import '../../core/routes/page_routes.dart';
import '../../core/theme_manager/collor_pallete.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_form_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPasswordController  = TextEditingController();
  final TextEditingController _newPasswordController  = TextEditingController();
  final SharedPrefsHelper _prefsHelper = SharedPrefsHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password',
        style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: ColorPallete.yellow
        ),
      ),
        iconTheme: IconThemeData(
            color: ColorPallete.yellow,
            size: 30
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 150.0,left: 20,right: 20,bottom: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextFormField(
                controller: _oldPasswordController,
                hintText: 'Current Password',
                isPassword: true,
                prefixIcon: Icon(Icons.lock,size: 30,),
                validator: (value) {
                  final RegExp passwordRegex = RegExp(
                      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&^#()_+=\-[\]{};:"\\|,.<>\/?]).{8,20}$'
                  );
                  if(value == null || value.isEmpty){
                    return 'Please enter your Current password';
                  }
                  if(!passwordRegex.hasMatch(value)){
                    return 'Invalid Password';
                  }
                  return null;
                },


              ),
              SizedBox(height: 30,),
              CustomTextFormField(
                controller: _newPasswordController,
                hintText: 'New Password',
                isPassword: true,
                prefixIcon: Icon(Icons.lock,size: 30,),
                validator: (value) {
                  final RegExp passwordRegex = RegExp(
                      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&^#()_+=\-[\]{};:"\\|,.<>\/?]).{8,20}$'
                  );
                  if(value == null || value.isEmpty){
                    return 'Please enter your New password';
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
                    return 'Please re-enter your new password';
                  }
                  if (value != _newPasswordController.text) {
                    return 'Password does not match';
                  }
                },

                isPassword: true,
              ),
              SizedBox(height: 150,),
              CustomButton(
                onTap: () async {
                   if (_formKey.currentState!.validate()) {
                     final token = await _prefsHelper.getToken();

                     if (token == null) {
                       ScaffoldMessenger.of(context).showSnackBar(
                         const SnackBar(content: Text("Token not found. Please login again.")),
                       );
                       return;
                     }

                     final data = {
                       "oldPassword" : _oldPasswordController.text,
                       "newPassword" : _newPasswordController.text,
                     };

                     final response = await ApiRequests.resetPassword(data,token);

                     if(response.statusCode == 200){
                       ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text("Password updated successfully")),
                       );
                       Navigator.pushNamed(context, PageRouteName.login);
                     } else {
                       // parse JSON response
                       final Map<String, dynamic> resBody = jsonDecode(response.body);
                       String errorMessage = resBody['message'] ?? "Failed to update password";

                       ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(content: Text(errorMessage)),
                       );
                     }
                   }
                },
                child: Text(
                  'Update Password',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: ColorPallete.scaffoldBackgroundColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
