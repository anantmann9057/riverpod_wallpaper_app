import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:river_pod/main.dart';
import 'package:river_pod/service/photo_service/photo_service.dart';
import 'package:river_pod/service/product_swrvice/product_service.dart';
import 'package:river_pod/service/search_service/search_model.dart';
import 'package:river_pod/service/search_service/search_provider.dart';
import 'package:river_pod/widgets.dart';
import 'package:sliding_up_panel2/sliding_up_panel2.dart';

var searchControllerProvider = StateProvider((ref) => PanelController());
var selectedSearchItemId = StateProvider((ref) => 0);

PagingController<int, Result> searchPagingController =
    PagingController(firstPageKey: 1, invisibleItemsThreshold: 1);

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [

            PagedGridView<int, Result>(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top, left: 10, right: 10),
              shrinkWrap: true,
              pagingController: searchPagingController
                ..addPageRequestListener((pageKey) async {
                  try {
                    final newItems = await ref
                        .watch(searchServiceProvider(pageKey).notifier)
                        .searchPhotos(
                            query: textEditingController.text.isEmpty
                                ? 'l'
                                : textEditingController.text);
                    print(newItems);
                    final isLastPage = newItems.length < 10;
                    if (isLastPage) {
                    } else {
                      final nextPageKey = pageKey + 1;
                      searchPagingController.appendPage(newItems, nextPageKey);
                    }
                  } catch (error) {
                    print(error);
                    searchPagingController.error = error;
                  }
                }),
              builderDelegate: PagedChildBuilderDelegate(
                  newPageProgressIndicatorBuilder: (context) =>
                      singleLoadingWidget(),
                  firstPageProgressIndicatorBuilder: (context) =>
                      loaderWidget(context),
                  itemBuilder: (context, item, index) => InkWell(
                    onTap: () async {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) => Stack(
                            fit: StackFit.expand,
                            children: [
                              loadImage(
                                  item.coverPhoto?.urls?.regular ?? "",
                                  item.coverPhoto?.blurHash ?? "LJExbC%h?H={9ZR*WBt7~AK5tRni"),
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
                                                      item.title ?? '',
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
                                                        fontSize: 18,
                                                        fontWeight:
                                                        FontWeight.w700,
                                                      ),
                                                      textAlign:
                                                      TextAlign.start,
                                                    )),
                                              ],
                                            ),
                                            Row(
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
                                            ),

                                          ],
                                        ),
                                      ),
                                      SingleChildScrollView(scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: List.generate(
                                              item.tags
                                                  ?.length ??
                                                  0,
                                                  (index) =>
                                                  Container(
                                                    decoration: BoxDecoration(
                                                        color:
                                                        Colors.deepPurple,
                                                        border: Border.all(color: Colors.deepPurple),
                                                        borderRadius: BorderRadius.circular(10)),
                                                    padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                        10,
                                                        vertical:
                                                        5),
                                                    margin: EdgeInsets.only(
                                                        right:
                                                        5,
                                                        top:
                                                        5,
                                                        bottom:
                                                        5),
                                                    child:
                                                    Text(
                                                      "${item.tags?[index].title}",
                                                      maxLines:
                                                      2,
                                                      overflow:
                                                      TextOverflow.ellipsis,
                                                      style: const TextStyle(
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.white),
                                                      textAlign:
                                                      TextAlign.start,
                                                    ),
                                                  )),
                                        ),),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      CarouselSlider(
                                        options: CarouselOptions(
                                            height:
                                            MediaQuery.of(context)
                                                .size
                                                .height /
                                                4,

                                            enlargeCenterPage: false,
                                            enlargeFactor: 0.5,
                                            viewportFraction: .4),
                                        items: item.previewPhotos
                                            ?.map((i) {
                                          return Builder(
                                            builder:
                                                (BuildContext context) {
                                              return Padding(
                                                padding:
                                                EdgeInsets.all(10),
                                                child: ClipRRect(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        10),
                                                    child: Container(
                                                      width:
                                                      MediaQuery.of(
                                                          context)
                                                          .size
                                                          .width,
                                                      height:
                                                      MediaQuery.of(
                                                          context)
                                                          .size
                                                          .height,
                                                      child: loadImage(
                                                          i.urls?.regular ??
                                                              '',
                                                          i.blurHash ??
                                                              "LJExbC%h?H={9ZR*WBt7~AK5tRni",
                                                          fit: BoxFit
                                                              .cover),
                                                    )),
                                              );
                                            },
                                          );
                                        }).toList(),
                                      ),
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Card(
                            surfaceTintColor: Colors.white,
                            color: Colors.white,
                            elevation: 5,
                            child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                  MediaQuery.of(context).size.height,
                                  child: loadImage(
                                      item.coverPhoto?.urls?.smallS3! ?? "",
                                      item.coverPhoto?.blurHash ?? "LJExbC%h?H={9ZR*WBt7~AK5tRni",
                                      fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: ClipOval(
                                child: loadImage(
                                    item.user?.profileImage?.small ?? '',
                                    'LJExbC%h?H={9ZR*WBt7~AK5tRni'),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Text(
                                  item.user?.social?.instagramUsername ??
                                      item.user?.social?.twitterUsername ??
                                      item.user?.name ??
                                      '',
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
                  )),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount:
                      MediaQuery.of(context).size.shortestSide < 550 ? 2 : 4),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AnimSearchBar(
                  rtl: true,
                  width: MediaQuery.of(context).size.width,
                  textController: textEditingController,
                  onSuffixTap: () async {
                    try {

                      final newItems = await ref
                          .watch(searchServiceProvider(
                          searchPagingController.firstPageKey)
                          .notifier)
                          .searchPhotos(query: textEditingController.text);
                      searchPagingController.itemList =newItems;

                    } catch (error) {
                      searchPagingController.error = error;
                    }
                  },
                  onSubmitted: (query) async {
                    textEditingController.text = query;
                    try {
                      final newItems = await ref
                          .watch(searchServiceProvider(
                          searchPagingController.firstPageKey)
                          .notifier)
                          .searchPhotos(query: textEditingController.text);
                      searchPagingController.itemList =newItems;
                    } catch (error) {
                      searchPagingController.error = error;
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
