import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoWidget extends StatelessWidget {
  final String subText;
  const LogoWidget({required this.subText, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          // group2Zmy (4:28)
          padding: const EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 10.0),
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
                    'Sched',
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.w400,
                      height: 1.25,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Container(
                  // signintoschedulePFD (4:30)
                  margin: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                  child: Text(
                    subText,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.25,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
