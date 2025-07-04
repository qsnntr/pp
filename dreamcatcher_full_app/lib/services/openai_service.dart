
import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIService {
  final String apiKey = 'your-openai-api-key-here';

  Future<String> analyzeDream(String dreamText) async {
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'model': 'gpt-4',
        'messages': [
          {'role': 'system', 'content': 'You are a dream analyst.'},
          {'role': 'user', 'content': dreamText},
        ]
      }),
    );

    final json = jsonDecode(response.body);
    return json['choices'][0]['message']['content'];
  }
}
