import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendEmail({
  required String firstName,
  required String lastName,
  required String phone,
  required String subject,
  required String email,
  required String message,
}) async {
  const serviceId = 'service_wups2yp'; // خليه زي ما موجود عندك في EmailJS
  const templateId = 'template_bakeftj'; // خليه زي ما موجود عندك في EmailJS
  const userId = 'YigsJvqVK9Esn05Qt'; // Public Key موجودة في حسابك EmailJS

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

  final Map<String, dynamic> templateParams = {
    'first_name': firstName,
    'last_name': lastName,
    'phone': phone,
    'subject': subject,
    'email': email,
    'message': message,
  };

  final Map<String, dynamic> body = {
    'service_id': serviceId,
    'template_id': templateId,
    'user_id': userId,
    'template_params': templateParams,
  };

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json',
    },
    body: json.encode(body),
  );

  if (response.statusCode == 200) {
    print('Email sent successfully!');
  } else {
    print('Failed to send email. Status: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Exception('Failed to send email');
  }
}
