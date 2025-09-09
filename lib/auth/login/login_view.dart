import 'package:flutter/material.dart';
import 'package:flutter_project/core/theme_manager/collor_pallete.dart';
import '../../core/routes/page_routes.dart';
import '../../core/constants/app_assets.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_form_field.dart';

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

              SizedBox(height: 100,),
              CustomTextFormField(
                hintText: 'Email',
                prefixIcon: Icon(Icons.email,size: 30,),
                validator: (value){
                  if(value == null || value.isEmpty){
                   return 'Please enter your email';
                  }
                  return null;
                },
              ),

              SizedBox(height: 30,),
              CustomTextFormField(
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock,size: 30,),
                isPassword: true,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Please enter your email';
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
                onTap: () {
                  if(_formKey.currentState!.validate()){
                    Navigator.pushNamed(context, PageRouteName.home);
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
      )
    );
  }
}
