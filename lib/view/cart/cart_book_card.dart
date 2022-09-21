import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:get/get.dart';
import '../../common/book_model.dart';

class CartBookCard extends StatelessWidget {
  const CartBookCard({
    Key? key,
    required this.item,
    required this.onPressed,
    required this.onRemove,
  }) : super(key: key);

  final BookModel item;
  final Function(BookModel book) onPressed;
  final Function(BookModel book) onRemove;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(item),
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 135,
              width: 95,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.bookImageUrl,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    item.author,
                    style: GoogleFonts.cairo(fontSize: 15, fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('${item.qty} Pcs'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${item.price.toString()}\$',
                    style: GoogleFonts.cairo(fontSize: 15, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            IconButton(
              iconSize: 30,
              color: const Color(0xff931621),
              onPressed: () {
                PanaraConfirmDialog.showAnimatedGrow(
                  context,
                  title: "Remove from Cart",
                  message: "Do you want to remove this Book?",
                  confirmButtonText: "Remove",
                  cancelButtonText: "Cancel",
                  onTapCancel: () {
                    Get.back();
                  },
                  onTapConfirm: () => onRemove(item),
                  color: const Color(0xff931621),
                  panaraDialogType: PanaraDialogType.custom,
                );
              },
              icon: const Icon(Icons.do_disturb_on_outlined),
            )
          ],
        ),
      ),
    );
  }
}
