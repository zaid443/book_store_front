import 'package:book_store/common/default_book.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../common/book.dart';
import '../home/book_details_screen.dart';
import 'default_search_page.dart';
import 'search_result_card.dart';
import 'filter_list.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Book> bookOnSearch = [];
  TextEditingController searchController = TextEditingController();
  bool firstBox = true;
  bool secondBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                height: 56,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        size: 30,
                        color: Color.fromARGB(120, 0, 0, 0),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              bookOnSearch= defaultBookList
                                  .where((element) => element.auther
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                                  .toList();
                              bookOnSearch.isNotEmpty? null :bookOnSearch= defaultBookList
                                  .where((element) => element.name
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                                  .toList();
                            });
                          },
                          controller: searchController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search Book name, Auther name'),
                        ),
                      ),
                      // Spacer(),
                      Container(
                        child: searchController.text.isEmpty
                            ? null
                            : IconButton(
                                onPressed: () {
                                  searchController.clear();
                                },
                                icon: const Icon(
                                  Icons.close,
                                  color: Color.fromARGB(141, 7, 59, 76),
                                )),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: searchController.text.isNotEmpty && bookOnSearch.isNotEmpty
                  ? ListView.builder(
                    itemCount:bookOnSearch.length ,
                    itemBuilder: (context, index) {
                    
                      return SearchCard(
                        cover: bookOnSearch[index].cover,
                        name: bookOnSearch[index].name,
                        auther: bookOnSearch[index].auther,
                        rate: bookOnSearch[index].rate,
                        rateSize: 15,
                        price: bookOnSearch[index].price,
                        item: bookOnSearch[index],
                        onPressed: (Book book) {
                          Get.to(() => BookDetailsScreen(book: book));
                        },
                      );
                    })
                  : Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 5,
                                child: FilterContainer(
                                  label: 'Genres',
                                  ispressed: firstBox,
                                  onpress: () {
                                    setState(() {
                                      if (firstBox == false) {
                                        firstBox = !firstBox;
                                        secondBox = !secondBox;
                                      } else {
                                        return null;
                                      }
                                    });
                                  },
                                )),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              flex: 5,
                              child: FilterContainer(
                                label: 'Authers',
                                ispressed: secondBox,
                                onpress: () {
                                  setState(() {
                                    if (secondBox == false) {
                                      firstBox = !firstBox;
                                      secondBox = !secondBox;
                                    } else {
                                      return null;
                                    }
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: firstBox
                                  ? DefaultGenres.length
                                  : DefaultAuths.length,
                              gridDelegate:
                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 200,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 0.8),
                              itemBuilder: (context, index) {
                                return FilterCard(
                                  filter: firstBox,
                                  index: index,
                                );
                              }),
                        ),
                      ],
                    ),
            )
          ],
        ),
      ),
    );
  }
}
