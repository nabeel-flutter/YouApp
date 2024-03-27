import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/material.dart';
import 'package:new_beginnings/src/app/app_export.dart';
import 'package:new_beginnings/src/pages/chatbot/message_screen.dart';

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

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState(); // Make sure to call super.initState()
    dialogFlowtter =
        DialogFlowtter(jsonPath: "assets/credentials/dialog_flow_auth.json");

    // addMessage(Message(
    //     text: DialogText(text: const [
    //   "Hello! I am NB Chatbot. How can I help you today?"
    // ])));
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    dynamic message = {
      'isUserMessage': false,
      'message':
          """Hello and welcome to New Beginnings! I'm here to guide you through scheduling your health appointments. Just let me know if you want to book, change, or review your appointments, and I’ll take care of the rest. How can I assist you today?"""
    };
    return PrimaryBackground(
      appbarText: "NB Chatbot",
      isBackAppBar: true,
      isAppBar: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 50),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: ColorConstants.primaryColor,
                  )),
              const Text(
                "NB Chatbot",
                style: TextStyle(
                    color: ColorConstants.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
            ],
          ),
          if (_isExpanded == false)
            messages.isEmpty
                ? Container(
                    margin: const EdgeInsets.only(
                        top: 10, bottom: 10, left: 5, right: 5),
                    child: Row(
                      mainAxisAlignment: message['isUserMessage']
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            message['isUserMessage']
                                ? Container()
                                : CircleAvatar(
                                    backgroundColor: Colors.transparent,
                                    radius: 25,
                                    child:
                                        Image.asset("assets/images/robot.png"),
                                  ),
                            const SizedBox(
                              width: 8,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 14, horizontal: 14),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: const Radius.circular(20),
                                  topRight: const Radius.circular(20),
                                  bottomRight: Radius.circular(
                                      message['isUserMessage'] ? 0 : 20),
                                  topLeft: Radius.circular(
                                      message['isUserMessage'] ? 20 : 0),
                                ),
                                color: message['isUserMessage']
                                    ? const Color(0xff80BCBD)
                                    : const Color(0xff80BCBD).withOpacity(0.8),
                              ),
                              constraints: BoxConstraints(maxWidth: w * 2 / 3),
                              child: Text(message['message']),
                            )
                          ],
                        ),
                        message['isUserMessage']
                            ? Container()
                            : const InkWell(
                                child: Icon(
                                  Icons.volume_up_rounded,
                                  color: Color(0xff80BCBD),
                                ),
                                // onTap: onTapSpeaker,
                              )
                      ],
                    ),
                  )
                : const SizedBox(
                    height: 20,
                  ),
          ExpansionPanelList(
            expandedHeaderPadding: const EdgeInsets.all(0),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            elevation: 0,
            children: [
              ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return const ListTile(
                    title: Text('FAQs'),
                  );
                },
                backgroundColor: Colors.transparent,
                canTapOnHeader: true,
                isExpanded: _isExpanded,
                body: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: faq
                        .map((e) => InkWell(
                              child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: ColorConstants.primaryColor)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(e['question']!),
                                  )),
                              onTap: () {
                                sendMessage(e['question']!);
                                FocusScope.of(context).unfocus();

                                setState(() {
                                  _isExpanded = false;
                                });
                                messagesScrollController.animateTo(
                                  messagesScrollController
                                          .position.maxScrollExtent +
                                      100,
                                  curve: Curves.easeOut,
                                  duration: const Duration(milliseconds: 300),
                                );
                              },
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
          Expanded(
              child: MessagesScreen(
            messages: messages,
            messagesScrollController: messagesScrollController,
          )),
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
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        hintText: 'Type a message...',
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
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
                    icon: Image.asset(
                      "assets/images/Vector.png",
                      width: 25,
                      height: 25,
                      color: Colors.white,
                    ))
              ],
            ),
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
