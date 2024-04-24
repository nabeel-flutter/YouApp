import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:your_app_test/src/app/app_export.dart';
import 'package:your_app_test/src/pages/chatbot/message_screen.dart';
import 'package:your_app_test/src/pages/chatbot/widgets.dart/chat_input_component.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  final ScrollController messagesScrollController = ScrollController();

  List<Map<String, dynamic>> messages = [];
  List<Map<String, String>> faq = [
    {'question': 'What services do you offer?', 'answer': 'We offer...'},
    {'question': 'How can I schedule an appointment?', 'answer': 'You can...'},
    {'question': 'How can I update my profile?', 'answer': 'You can...'},
    {'question': 'How can I change my payment mode?', 'answer': 'You can...'},
  ];

  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState(); // Make sure to call super.initState()
    messages.add({
      'isUserMessage': false,
      'message': Message(
          text: DialogText(text: const [
        """Hello, I’m NB Chatbot! 👋 I’m your personal support assistant. How can I help you?"""
      ]))
    });
    dialogFlowtter =
        DialogFlowtter(jsonPath: "assets/credentials/dialog_flow_auth.json");
  }


  @override
  Widget build(BuildContext context) {
    return PrimaryBackground(
      appbarText: "NB Chatbot",
      isBackAppBar: true,
      isAppBar: true,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: MessagesScreen(
            flutterTts: flutterTts,
            messages: messages,
            messagesScrollController: messagesScrollController,
          )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Frequently Asked Questions',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 50, // Adjust the height as necessary
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: faq.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // Handle the tap action
                          sendMessage(faq[index]['question']!);
                          FocusScope.of(context).unfocus();

                          messagesScrollController.animateTo(
                            messagesScrollController.position.maxScrollExtent +
                                100,
                            curve: Curves.easeOut,
                            duration: const Duration(milliseconds: 300),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 2), // Spacing between items
                          decoration: BoxDecoration(
                            color: const Color(0XffF2F4F5),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Text(
                              faq[index]['question']!,
                              style: const TextStyle(
                                  color: Color(0xff023E3F),
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          ChatBotInputFeild(
            controller: _controller,
            onPressed: () {
              sendMessage(_controller.text);
              _controller.clear();
              FocusScope.of(context).unfocus();
            },
          )
        ],
      ),
    );
  }

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) {
      return;
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
    messagesScrollController.animateTo(
      messagesScrollController.position.maxScrollExtent + 1000,
      curve: Curves.easeOut,
      duration: const Duration(seconds: 1),
    );
  }

  void addMessage(Message message, [bool isUserMessage = false]) {
    messages.add({'message': message, 'isUserMessage': isUserMessage});
  }
}
