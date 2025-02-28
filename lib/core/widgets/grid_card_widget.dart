import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class GridCardsWidget<T> extends StatelessWidget {
  final List<T> data;
  final String Function(T) getImageUrl;
  final String Function(T) getTitle;
  final String Function(T) getSubTitle;
  final void Function(BuildContext, T) onTap;

  const GridCardsWidget({
    super.key,
    required this.data,
    required this.getImageUrl,
    required this.getTitle,
    required this.onTap,
    required this.getSubTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          final item = data[index];
          return InkWell(
            onTap: () => onTap(context, item),
            child: Stack(
              children: [
                Transform(
                  transform: Matrix4.identity()
                    ..setEntry(3, 2, 0.01)
                    ..rotateY(-0.06)
                    ..rotateX(-0.1),
                  alignment: FractionalOffset.bottomLeft,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.purple,
                          Colors.deepPurple,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CachedNetworkImage(
                    imageUrl: getImageUrl(item),
                    height: 100,
                    width: 100,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error, color: Colors.white),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        getTitle(item),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          letterSpacing: 2.0,
                        ),
                      ),
                      Text(
                        getSubTitle(item),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
