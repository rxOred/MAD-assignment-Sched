import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageHeadingWidget extends StatelessWidget {
  final String text;

  const PageHeadingWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      // group2Zmy (4:28)
      padding: const EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 10.0),
      child: SizedBox(
        width: 179,
        height: 107,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // schedozw (4:7)
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 12),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                  height: 1.25,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
