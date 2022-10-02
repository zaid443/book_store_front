import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({Key? key, required this.label, required this.onPress, required this.isActive})
      : super(key: key);
  final String label;
  final Function() onPress;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPress(),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: isActive ? const Color(0xff073b4c) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2, color: isActive ? Colors.transparent : const Color(0xff073b4c))),
        child: Center(
          child: Text(
            label,
            style: GoogleFonts.cairo(
              color: isActive ? Colors.white : const Color(0xff073b4c),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}

// filter card

class FilterCard extends StatelessWidget {
  const FilterCard({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final String imageUrl;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.cairo(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              Expanded(
                child: Image.network(
                  imageUrl,
                  width: 120,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
