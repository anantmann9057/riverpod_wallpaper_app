import 'dart:convert';
import 'dart:math';

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:path_provider/path_provider.dart';
import 'package:river_pod/category_screen.dart';
import 'package:river_pod/firebase_options.dart';
import 'package:river_pod/search_screen.dart';
import 'package:river_pod/service/authentication/authentication.dart';
import 'package:river_pod/service/category_service/CategoryService.dart';
import 'package:river_pod/service/photo_service/photo_service.dart';
import 'package:river_pod/service/photo_service/photos_model.dart';
import 'package:river_pod/service/product_swrvice/products_model.dart';
import 'package:river_pod/service/product_swrvice/product_service.dart';
import 'package:river_pod/service/topics_service/topic_image/topic_image_model.dart';
import 'package:river_pod/service/topics_service/topic_image/topic_image_service.dart';
import 'package:river_pod/service/topics_service/topics_service.dart';
import 'package:river_pod/service/user_profile_screen.dart';
import 'package:river_pod/strings.dart';
import 'package:river_pod/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}

final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
});

TextEditingController textEditingController = TextEditingController()
  ..text = '';

var selectedIndex = StateProvider((ref) => 0);
var bottomSelectedIndex = StateProvider((ref) => 0);
var screens = [
  HomeScreen(),
  const SearchScreen(),
  const CategoryScreen(),
  const UserProfileScreen()
];
var selectedScreen = StateProvider((ref) => 0);

var selectedItemId = StateProvider((ref) => 0);

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialize = ref.watch(firebaseinitializerProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Comfortaa',
        useMaterial3: true,
      ),
      home: initialize.when(
          data: (value) => const MyHomePage(),
          error: (error, _) => Container(),
          loading: () => const SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(),
              )),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _auth = ref.watch(authenticationProvider);

    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: ref.watch(bottomSelectedIndex),
            unselectedItemColor: Colors.deepPurple,
            onTap: (index) {
              if (index == 3) {
                ref.watch(authStateProvider).when(
                    data: (value) async {
                      if (value == null) {
                        await _auth.signInWithGoogle(context).whenComplete(() =>
                            _auth.authStateChange.listen((event) async {
                              if (event == null) {
                                return;
                              } else {
                                ref.read(selectedScreen.notifier).state = index;
                                ref.read(bottomSelectedIndex.notifier).state =
                                    index;
                              }
                            }));
                      } else {
                        ref.watch(selectedScreen.notifier).state = index;
                        ref.watch(bottomSelectedIndex.notifier).state = index;
                      }
                    },
                    error: (error, _) => null,
                    loading: () => null);
              } else {
                ref.watch(selectedScreen.notifier).state = index;
                ref.watch(bottomSelectedIndex.notifier).state = index;
              }
            },
            selectedItemColor: Colors.deepPurpleAccent,
            selectedLabelStyle: const TextStyle(color: Colors.deepPurple),
            unselectedLabelStyle:
                const TextStyle(color: Colors.deepPurpleAccent),
            items: [
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.option), label: 'Collections'),
              BottomNavigationBarItem(
                  icon: StreamBuilder(
                      stream: _auth.authStateChange,
                      builder: (_, snapshot) => snapshot.hasData
                          ? ClipOval(
                              child: SizedBox(
                              height: 25,
                              width: 25,
                              child:
                                  loadImage(snapshot.data?.photoURL ?? "", "LJExbC%h?H={9ZR*WBt7~AK5tRni"),
                            ))
                          : Icon(Icons.person)),
                  label: 'Profile')
            ]),
        body: IndexedStack(
          children: screens,
          index: ref.watch(selectedScreen),
        ));
  }
}

PagingController<int, TopicImageModel> pagingController =
    PagingController(firstPageKey: 1, invisibleItemsThreshold: 1);

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _user = ref.watch(authenticationProvider);

    return Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
              child: ref.watch(topicsServiceProvider(1)).when(
                  data: (data) => Column(
                        children: [
                          Consumer(builder: (context, ref, child) {
                            var selectedTopic =
                                ref.watch(selectedTopicProvider);
                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: List.generate(
                                    data.length,
                                    (index) => InkWell(
                                          onTap: () async {
                                            ref
                                                .watch(selectedTopicProvider
                                                    .notifier)
                                                .state = index;

                                           pagingController.itemList = await ref
                                                .watch(
                                                    topicImageServiceProvider(
                                                            data[index].id ??
                                                                "nP3wxbG8GrM")
                                                        .notifier)
                                                .getTopicImages(1);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Column(
                                              children: [
                                                Text(
                                                  data[index].title ?? "",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:selectedTopic==index ?Colors.deepPurple:Colors.black),
                                                ),
                                                Visibility(
                                                    visible:
                                                        selectedTopic == index,
                                                    child: Container(
                                                      margin: EdgeInsets.only(top: 5),
                                                      width: 30,
                                                      height: 3,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Colors
                                                              .deepPurple),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        )),
                              ),
                            );
                          }),
                          Expanded(
                            child: Consumer(builder: (context, ref, child) {
                              var topicsImageProvider = ref.watch(
                                  topicImageServiceProvider(
                                      data[ref.watch(selectedTopicProvider)]
                                              .id ??
                                          ""));
                              return MediaQuery.removePadding(context: context,removeTop: true, child: PagedGridView<int, TopicImageModel>(
                                pagingController: pagingController
                                  ..addPageRequestListener((pageKey) async {
                                    try {
                                      final newItems = await ref
                                          .watch(topicImageServiceProvider(data[
                                      ref.watch(
                                          selectedTopicProvider)]
                                          .id ??
                                          "")
                                          .notifier)
                                          .getTopicImages(pageKey);
                                      print(newItems);
                                      final isLastPage = newItems.length < 10;
                                      if (isLastPage) {
                                      } else {
                                        final nextPageKey = pageKey + 1;
                                        pagingController.appendPage(
                                            newItems, nextPageKey);
                                      }
                                    } catch (error) {
                                      pagingController.error = error;
                                    }
                                  }),
                                builderDelegate: PagedChildBuilderDelegate(
                                    newPageProgressIndicatorBuilder:
                                        (context) => singleLoadingWidget(),
                                    firstPageProgressIndicatorBuilder:
                                        (context) => loaderWidget(context),
                                    itemBuilder:
                                        (BuildContext context,
                                        TopicImageModel item,
                                        int index) =>
                                        SizedBox(
                                          child: InkWell(
                                            onTap: () async {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (BuildContext context) => Stack(
                                                    fit: StackFit.expand,
                                                    children: [
                                                      loadImage(
                                                          item.urls?.regular ?? "",
                                                          item.blurHash ?? "LJExbC%h?H={9ZR*WBt7~AK5tRni"),
                                                      Align(
                                                        alignment: Alignment.bottomCenter,
                                                        child: Container(
                                                          decoration: BoxDecoration(boxShadow: [
                                                            BoxShadow(
                                                                color: Colors.black
                                                                    .withOpacity(0.1),
                                                                spreadRadius: 10,
                                                                blurRadius: 10)
                                                          ]),
                                                          child: Column(
                                                            mainAxisSize: MainAxisSize.min,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets.symmetric(
                                                                    horizontal: 10),
                                                                child: Column(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                            child: Text(
                                                                              item.altDescription ?? '',
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow
                                                                                  .fade,
                                                                              style:
                                                                              const TextStyle(
                                                                                color: Colors.white,
                                                                                shadows: [
                                                                                  Shadow(
                                                                                    blurRadius:10.0,  // shadow blur
                                                                                    color: Colors.black, // shadow color
                                                                                    offset: Offset(2.0,2.0), // how much shadow will be shown
                                                                                  ),
                                                                                ],
                                                                                fontSize: 18,
                                                                                fontWeight:
                                                                                FontWeight.w700,
                                                                              ),
                                                                              textAlign:
                                                                              TextAlign.start,
                                                                            )),
                                                                      ],
                                                                    ),
                                                                    Visibility(
                                                                        visible: (item.description??"").isNotEmpty,
                                                                        child: Row(
                                                                      children: [
                                                                        Expanded(
                                                                            child: Text(
                                                                              item.description ?? '',
                                                                              maxLines: 2,
                                                                              overflow: TextOverflow
                                                                                  .ellipsis,
                                                                              style:
                                                                              const TextStyle(
                                                                                color: Colors.white,
                                                                                shadows: [
                                                                                  Shadow(
                                                                                    blurRadius:10.0,  // shadow blur
                                                                                    color: Colors.black, // shadow color
                                                                                    offset: Offset(2.0,2.0), // how much shadow will be shown
                                                                                  ),
                                                                                ],
                                                                                fontSize: 12,
                                                                                fontWeight:
                                                                                FontWeight.w400,
                                                                              ),
                                                                              textAlign:
                                                                              TextAlign.start,
                                                                            )),
                                                                      ],
                                                                    )),

                                                                    const SizedBox(
                                                                      height: 10,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        const Icon(
                                                                          Icons
                                                                              .favorite_outline,
                                                                          color: Colors.red,
                                                                          size: 15,
                                                                        ),
                                                                        Text(
                                                                          "${item.user?.totalLikes}" ??
                                                                              '0',
                                                                          maxLines: 2,
                                                                          overflow: TextOverflow
                                                                              .ellipsis,
                                                                          style:
                                                                          const TextStyle(
                                                                            fontSize: 12,
                                                                            fontWeight:
                                                                            FontWeight.w700,
                                                                            color: Colors.red,
                                                                          ),
                                                                          textAlign:
                                                                          TextAlign.start,
                                                                        ),
                                                                        const SizedBox(
                                                                          width: 5,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              // CarouselSlider(
                                                              //   options: CarouselOptions(
                                                              //       height:
                                                              //       MediaQuery.of(context)
                                                              //           .size
                                                              //           .height /
                                                              //           4,
                                                              //
                                                              //       enlargeCenterPage: false,
                                                              //       enlargeFactor: 0.5,
                                                              //       viewportFraction: .4),
                                                              //   items: item.previewPhotos
                                                              //       ?.map((i) {
                                                              //     return Builder(
                                                              //       builder:
                                                              //           (BuildContext context) {
                                                              //         return Padding(
                                                              //           padding:
                                                              //           EdgeInsets.all(10),
                                                              //           child: ClipRRect(
                                                              //               borderRadius:
                                                              //               BorderRadius
                                                              //                   .circular(
                                                              //                   10),
                                                              //               child: Container(
                                                              //                 width:
                                                              //                 MediaQuery.of(
                                                              //                     context)
                                                              //                     .size
                                                              //                     .width,
                                                              //                 height:
                                                              //                 MediaQuery.of(
                                                              //                     context)
                                                              //                     .size
                                                              //                     .height,
                                                              //                 child: loadImage(
                                                              //                     i.urls?.regular ??
                                                              //                         '',
                                                              //                     i.blurHash ??
                                                              //                         "LJExbC%h?H={9ZR*WBt7~AK5tRni",
                                                              //                     fit: BoxFit
                                                              //                         .cover),
                                                              //               )),
                                                              //         );
                                                              //       },
                                                              //     );
                                                              //   }).toList(),
                                                              // ),
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  isScrollControlled: true);
                                            },
                                            child: Column(
                                              mainAxisSize:
                                              MainAxisSize.min,
                                              children: [
                                                Expanded(
                                                  child: Card(
                                                    surfaceTintColor:
                                                    Colors.white,
                                                    color: Colors.white,
                                                    elevation: 8,
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .all(0),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            10),
                                                        child: Container(
                                                          height:
                                                          item.height! /
                                                              2,
                                                          width:
                                                          item.width! /
                                                              2,
                                                          child: loadImage(
                                                              item.urls
                                                                  ?.smallS3! ??
                                                                  "",
                                                              item.blurHash ??
                                                                  "LJExbC%h?H={9ZR*WBt7~AK5tRni",
                                                              fit: BoxFit
                                                                  .cover),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .start,
                                                  children: [
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    SizedBox(
                                                      height: 30,
                                                      width: 30,
                                                      child: ClipOval(
                                                        child: loadImage(
                                                            item
                                                                .user
                                                                ?.profileImage
                                                                ?.small ??
                                                                '',
                                                            item.blurHash ??
                                                                "LJExbC%h?H={9ZR*WBt7~AK5tRni"),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                          item.user?.social
                                                              ?.instagramUsername ??
                                                              item.user?.social
                                                                  ?.twitterUsername ??
                                                              item.user?.name ??
                                                              '',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                          const TextStyle(
                                                              fontWeight:
                                                              FontWeight
                                                                  .w700,
                                                              fontSize: 12),
                                                          maxLines: 1,
                                                          textAlign:
                                                          TextAlign.start,
                                                        ))
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                  MediaQuery.of(context).size.shortestSide <
                                      550
                                      ? 2
                                      : 4,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                ),
                              ),);
                            }),
                          )
                        ],
                      ),
                  error: (error, stack) {
                    print(stack);
                    return Text(error.toString() + stack.toString());
                  },
                  loading: () => loaderWidget(context))),
        ],
      )),
    );
  }
}

class ProductDetails extends ConsumerWidget {
  const ProductDetails(this.itemId);

  final int? itemId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var singleProduct = ref.watch(asyncTodosProvider);
    ref.watch(asyncTodosProvider.notifier).getSingleProduct(itemId ?? 1);
    return Scaffold(
      backgroundColor: Colors.white,
      body: singleProduct.when(
          data: (value) => Column(
                children: [
                  Stack(
                    children: [
                      // CarouselSlider(
                      //   options: CarouselOptions(
                      //       height: MediaQuery.of(context).size.height / 2,
                      //       viewportFraction: 1),
                      //   items: value.products![itemId ?? 0].images!.map((i) {
                      //     return Builder(
                      //       builder: (BuildContext context) {
                      //         return Container(
                      //           width: MediaQuery.of(context).size.width,
                      //           decoration: const BoxDecoration(
                      //               color: Colors.transparent),
                      //           child: loadImage(i ?? "",i.bl),
                      //         );
                      //       },
                      //     );
                      //   }).toList(),
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: MediaQuery.of(context).padding.top + 10,
                            horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Colors.purpleAccent.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.deepPurple)),
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  Icons.arrow_back_ios_new,
                                  color: Colors.deepPurple,
                                  size: 15,
                                ),
                              ),
                            ),
                            Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: Colors.purpleAccent.withOpacity(0.1),
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(color: Colors.deepPurple)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    onPressed: () => Navigator.pop(context),
                                    icon: const Icon(
                                      Icons.favorite_border_outlined,
                                      color: Colors.deepPurple,
                                      size: 15,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              value.products![itemId ?? 0].title ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.start,
                            )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              value.products![itemId ?? 0].description ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.start,
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "\$${value.products![itemId ?? 0].price}" ?? '',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                              textAlign: TextAlign.start,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${value.products![itemId ?? 0].discountPercentage}% off",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.deepPurple),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Icon(Icons.person),
                  //     Text((value.products![itemId ?? 0].rating ?? 0)
                  //         .toString()),
                  //     RatingBarIndicator(
                  //         rating: value.products![itemId ?? 0].rating ?? 0.0,
                  //         itemCount: 5,
                  //         itemSize: 15.0,
                  //         itemBuilder: (context, _) => const Icon(
                  //               Icons.star,
                  //               color: Colors.red,
                  //             )),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
          error: (_, l) => Container(),
          loading: () => const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )),
    );
  }
}
