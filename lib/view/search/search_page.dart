import 'package:book_store/common/book_model.dart';
import 'package:book_store/controllers/search_controller.dart';
import 'package:book_store/services/book_service.dart';
import 'package:book_store/utils/enums.dart';
import 'package:book_store/view/home/book_details_screen.dart';
import 'package:book_store/view/search/filter_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import 'filter_widgets.dart';

class Search extends StatelessWidget {
  Search({super.key});
  final SearchController controller = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: GetBuilder<SearchController>(builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    height: 56,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TypeAheadField<BookModel>(
                        suggestionsCallback: (String pattern) async {
                          if (pattern.isNotEmpty) {
                            Response<List<BookModel>?> res = await BookService().search(pattern);
                            if (res.statusCode == 200 && res.body != null) {
                              return res.body!;
                            } else {
                              return [];
                            }
                          }
                          return [];
                        },
                        itemBuilder: (_, BookModel suggestion) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: SizedBox(
                                child: Image.network(suggestion.bookImageUrl),
                              ),
                              title: Text(suggestion.name),
                              subtitle: Text(suggestion.author),
                            ),
                          );
                        },
                        keepSuggestionsOnLoading: true,
                        onSuggestionSelected: (BookModel suggestion) {
                          Get.to(() => BookDetailsScreen(), arguments: suggestion);
                        },
                        noItemsFoundBuilder: (_) {
                          return const Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "No books found!",
                              textAlign: TextAlign.center,
                            ),
                          );
                        },
                        textFieldConfiguration: TextFieldConfiguration(
                          controller: controller.searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              Icons.search,
                              size: 30,
                              color: Color.fromARGB(120, 0, 0, 0),
                            ),
                            hintText: 'Search Book name, Author name',
                            suffixIcon: GestureDetector(
                              onTap: () => controller.searchController.clear(),
                              child: const Icon(
                                Icons.close,
                                color: Color.fromARGB(141, 7, 59, 76),
                              ),
                            ),
                          ),
                        ),
                        suggestionsBoxDecoration: const SuggestionsBoxDecoration(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 5,
                              child: FilterContainer(
                                label: 'Genres',
                                isActive: controller.genreFlag,
                                onPress: () {
                                  controller.genreFlag = true;
                                  controller.authorFlag = false;
                                  controller.update();
                                },
                              )),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            flex: 5,
                            child: FilterContainer(
                              label: 'Authors',
                              isActive: controller.authorFlag,
                              onPress: () {
                                controller.genreFlag = false;
                                controller.authorFlag = true;
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount:
                                controller.genreFlag ? controller.genres?.length ?? 0 : controller.authors?.length ?? 0,
                            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 0.8,
                            ),
                            itemBuilder: (context, index) {
                              return FilterCard(
                                title: controller.genreFlag
                                    ? controller.genres![index].name
                                    : controller.authors![index].name,
                                imageUrl: controller.genreFlag
                                    ? controller.genres![index].genresImageUrl
                                    : controller.authors![index].authorImageUrl,
                                onTap: () {
                                  Get.to(
                                    () => FilterResultScreen(),
                                    arguments: {
                                      'filterType': controller.genreFlag ? FilterType.genre : FilterType.author,
                                      'title': controller.genreFlag
                                          ? controller.genres![index].name
                                          : controller.authors![index].name,
                                    },
                                  );
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

// TextField(
//                       controller: controller.searchController,
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           prefixIcon: const Icon(
//                             Icons.search,
//                             size: 30,
//                             color: Color.fromARGB(120, 0, 0, 0),
//                           ),
//                           hintText: 'Search Book name, Author name',
//                           suffixIcon: GestureDetector(
//                             child: const Icon(
//                               Icons.close,
//                               color: Color.fromARGB(141, 7, 59, 76),
//                             ),
//                           )),
//                     )