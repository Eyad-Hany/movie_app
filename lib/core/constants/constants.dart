import 'package:flutter/material.dart';
import 'package:flutter_project/modules/home/sub_modules/browse_tab/browse_view.dart';
import 'package:flutter_project/modules/home/sub_modules/home_tab/home_tab_view.dart';
import 'package:flutter_project/modules/home/sub_modules/search_tab/search_view.dart';
import '../../modules/home/sub_modules/profile_tab/profile_view.dart';

abstract class Constants{
  static List<Widget> screens = [
    HomeTabView(),
    SearchView(),
    BrowseView(),
    ProfileView(),
  ];
}