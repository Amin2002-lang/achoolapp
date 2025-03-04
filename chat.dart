import 'package:flutter/material.dart';

class AssistancePage extends StatefulWidget {
  @override
  _AssistancePageState createState() => _AssistancePageState();
}

class _AssistancePageState extends State<AssistancePage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[index];
                    return ListTile(
                      title: Align(
                        alignment: message['isUserMessage']
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          decoration: BoxDecoration(
                            color: message['isUserMessage']
                                ? Colors.blue
                                : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            message['text'],
                            style: TextStyle(
                              color: message['isUserMessage']
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Posez une question...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.send), // Icône d'envoi
                            onPressed: _sendMessage,
                          ),
                          prefixIcon: IconButton(
                            icon: Icon(Icons.push_pin), // Icône d'épingle
                            onPressed: _pinMessage,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 16,
            right: 16,
            child: Image.asset(
              'assets/images/lo.png', // Chemin du logo
              width: 50, // Ajustez la largeur du logo
              height: 50, // Ajustez la hauteur du logo
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final text = _controller.text;
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'text': text, 'isUserMessage': true});
      _controller.clear();
    });

    // Simuler une réponse du chatbot
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _messages.add({
          'text': 'Je suis un chatbot ! Comment puis-je vous aider ?',
          'isUserMessage': false
        });
      });
    });
  }

  void _pinMessage() {
    // Ajouter la logique pour épingler un message si nécessaire
    // Par exemple, afficher un message ou mettre à jour un état
    print('Message épinglé');
  }
}
