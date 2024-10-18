import 'package:flutter/material.dart';
import 'package:music_player/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class NeuBox extends StatelessWidget {
  final Widget? child;
  const NeuBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;

    return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).colorScheme.surface,
          boxShadow: [
            //bottom right
            BoxShadow(
                color: isDarkMode ? Colors.black : Colors.grey.shade600,
                offset: const Offset(4, 4),
                // spreadRadius: 3,
                blurRadius: 3),
            // top left
            BoxShadow(
                color: isDarkMode ? Colors.grey.shade900 : Colors.white,
                offset: const Offset(-4, -4),
                blurRadius: 3)
          ],
        ),
        child: child);
  }
}
