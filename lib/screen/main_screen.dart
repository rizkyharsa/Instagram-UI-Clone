import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/controllers/main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: controller.page[controller.currentIndex.value],
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            controller.currentIndex(value);
          },
          currentIndex: controller.currentIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: white,
          items: [
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset("assets/icons/home_inactive.svg"),
              activeIcon: SvgPicture.asset("assets/icons/home_active.svg"),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset("assets/icons/search_inactive.svg"),
              activeIcon: SvgPicture.asset("assets/icons/search_active.svg"),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset("assets/icons/add_post.svg"),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: SvgPicture.asset("assets/icons/reels_inactive.svg"),
              activeIcon: SvgPicture.asset("assets/icons/reels_active.svg"),
            ),
            const BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.person_outline_rounded),
              activeIcon: Icon(Icons.person_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
