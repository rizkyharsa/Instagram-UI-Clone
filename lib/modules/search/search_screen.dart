import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/constants/search_data.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 8),
                margin: const EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: Colors.grey.shade200),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/search_inactive.svg", width: 15, height: 15),
                    const SizedBox(width: 12),
                    const Text(
                      "Search",
                      style: TextStyle(fontFamily: 'SfProText', color: Colors.grey),
                    ),
                  ],
                ),
              ),
              GridView.custom(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 4,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: const [
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1),
                  ]
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: searchImages.length,
                  (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(searchImages[index]),fit: BoxFit.cover)
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
