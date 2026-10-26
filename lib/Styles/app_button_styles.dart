import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppButtonStyles {
  // Filled button (Login)
  static ButtonStyle filledButton = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: AppColors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  );

  // Outlined button (Register)
  static ButtonStyle outlinedButton = OutlinedButton.styleFrom(
    side: const BorderSide(color: AppColors.primary, width: 2),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
  );
}
