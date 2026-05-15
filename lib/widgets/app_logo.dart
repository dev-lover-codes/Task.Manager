import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  final double size;
  final bool showText;

  const AppLogo({
    super.key,
    this.size = 100,
    this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: colorScheme.primary,
            borderRadius: BorderRadius.circular(size * 0.25),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Icon(
            Icons.check_rounded,
            size: size * 0.6,
            color: colorScheme.onPrimary,
          ),
        ),
        if (showText) ...[
          const SizedBox(height: 16),
          Text(
            'TaskFlow',
            style: GoogleFonts.oswald(
              fontSize: size * 0.35,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
              letterSpacing: 1.2,
            ),
          ),
          Text(
            'Manage with ease',
            style: GoogleFonts.openSans(
              fontSize: size * 0.12,
              color: colorScheme.outline,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ],
    );
  }
}
