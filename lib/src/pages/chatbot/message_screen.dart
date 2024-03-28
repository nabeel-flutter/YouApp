import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  final ScrollController messagesScrollController;
  const MessagesScreen(
      {Key? key,
      required this.messages,
      required this.messagesScrollController})
      : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _initializeTts();
  }

  void _initializeTts() {
    flutterTts.setStartHandler(() {});
    flutterTts.setCompletionHandler(() {});
    flutterTts.setErrorHandler((msg) {});
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  Future<void> _speak(String text) async {
    if (text.isNotEmpty) {
      await flutterTts.stop();

      await flutterTts.speak(text);
    }
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
      controller: widget.messagesScrollController,
      itemBuilder: (context, index) {
        return MessageComponent(
            controller: widget.messagesScrollController,
            message: widget.messages[index],
            w: w,
            index: index,
            onTapSpeaker: () {
              _speak(widget.messages[index]['message'].text.text[0]);
            });
      },
      separatorBuilder: (_, i) =>
          const Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length,
    );
  }
}

class MessageComponent extends StatefulWidget {
  const MessageComponent({
    super.key,
    required this.message,
    required this.w,
    required this.index,
    required this.onTapSpeaker,
    required this.controller,
  });
  final ScrollController controller;

  final dynamic message;
  final double w;
  final int index;
  final VoidCallback onTapSpeaker;

  @override
  State<MessageComponent> createState() => _MessageComponentState();
}

class _MessageComponentState extends State<MessageComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
      child: Row(
        mainAxisAlignment: widget.message['isUserMessage']
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.message['isUserMessage']
                  ? Container()
                  : CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 25,
                      child: Image.asset("assets/images/robot.png"),
                    ),
              const SizedBox(
                width: 8,
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                      bottomRight: Radius.circular(
                          widget.message['isUserMessage'] ? 0 : 20),
                      topLeft: Radius.circular(
                          widget.message['isUserMessage'] ? 20 : 0),
                    ),
                    color: widget.message['isUserMessage']
                        ? const Color(0xff80BCBD)
                        : const Color(0xff80BCBD).withOpacity(0.8),
                  ),
                  constraints: BoxConstraints(maxWidth: w * 2 / 3),
                  child: Text(widget.message['message'].text.text[0])),
            ],
          ),
          widget.message['isUserMessage']
              ? Container()
              : InkWell(
                  onTap: widget.onTapSpeaker,
                  child: const Icon(
                    Icons.volume_up_rounded,
                    color: Color(0xff80BCBD),
                  ),
                )
        ],
      ),
    );
  }
}
