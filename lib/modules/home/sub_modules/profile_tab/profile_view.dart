import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_assets.dart';

import '../../../../core/routes/page_routes.dart';
import '../../../../core/theme_manager/collor_pallete.dart';
import '../../../../core/widgets/custom_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 450,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorPallete.generalTextColor,
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppAssets.boy1,height: 150,),
                        SizedBox(width: 100,),
                        Column(
                          children: [
                            Text("12",style: TextStyle(fontSize:50 ,fontWeight:FontWeight.w700 ,color: ColorPallete.white),),
                            Text("Wish List",style: TextStyle(fontSize:24 ,fontWeight:FontWeight.w700 ,color: ColorPallete.white),)
                          ],
                        ),
                        SizedBox(width: 150,),
                        Column(
                          children: [
                            Text("10",style: TextStyle(fontSize:50 ,fontWeight:FontWeight.w700 ,color: ColorPallete.white),),
                            Text("History",style: TextStyle(fontSize:24 ,fontWeight:FontWeight.w700 ,color: ColorPallete.white),)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Text(
                            "John Safwat",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: ColorPallete.white,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 450,
                          child: CustomButton(
                            onTap: () {
                                Navigator.pushNamed(context, PageRouteName.update_profile);
                              },
                            child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: ColorPallete.generalTextColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          width: 280,
                          child: CustomButton(
                            backgroundColor: ColorPallete.red,
                            onTap: () {
                              Navigator.pushNamed(context, PageRouteName.login);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Exit',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: ColorPallete.white,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.exit_to_app,
                                  color: ColorPallete.white,
                                  size: 30,
                                ),
                              ],
                            ),
      
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 400,
                          child: Icon(
                            Icons.list,
                            color: ColorPallete.yellow,
                            size: 50,
                          )
                        ),
                        SizedBox(width: 100),
                        SizedBox(
                          child: Icon(
                          Icons.folder,
                          color: ColorPallete.yellow,
                          size: 50,
                        )
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 150,),
                        Text("Watch List",style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: ColorPallete.white,
                        ),),
                        SizedBox(width: 210,),
                        Text("History",style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: ColorPallete.white,
                        ),
                        ),
                      ],
                    )
      
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
