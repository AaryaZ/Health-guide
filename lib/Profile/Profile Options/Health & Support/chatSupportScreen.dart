import 'package:flutter/material.dart';

class ChatSupportScreen extends StatefulWidget {
  @override
  _ChatSupportScreenState createState() => _ChatSupportScreenState();
}

class _ChatSupportScreenState extends State<ChatSupportScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [
    {'message': 'Welcome to Health Guide\'s Chat support! How can I help you?', 'type': 'received'},
    {'message': 'Hello, Can you tell me about the Latest updates on the app.', 'type': 'sent'},
  ];

  void _sendMessage(String message) {
    if (message.trim().isEmpty) return;
    setState(() {
      _messages.add({'message': message, 'type': 'sent'});
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat Support',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(255, 9, 19, 157),
      ),
      body: Column(
        children: [
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isSent = message['type'] == 'sent';
                return Align(
                  alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 14.0),
                    margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                    decoration: BoxDecoration(
                      color: isSent ? Color.fromARGB(255, 9, 19, 157) : Colors.grey[300],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: isSent ? Radius.circular(12) : Radius.circular(0),
                        bottomRight: isSent ? Radius.circular(0) : Radius.circular(12),
                      ),
                    ),
                    child: Text(
                      message['message']!,
                      style: TextStyle(color: isSent ? Colors.white : Colors.black),
                    ),
                  ),
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
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your concern',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _sendMessage(_controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

