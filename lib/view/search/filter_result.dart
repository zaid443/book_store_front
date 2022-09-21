import 'package:book_store/common/vertical_card_list.dart';
import 'package:book_store/controllers/filter_result_controller.dart';
import 'package:book_store/utils/theme.dart';
import 'package:book_store/view/home/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterResultScreen extends StatelessWidget {
  FilterResultScreen({super.key});
  final FilterResultController controller = Get.put(FilterResultController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        elevation: 0,
        title: Text(controller.title),
      ),
      body: GetBuilder<FilterResultController>(builder: (_) {
        return controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(color: AppTheme.mainColor),
              )
            : controller.books?.isEmpty == true
                ? const Center(
                    child: Text("No books"),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: controller.books?.length ?? 0,
                    itemBuilder: (_, index) {
                      return BookCardExtended(
                        item: controller.books![index],
                        onPressed: (book) {
                          Get.to(() => BookDetailsScreen(), arguments: book);
                        },
                      );
                    },
                  );
      }),
    );
  }
}
