import 'package:flutter/material.dart';
import 'package:flutter_project/core/constants/app_assets.dart';
import '../../core/routes/page_routes.dart';
import '../../core/theme_manager/collor_pallete.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_text_form_field.dart';
import '../../network/shared_prefs_helper.dart';

class UpdateProfileView extends StatefulWidget {
  const UpdateProfileView({super.key});

  @override
  State<UpdateProfileView> createState() => _UpdateProfileViewState();
}

class _UpdateProfileViewState extends State<UpdateProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _avatarController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final SharedPrefsHelper _prefsHelper = SharedPrefsHelper();
    final savedName = await _prefsHelper.getName();
    final savedPhone = await _prefsHelper.getPhone();
    final savedAvatar = await _prefsHelper.getAvatar();

    setState(() {
      if (savedName != null) _nameController.text = savedName;
      if (savedPhone != null) _phoneController.text = savedPhone;
      if (savedAvatar != null) _avatarController.text = savedAvatar;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pick Avatar',
          style: TextStyle(
            fontSize: 24,
            color: ColorPallete.yellow
          ),
    ),
        iconTheme: IconThemeData(
            color: ColorPallete.yellow,
            size: 30
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0,left: 20,right: 20,bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    backgroundColor: ColorPallete.generalTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context){
                      final avatars = [
                        AppAssets.boy1,
                        AppAssets.boy2,
                        AppAssets.boy3,
                        AppAssets.boy4,
                        AppAssets.boy5,
                        AppAssets.boy6,
                        AppAssets.boy7,
                        AppAssets.boy8,
                        AppAssets.boy9,
                      ];
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          height:MediaQuery.of(context).size.height * 0.6,
                          child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 15,
                              ),
                            itemCount: avatars.length,
                            itemBuilder: (context,index){
                                return GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      _avatarController.text=avatars[index];
                                    });

                                    final SharedPrefsHelper _prefsHelper = SharedPrefsHelper();
                                    await _prefsHelper.saveAvatar(avatars[index]);

                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10.0,left: 10,right: 10,bottom: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: ColorPallete.generalTextColor,
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: ColorPallete.yellow,
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.asset(
                                            avatars[index],
                                          ),
                                        ),
                                      ),

                                    ),
                                  ),
                                );
                            }
                          ),
                        ),
                      );

                    }
                );

              } ,
              child: _avatarController.text.isNotEmpty
                  ? Image.asset(_avatarController.text, height: 185)
                  : Image.asset(AppAssets.boy1, height: 185),

            ),
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
                Navigator.pushNamed(context, PageRouteName.reset_password);
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
            SizedBox(height: 20),
            Spacer(),
            CustomButton(
              backgroundColor: ColorPallete.red,
              onTap: () async {
                final SharedPrefsHelper _prefsHelper = SharedPrefsHelper();
                await _prefsHelper.deleteAccount();
                Navigator.pushNamedAndRemoveUntil(
                    context, PageRouteName.login, (route) => false);
              },
              child: Text(
                'Delete Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: ColorPallete.white,
                ),
              ),
            ),
            SizedBox(height: 20,),
            CustomButton(
              onTap: () async {
                final SharedPrefsHelper _prefsHelper = SharedPrefsHelper();

                await _prefsHelper.saveName(_nameController.text);
                await _prefsHelper.savePhone(_phoneController.text);

                  Navigator.pushNamed(context, PageRouteName.profile_tab);

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
