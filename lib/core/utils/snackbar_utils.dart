import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SnackbarUtils {
  static void show(
    BuildContext context,
    String message, {
    bool isError = true,
  }) {
    String displayMessage = message;
    if (message.contains("ClientException") ||
        message.contains("SocketException") ||
        message.contains("host lookup") ||
        message.contains("Network error") ||
        message.contains("Connection refused")) {
      displayMessage = "Server Error. Please try again later.";
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError ? Icons.error_outline : Icons.check_circle_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                displayMessage,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: isError ? AppColors.error : AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        elevation: 4,
      ),
    );
  }
}
