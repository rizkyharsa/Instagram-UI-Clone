import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/post_data.dart';
import 'package:instagram_clone/constants/stories_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        title: Image.asset("assets/images/instagram.png"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/like_inactive.svg"),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/messenger_inactive.svg"),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 80,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 12),
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: NetworkImage(profile), fit: BoxFit.cover)),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 18,
                                  height: 18,
                                  decoration: const BoxDecoration(shape: BoxShape.circle, color: white),
                                  child: const Icon(
                                    Icons.add_circle,
                                    color: buttonFollowColor,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Padding(
                            padding: EdgeInsets.only(left: 12),
                            child: Text(
                              "Your Story",
                              style: TextStyle(fontSize: 10, fontFamily: 'SfProText', color: black),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(width: 12),
                      ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: stories.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height: 63,
                                width: 63,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: storyBorderColor,
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    )),
                                child: Container(
                                  margin: const EdgeInsets.all(3),
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: white,
                                      width: 2,
                                    ),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        stories[index]['img'],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                          const SizedBox(height: 4),
                              Text(
                              "${stories[index]['name']}",
                              style: const TextStyle(fontSize: 10, fontFamily: 'SfProText', color: black),
                            ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 8);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Divider(height: 2),
              const SizedBox(height: 8),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 4, top: 4),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(posts[index]['profileImg']),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                posts[index]['name'],
                                style: const TextStyle(
                                  fontFamily: "SfProText",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.more_horiz_rounded),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        child: CachedNetworkImage(
                          imageUrl: posts[index]['postImg'],
                          fit: BoxFit.cover,
                          progressIndicatorBuilder: (context, url, progress) {
                            return Container();
                          },
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 4, top: 4),
                        child: Row(
                          children: [
                            posts[index]['isLoved']
                                ? SvgPicture.asset("assets/icons/like_active.svg", width: 27)
                                : SvgPicture.asset("assets/icons/like_inactive.svg", width: 27),
                            const SizedBox(width: 20),
                            SvgPicture.asset("assets/icons/comment.svg"),
                            const SizedBox(width: 20),
                            SvgPicture.asset("assets/icons/share.svg"),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: SvgPicture.asset("assets/icons/save.svg"),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8, top: 8),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(posts[index]['profileImg']),
                              radius: 10,
                            ),
                            const SizedBox(width: 6),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "Liked by ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SfProText',
                                      color: black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "${posts[index]['likedBy']} ",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SfProText',
                                      color: black,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: "and ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'SfProText',
                                      color: black,
                                    ),
                                  ),
                                  const TextSpan(
                                    text: "13,765 others",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'SfProText',
                                      color: black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, right: 12),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "${posts[index]['name']} ",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SfProText',
                                  color: black,
                                ),
                              ),
                              TextSpan(
                                text: "${posts[index]['caption']}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'SfProText',
                                  color: black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12, left: 12, top: 4),
                        child: Text(
                          "View all ${posts[index]['commentCount']} comments",
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontFamily: 'SfProText',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12, left: 12, bottom: 12),
                        child: Text(
                          "${posts[index]['timeAgo']}",
                          style: const TextStyle(
                            fontFamily: 'SfProText',
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
