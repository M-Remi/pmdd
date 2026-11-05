import 'package:cloud_functions/cloud_functions.dart';

class EmailService {
  static Future<void> sendWelcomeEmail({
    required String name,
    required String email,
  }) async {
    final callable = FirebaseFunctions.instance.httpsCallable(
      'sendWelcomeEmail',
    );

    final response = await callable.call({'name': name, 'email': email});

    print('FUNCTION RESPONSE:');
    print(response.data);
  }

  static Future<void> sendVerificationReminder({
    required String name,
    required String email,
  }) async {
    final callable = FirebaseFunctions.instance.httpsCallable(
      'sendVerificationReminder',
    );

    await callable.call({'name': name, 'email': email});
  }
}
