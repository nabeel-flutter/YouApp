import 'package:animated_text_kit/animated_text_kit.dart';
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

class MessageComponent extends StatelessWidget {
  const MessageComponent({
    super.key,
    required this.message,
    required this.w,
    required this.index,
    required this.onTapSpeaker,
  });

  final dynamic message;
  final double w;
  final int index;
  final VoidCallback onTapSpeaker;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
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
                      bottomRight:
                          Radius.circular(message['isUserMessage'] ? 0 : 20),
                      topLeft:
                          Radius.circular(message['isUserMessage'] ? 20 : 0),
                    ),
                    color: message['isUserMessage']
                        ? const Color(0xff80BCBD)
                        : const Color(0xff80BCBD).withOpacity(0.8),
                  ),
                  constraints: BoxConstraints(maxWidth: w * 2 / 3),
                  child: message['isUserMessage']
                      ? Text(message['message'].text.text[0])
                      : AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              message['message'].text.text[0],
                              speed: const Duration(milliseconds: 5),
                            ),
                          ],
                          totalRepeatCount: 1,
                        )),
            ],
          ),
          message['isUserMessage']
              ? Container()
              : InkWell(
                  onTap: onTapSpeaker,
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
