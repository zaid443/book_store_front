import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'filter_list.dart';

class FilterContainer extends StatefulWidget {
  FilterContainer(
      {Key? key,
      required this.label,
      required this.onpress,
      required this.ispressed})
      : super(key: key);
  final String label;
  Function() onpress;
  bool ispressed;
  @override
  State<FilterContainer> createState() => _FilterContainerState();
}

class _FilterContainerState extends State<FilterContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onpress(),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: widget.ispressed ? const Color(0xff073b4c) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
                width: 2,
                color: widget.ispressed
                    ? Colors.transparent
                    : const Color(0xff073b4c))),
        child: Center(
          child: Text(widget.label,
              style: GoogleFonts.cairo(
                  color:
                      widget.ispressed ? Colors.white : const Color(0xff073b4c),
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ),
      ),
    );
  }
}

// filter card

class FilterCard extends StatelessWidget {
  FilterCard({
    Key? key,
    required this.index,
    required this.filter,
  }) : super(key: key);
  final int index;
  bool filter = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                filter ? DefaultGenres[index].genre : DefaultAuths[index].auth,
                style: GoogleFonts.cairo(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 8),
                  height: 150,
                  width: 100,
                  child: Image.network(
                    filter ? DefaultGenres[index].url : DefaultAuths[index].url,
                    fit: BoxFit.fill,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
