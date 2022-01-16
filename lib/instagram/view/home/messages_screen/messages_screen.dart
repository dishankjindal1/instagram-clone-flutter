import 'package:flutter/material.dart';
import 'package:instagram/instagram/constants.dart';
import 'package:instagram/instagram/view/home/messages_screen/chat_screen/chat_screen.dart';
import 'package:instagram/instagram/view/home/messages_screen/utils/msg_app_bar.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MsgAppBar(),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const ChatScreen()));
            },
            child: ListTile(
              key: ValueKey('messages-list-$index'),
              leading: CircleAvatar(
                child: ImageIcon(AssetImage(ImageAssets.add)),
              ),
              title: messageScreenTitleText('Dishank Jindal'),
              subtitle: messageScreenSubtitleText('Latest Message'),
              trailing: ImageIcon(AssetImage(ImageAssets.camera)),
            ),
          );
        },
      ),
    );
  }
}

//
//
// Styling Section
//
//

Text messageScreenTitleText(String msg) => Text(
      msg,
      style: const TextStyle(
        fontSize: 12,
      ),
    );

Text messageScreenSubtitleText(String msg) => Text(
      msg,
      style: const TextStyle(
        fontSize: 12,
      ),
    );
