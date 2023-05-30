import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) { 
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
