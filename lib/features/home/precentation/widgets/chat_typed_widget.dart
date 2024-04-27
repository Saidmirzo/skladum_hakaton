import 'package:flutter/material.dart';
import 'package:skladum/common/app_color.dart';

class ChatTypedWidget extends StatefulWidget {
  const ChatTypedWidget(
      {super.key,
      required this.onSendMessage,
      required this.onSendVoice,
      required this.onChanged,
      required this.focusNode,
      required this.controller});

  final Function(String message) onSendMessage;
  final Function(String message) onChanged;
  final Function(String message) onSendVoice;
  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  State<ChatTypedWidget> createState() => _ChatTypedWidgetState();
}

class _ChatTypedWidgetState extends State<ChatTypedWidget>
    with SingleTickerProviderStateMixin {
  final dataKey = GlobalKey();
  bool emojiShowing = false;

  final TextEditingController messageCon = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(() {
      if (widget.focusNode.hasFocus) {
        setState(() {
          emojiShowing = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: const BoxConstraints(minHeight: 50),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: AppColors.white,
        border:
            Border(top: BorderSide(color: AppColors.colorC9.withOpacity(0.3))),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Flexible(
            child: TextField(
              decoration:
                  const InputDecoration(hintText: 'Введите сообшение  . . .'),
              controller: widget.controller,
            ),
          ),
          const SizedBox(width: 10),
          Icon(
            Icons.send,
            color: AppColors.background,
          )
        ],
      ),
    );
  }
}
