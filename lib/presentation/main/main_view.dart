import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../presentation/main/pages/home/view/home_page.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/style_manager.dart';
import 'pages/aboutus/aboutus_page.dart';
import 'pages/likes/view/likes_page.dart';
import 'pages/menu/view/menu_page.dart';
import 'pages/rent/rent_page.dart';
class MainView extends StatefulWidget {
  const MainView({super.key});
  @override
  MainViewState createState() => MainViewState();
}
class MainViewState extends State<MainView> {
  List<Widget> pages = [
    const HomePage(),
    const LikePage(),
    const MenuPage(),
    const RentPage(),
    const AboutUsPage()
  ];
  List<String> titles = [
    AppStrings.homeTitle.tr(),
    AppStrings.likeTitle.tr(),
    AppStrings.menuTitle.tr(),
    AppStrings.rentTitle.tr(),
    AppStrings.aboutUsTitle.tr(),
  ];
  var _title = AppStrings.homeTitle.tr();
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          shadowColor: ColorManager.lightGrey,
          elevation: 0.2,
          title: Text(_title, style: getBoldStyle(color: ColorManager.black)),
        ),
        body: Stack(children: <Widget>[
          pages[_currentIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: BottomNavigationBar(
                backgroundColor: ColorManager.white.withValues(alpha: 0.5),
                iconSize: 20.0,
                elevation: 0,
                selectedItemColor: ColorManager.black,
                unselectedItemColor: ColorManager.grey,
                currentIndex: _currentIndex,
                onTap: onTap,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                type: BottomNavigationBarType.fixed,
                items: [
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.home_outlined), label: ''),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.favorite_outline_rounded),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        ImageAssets.menu,
                        height: 20.0,
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.add_circle_outline), label: ''),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.person_outlined), label: ''),
                ],
              ),
            ),
          ),
        ]));
  }
  onTap(int index) {
    setState(() {
      _currentIndex = index;
      _title = titles[index];
    });
  }
}