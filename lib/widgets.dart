import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:shimmer/shimmer.dart';

Image loadImage(String imageUrl,String blurhash, {BoxFit fit = BoxFit.cover}) =>
    Image.network(
      imageUrl,
      fit: fit,
      errorBuilder: (context, _, e){
        return  BlurHash(hash: blurhash);
      },
      loadingBuilder: (BuildContext context, Widget child,
          ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return BlurHash(hash: blurhash);
      },
    );


Widget loaderWidget(BuildContext context) =>
    Container(
      height: MediaQuery.of(context).size.height,

      child: Column(children: [Expanded(child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2), children: List.generate(8, (index) =>
          Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.blueGrey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: SizedBox(
                    child: Card(
                      surfaceTintColor: Colors.white,
                      color: Colors.white,
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(0),
                        child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(
                                10),
                            child: Container(height: 250, width: 250,)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    ClipOval(
                      child: Container(
                        height: 30, width: 30, color: Colors.grey,),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: Text(
                          'Author',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 12),
                          maxLines: 1,
                          textAlign: TextAlign.start,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),

              ],
            ),
          )),))],),
    );


Widget singleLoadingWidget() =>Shimmer.fromColors(
  baseColor: Colors.grey,
  highlightColor: Colors.blueGrey,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Expanded(
        child: SizedBox(
          child: Card(
            surfaceTintColor: Colors.white,
            color: Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(
                      10),
                  child: Container(height: 250, width: 250,)),
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment:
        MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 5,
          ),
          ClipOval(
            child: Container(
              height: 30, width: 30, color: Colors.grey,),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Text(
                'Author',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 12),
                maxLines: 1,
                textAlign: TextAlign.start,
              ))
        ],
      ),
      const SizedBox(
        height: 5,
      ),

    ],
  ),
);
