
import 'package:flutter/material.dart';
import '../services/openai_service.dart';

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final TextEditingController _controller = TextEditingController();
  String? _analysisResult;
  bool _loading = false;

  void _analyzeDream() async {
    setState(() => _loading = true);
    final result = await OpenAIService().analyzeDream(_controller.text);
    setState(() {
      _analysisResult = result;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dream Journal')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Write your dream here...',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _loading ? null : _analyzeDream,
              child: _loading ? CircularProgressIndicator() : Text('Analyze Dream'),
            ),
            SizedBox(height: 20),
            if (_analysisResult != null) Expanded(child: SingleChildScrollView(child: Text(_analysisResult!))),
          ],
        ),
      ),
    );
  }
}
