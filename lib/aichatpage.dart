import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController _inputController;
  late ScrollController _scrollController;
  late List<String> _messages;

  @override
  void initState() {
    super.initState();
    _inputController = TextEditingController();
    _scrollController = ScrollController();
    _messages = [];
  }

  @override
  void dispose() {
    _inputController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Future<String> getChatGPTResponse(String prompt) async {
    // Replace 'YOUR_API_KEY' with your actual OpenAI API key
    final apiKey = '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';
    final endpoint =
        'https://api.openai.com/v1/completions';

    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    final data = {
      'prompt': prompt,
      'max_tokens': 250,
      'model':'text-davinci-003',
      'top_p': 1,
      'temperature':0,
    };

    final response = await http.post(
      Uri.parse(endpoint),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final textResponse = responseData['choices'][0]['text'];
      print('API Response: $textResponse');
      return textResponse;
    } else {
      throw Exception('Failed to fetch response from ChatGPT');
    }
  }

  Future<void> _submitPrompt() async {
    final prompt = _inputController.text.trim();

    if (prompt.isNotEmpty) {
      try {
        final response = await getChatGPTResponse(prompt);
        setState(() {
          _messages.add(prompt);
          _messages.add(response);
          _inputController.clear();
        });
        _scrollToBottom();
      } catch (e) {
        print('Error: $e');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content:
              const Text('Failed to get a response. Please try again.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatGPT'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    controller: _inputController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: 'Type your message',
                      hintStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'SFProRegular',
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: _submitPrompt,
                  child: const Text(
                    'Send',
                    style: TextStyle(fontFamily: 'SFProRegular', fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ChatPage(),
  ));
}
