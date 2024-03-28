import 'package:flutter/material.dart';
import 'package:new_beginnings/src/app/app_export.dart';

class ChatBotInputFeild extends StatelessWidget {
  const ChatBotInputFeild({
    super.key,
    required TextEditingController controller,
    required this.onPressed,
  }) : _controller = controller;

  final TextEditingController _controller;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight * 2,
      decoration: BoxDecoration(color: Color(0xff0A7E80)),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: lighten(getThemeColor(context), 1)),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      height: 55,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: TextField(
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                      color: Color(0xff023E3F),
                                      fontSize: 16,
                                      fontFamily: FontConstants.gilroyMedium),
                              controller: _controller,
                              decoration: InputDecoration(
                                  hintText: "Message..",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                          color: Color(0xff023E3F),
                                          fontSize: 16,
                                          fontFamily:
                                              FontConstants.gilroyMedium),
                                  border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () {
                              onPressed();
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff023E3F),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  AssetsConstants.sendMsgIcon,
                                  height: 13,
                                  width: 13,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
