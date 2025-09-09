import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_assets.dart';
import 'package:flutter_project/core/theme_manager/collor_pallete.dart';

import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_form_field.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Forget Password',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: ColorPallete.yellow
      ),
        ),
          iconTheme: IconThemeData(
            color: ColorPallete.yellow,
            size: 30
          )
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.forget_Password),
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
            CustomButton(
              child: Text("Verify Email",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: ColorPallete.scaffoldBackgroundColor,
                ),
              ),
              onTap: (){},
            ),

          ],
        ),
      ),
    );
  }
}
