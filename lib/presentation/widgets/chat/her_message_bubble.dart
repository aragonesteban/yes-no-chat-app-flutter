import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/models/message.dart';

class HerMessageBubble extends StatelessWidget {
  final Message message;

  const HerMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.tertiary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        if (message.imageUrl != null) _ImageBubble(imageUrl: message.imageUrl),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  final String? imageUrl;

  const _ImageBubble({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl.toString(),
        fit: BoxFit.cover,
        width: size.width * 0.7,
        height: 150,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: size.width * 0.7,
              height: 150,
              child: const Center(child: CircularProgressIndicator()));
        },
      ),
    );
  }
}
