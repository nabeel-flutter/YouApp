import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/chatbot/message_screen.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];
  List<Map<String, String>> faq = [
    {'question': 'What services do you offer?', 'answer': 'We offer...'},
    {'question': 'How can I schedule an appointment?', 'answer': 'You can...'},
    {'question': 'How can i update my profile?', 'answer': 'You can...'},

    // Add more questions and answers as needed
  ];

  @override
  void initState() {
    super.initState(); // Make sure to call super.initState()
    dialogFlowtter =
        DialogFlowtter(jsonPath: "assets/credentials/dialog_flow_auth.json");

    addMessage(Message(
        text: DialogText(text: const [
      "Hello! I am NB Chatbot. How can I help you today?"
    ])));
  }

  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      appbarText: "NB Chatbot",
      isBackAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              "Here are some frequently asked questions:",
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Column(
            children: faq
                .map((e) => ListTile(
                      title: Text(e['question']!),
                      onTap: () {
                        sendMessage(e['question']!);
                      },
                    ))
                .toList(),
          ),
          Expanded(child: MessagesScreen(messages: messages)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            color: const Color(0xff0A7E80),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    sendMessage(_controller.text);
                    _controller.clear();
                    FocusScope.of(context).unfocus();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

  addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
