import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AnimeShimmerLoading extends StatelessWidget {
  const AnimeShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: 242,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) {
                  return SizedBox(width: 10);
                },
                itemCount: 6,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 140,
                    height: 242,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(color: Colors.white),
                        ),

                        SizedBox(height: 4),

                        Container(
                          width: 140,
                          height: 14,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
