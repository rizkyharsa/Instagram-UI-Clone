import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/constants/colors.dart';
import 'package:instagram_clone/constants/post_data.dart';

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
        child: ListView.builder(
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
      ),
    );
  }
}
