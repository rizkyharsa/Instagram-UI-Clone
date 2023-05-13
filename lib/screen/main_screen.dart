import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/controllers/main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: controller.page[controller.currentIndex.value],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.search),
            activeIcon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.add_box_outlined),
            activeIcon: Icon(Icons.add_box_rounded),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.favorite_outline),
            activeIcon: Icon(Icons.favorite_rounded),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
          ),
        ],
      ),
    );
  }
}
