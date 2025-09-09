import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_assets.dart';

import '../../core/routes/page_routes.dart';
import '../../core/theme_manager/collor_pallete.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_form_field.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pick Avatar',
          style: TextStyle(
            fontSize: 24,
          ),
    ),
        iconTheme: IconThemeData(
            color: ColorPallete.yellow,
            size: 30
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.boy1),
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
              controller: _phoneController,
              hintText: 'Phone Number',
              prefixIcon: Icon(Icons.phone,size: 30,),
              validator: (value) {
                final RegExp phoneRegex = RegExp(r'^\d{11}$');
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                if(!phoneRegex.hasMatch(value))
                  return 'Please enter a valid phone number';
              },
            ),
            SizedBox(height: 30,),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(onPressed: () {
                Navigator.pushNamed(context, PageRouteName.forget_password);
              },
                child: Text('Reset Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorPallete.white,
                    decorationColor: ColorPallete.white,
                    decorationThickness: 2,
                  ),
                ),
              ),
            ),
            Spacer(),
            CustomButton(
              onTap: () {
                  Navigator.pushNamed(context, PageRouteName.home);
              },
              child: Text(
                'Delete Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: ColorPallete.red,
                ),
              ),
            ),
            SizedBox(height: 30,),
            CustomButton(
              onTap: () {
                  Navigator.pushNamed(context, PageRouteName.home);
              },
              child: Text(
                'Update Data',
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
    );
  }
}
