import 'package:book_store/common/ratin_star.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VericalList extends StatefulWidget {
  VericalList(
      {Key? key,
      required this.cover,
      required this.name,
      required this.auther,
      required this.rate,
      required this.rateSize,
      required this.price})
      : super(key: key);
  final String cover;
  final String name;
  final String auther;
  final double rate;
  final double price;
  final double rateSize;

  @override
  State<VericalList> createState() => _VericalListState();
}

class _VericalListState extends State<VericalList> {
  @override
  Widget build(BuildContext context) {
    bool savestat = false;
    return Container(
      height: 150,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 246, 239, 239),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 135,
            width: 95,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.cover,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.cairo(
                    fontSize: 19, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.auther,
                style: GoogleFonts.cairo(
                    fontSize: 15, fontWeight: FontWeight.w200),
              ),
              const SizedBox(
                height: 5,
              ),
              RatingStarsWidget(rate: widget.rate, size: widget.rateSize),
              const SizedBox(
                height: 5,
              ),
              Text(
                '${widget.price.toString()}\$',
                style: GoogleFonts.cairo(
                    fontSize: 15, fontWeight: FontWeight.w400),
              )
            ],
          ),
          Spacer(),
          Container(
              child: IconButton(
                  iconSize: 30,
                  color: Color(0xffE9C46A),
                  onPressed: () {
                    savestat = !savestat;
                  },
                  icon: savestat
                      ? const Icon(Icons.bookmark)
                      : const Icon(Icons.bookmark_outline)))
        ],
      ),
    );
  }
}
