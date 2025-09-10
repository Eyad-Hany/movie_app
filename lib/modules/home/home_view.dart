import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/constants.dart';
import '../../core/theme_manager/collor_pallete.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Constants.screens[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: ColorPallete.scaffoldBackgroundColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              backgroundColor: ColorPallete.generalTextColor,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.yellow,
                unselectedItemColor: Colors.white,
                currentIndex: selectedIndex,
                onTap: (int index){
                  setState(() {
                    selectedIndex = index;
                  });
                },

                items: [
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ImageIcon(AssetImage(AppAssets.home),size: 30,),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ImageIcon(AssetImage(AppAssets.homefill),size: 30,),
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ImageIcon(AssetImage(AppAssets.search),size: 30,),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ImageIcon(AssetImage(AppAssets.searchfill),size: 30,),
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ImageIcon(AssetImage(AppAssets.browse),size: 30,),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ImageIcon(AssetImage(AppAssets.browsefill),size: 30,),
                      ),
                      label: ""),
                  BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ImageIcon(AssetImage(AppAssets.profile),size: 30,),
                      ),
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: ImageIcon(AssetImage(AppAssets.profilefill),size: 30,),
                      ),
                      label: ""),

            ]),
          ),
        ),
      ),
    );
  }
}
