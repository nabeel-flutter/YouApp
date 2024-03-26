import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

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
    flutterTts.setStartHandler(() {
      print("Playing");
    });
    flutterTts.setCompletionHandler(() {
      print("Complete");
    });
    flutterTts.setErrorHandler((msg) {
      print("error: $msg");
    });
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
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: widget.messages[index]['isUserMessage']
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(
                        widget.messages[index]['isUserMessage'] ? 0 : 20),
                    topLeft: Radius.circular(
                        widget.messages[index]['isUserMessage'] ? 20 : 0),
                  ),
                  color: widget.messages[index]['isUserMessage']
                      ? Color(0xff80BCBD)
                      : Color(0xff80BCBD).withOpacity(0.8),
                ),
                constraints: BoxConstraints(maxWidth: w * 2 / 3),
                child: Text(widget.messages[index]['message'].text.text[0]),
              ),
              InkWell(
                child: Icon(
                  Icons.volume_up_rounded,
                  color: Color(0xff80BCBD),
                ),
                onTap: () async {
                  _speak(widget.messages[index]['message'].text.text[0]);
                },
              )
            ],
          ),
        );
      },
      separatorBuilder: (_, i) => Padding(padding: EdgeInsets.only(top: 10)),
      itemCount: widget.messages.length,
    );
  }
}
