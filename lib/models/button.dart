import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final String backgroundcolor;
  final String textcolor;

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.backgroundcolor, // example: "0xFF4CAF50"
    required this.textcolor, // example: "0xFFFFFFFF"
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
        margin: const EdgeInsets.symmetric(horizontal:1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(int.parse(backgroundcolor)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                color: Color(int.parse(textcolor)),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
