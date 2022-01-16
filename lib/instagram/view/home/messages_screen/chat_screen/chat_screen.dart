import 'package:flutter/material.dart';
import 'package:instagram/instagram/constants.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friend No 1'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage(ImageAssets.camera))),
          IconButton(
              onPressed: () {},
              icon: ImageIcon(AssetImage(ImageAssets.camera))),
        ],
      ),
      body: Column(
        children: const [
          Expanded(
            child: ChatBody(),
          ),
          Spacer(),
          ChatEditor()
        ],
      ),
    );
  }
}

class ChatBody extends StatelessWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(color: Colors.blueGrey);
  }
}

class ChatEditor extends StatelessWidget with PreferredSizeWidget {
  const ChatEditor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(50)),
      child: ListTile(
        key: const ValueKey('messages-list'),
        leading: CircleAvatar(
          child: ImageIcon(AssetImage(ImageAssets.add)),
        ),
        title: const TextField(),
        subtitle: const Text('Latest Message'),
        trailing: ImageIcon(AssetImage(ImageAssets.send)),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
