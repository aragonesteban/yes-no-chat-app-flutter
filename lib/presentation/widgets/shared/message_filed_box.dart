import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onSendValue;

  const MessageFieldBox({super.key, required this.onSendValue});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    final focusNode = FocusNode();

    final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: colors.primary),
        borderRadius: BorderRadius.circular(40));

    return Container(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        focusNode: focusNode,
        controller: textController,
        decoration: InputDecoration(
            hintText: 'End your message with a "?"',
            enabledBorder: outlineInputBorder,
            focusedBorder: outlineInputBorder,
            filled: true,
            suffixIcon: IconButton(
              icon: const Icon(Icons.send_outlined),
              onPressed: () {
                onSendValue(textController.value.text);
                textController.clear();
              },
            )),
        onFieldSubmitted: (value) {
          onSendValue(value);
          textController.clear();
          focusNode.requestFocus();
        },
        onChanged: (value) {},
      ),
    );
  }
}
