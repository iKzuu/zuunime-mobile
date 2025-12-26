import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zuunimelist/app/modules/models/anime_model.dart';

class SearchItem extends StatelessWidget {
  final Anime anime;
  const SearchItem({super.key, required this.anime});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth,
      decoration: BoxDecoration(color: Colors.transparent),
      child: Row(
        spacing: 12,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 140,
                child: CachedNetworkImage(
                  width: 100,
                  imageUrl: anime.webp!.imageUrl ?? "",
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Container(color: Colors.grey[900]),
                ),
              ),
              Positioned(
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(color: Color(0xFFF544CF)),
                  alignment: Alignment.center,
                  child: Row(
                    spacing: 4,
                    children: [
                      Text(
                        anime.formattedScore,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.star_border_rounded,
                        size: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                spacing: 28,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        anime.title,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "${anime.type ?? ""}, ${anime.episodes} ep, ${anime.formattedSeason}",
                        style: TextStyle(
                          color: Color(0xFFC6C6C6),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    spacing: 4,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        anime.formattedMembers,
                        style: TextStyle(
                          color: Color(0xFFC6C6C6),
                          fontSize: 10,
                        ),
                      ),

                      Icon(
                        Icons.people_outline_rounded,
                        size: 16,
                        color: Color(0xFFC6C6C6),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
