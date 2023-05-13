import 'package:get/get.dart';
import 'package:instagram_clone/modules/home/home_screen.dart';
import 'package:instagram_clone/modules/post/post_screen.dart';
import 'package:instagram_clone/modules/profile/profile_screen.dart';
import 'package:instagram_clone/modules/reels/reels_screen.dart';
import 'package:instagram_clone/modules/search/search_screen.dart';

class MainController extends GetxController{
  final currentIndex = 0.obs;
  final List page = [
    const HomeScreen(),
    const SearchScreen(),
    const PostScreen(),
    const ReelsScreen(),
    const ProfileScreen(),
  ];
}