import 'package:flutter/material.dart';

import 'styles/app_button_styles.dart';

import 'Styles/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Logo
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                height: 120,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 2),
            const Text(
              'PMDD',
              style: TextStyle(
                fontSize: 72,
                fontWeight: FontWeight.bold,
                color: AppColors.title,
                fontFamily: 'Times New Roman', // or another serif font
                height: 0.9,
              ),
            ),
            const SizedBox(height: 6),

            const Text(
              'Support for your mind,\nbody and cycle.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.text,
                height: 1.2,
                fontWeight: FontWeight.w500,
              ),
            ),

            // Portrait
            Expanded(
              child: Image.asset(
                'assets/images/woman.png',
                fit: BoxFit.contain,
              ),
            ),

            // Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: AppButtonStyles.filledButton,
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 20, color: AppColors.white),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Register Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                height: 60,
                child: OutlinedButton(
                  onPressed: () {},
                  style: AppButtonStyles.outlinedButton,
                  child: const Text(
                    "Register",
                    style: TextStyle(fontSize: 20, color: Color(0xFF7C556D)),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
