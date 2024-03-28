import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:new_beginnings/src/app/app_export.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  final FlutterTts flutterTts;
  final ScrollController messagesScrollController;
  const MessagesScreen(
      {Key? key,
      required this.messages,
      required this.messagesScrollController,
      required this.flutterTts})
      : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    super.initState();
    _initializeTts();
  }

  void _initializeTts() {
    widget.flutterTts.setStartHandler(() {});
    widget.flutterTts.setCompletionHandler(() {});
    widget.flutterTts.setErrorHandler((msg) {});
  }

  @override
  void dispose() {
    widget.flutterTts.stop();
    super.dispose();
  }

  Future<void> _speak(String text) async {
    if (text.isNotEmpty) {
      await widget.flutterTts.stop();

      await widget.flutterTts.speak(text);
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
                    bottomLeft: const Radius.circular(25.69),
                    topRight: const Radius.circular(25.69),
                    bottomRight: Radius.circular(
                        widget.message['isUserMessage'] ? 0 : 25.69),
                    topLeft: Radius.circular(
                        widget.message['isUserMessage'] ? 25.69 : 0),
                  ),
                  color: widget.message['isUserMessage']
                      ? ColorConstants.primaryColor
                      : Color(0xffF2F4F5),
                ),
                constraints: BoxConstraints(maxWidth: widget.w * 2 / 3),
                child: Text(widget.message['message'].text.text[0],
                    style: widget.message['isUserMessage']
                        ? TextStyle(color: Colors.white, fontSize: 16)
                        : TextStyle(color: Color(0xff303437), fontSize: 16)),
              )
            ],
          ),
          SizedBox(
            width: 10,
          ),
          widget.message['isUserMessage']
              ? Container()
              : InkWell(
                  onTap: widget.onTapSpeaker,
                  child: SvgPicture.asset(
                    "assets/images/volume-high.svg",
                  ))
        ],
      ),
    );
  }
}
