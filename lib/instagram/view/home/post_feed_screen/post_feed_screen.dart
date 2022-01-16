import 'package:flutter/material.dart';
import 'package:instagram/instagram/constants.dart';

class PostFeedScreen extends StatelessWidget {
  const PostFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      children: const [
        FeedCardView(),
        FeedCardView(),
        FeedCardView(),
      ],
    );
  }
}

class FeedCardView extends StatelessWidget {
  const FeedCardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
        header: ColoredBox(
          color: Colors.amberAccent,
          child: ListTile(
            leading: CircleAvatar(
              child: ImageIcon(AssetImage(ImageAssets.add)),
            ),
            title: const Text('Dishank Jindal'),
            subtitle: const Text('Panchkula, India'),
            trailing: ImageIcon(AssetImage(ImageAssets.add)),
          ),
        ),
        footer: ColoredBox(
          color: Colors.amberAccent,
          child: ListTile(
            leading: CircleAvatar(
              child: ImageIcon(AssetImage(ImageAssets.add)),
            ),
            title: const Text('Dishank Jindal'),
            subtitle: const Text('Panchkula, India'),
            trailing: ImageIcon(AssetImage(ImageAssets.add)),
          ),
        ),
        child: const SizedBox(
          height: 500,
          child: ColoredBox(
            color: Colors.blueAccent,
          ),
        ));
  }
}
