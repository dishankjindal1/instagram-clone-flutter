import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram/instagram/constants.dart';
import 'package:instagram/instagram/view/home/post_feed_screen/utils/footer_icon_button.dart';

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

class FeedCardView extends StatefulWidget {
  const FeedCardView({Key? key}) : super(key: key);

  @override
  State<FeedCardView> createState() => _FeedCardViewState();
}

class _FeedCardViewState extends State<FeedCardView> {
  late ScrollController _imageController;
  int dotIndicatorIndex = 0;

  @override
  void initState() {
    super.initState();
    double deviceWidth = 0;
    Timer(Duration.zero, () {
      deviceWidth = MediaQuery.of(context).size.width;
    });
    _imageController = ScrollController();

    _imageController.addListener(() {
      // debugPrint(_imageController.offset.toString() +
      //     " width :" +
      //     MediaQuery.of(context).size.width.toString());
      var newDotIndicatorIndex =
          (_imageController.offset / deviceWidth).round();
      if (newDotIndicatorIndex != dotIndicatorIndex) {
        setState(() {
          dotIndicatorIndex = newDotIndicatorIndex;
        });
        debugPrint(dotIndicatorIndex.toString());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _imageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: Material(
        color: Theme.of(context).primaryColor,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(NetworkAssets.person),
          ),
          title: const Text('Dishank Jindal'),
          subtitle: const Text('Panchkula, India'),
          trailing: ImageIcon(AssetImage(ImageAssets.add)),
        ),
      ),
      footer: Material(
        color: Theme.of(context).primaryColor,
        elevation: 2.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: FooterIconButton(
                icon: FontAwesomeIcons.heart,
                iconOnPressed: FontAwesomeIcons.solidHeart,
                onPressed: () {},
              ),
            ),
            FooterIconButton(
              icon: FontAwesomeIcons.comment,
              iconOnPressed: FontAwesomeIcons.comment,
              onPressed: () {},
            ),
            FooterIconButton(
              icon: FontAwesomeIcons.share,
              iconOnPressed: FontAwesomeIcons.share,
              onPressed: () {},
            ),
            const SizedBox(width: 50),
            Center(
              child: SizedBox(
                width: 50,
                height: 20,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemExtent: 10.0,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    var isPrimaryBuild = index == dotIndicatorIndex;

                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.5),
                      child: Material(
                        color: isPrimaryBuild
                            ? Colors.white
                            : Theme.of(context).secondaryHeaderColor,
                        shape: const CircleBorder(),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: FooterIconButton(
                icon: FontAwesomeIcons.bookmark,
                iconOnPressed: FontAwesomeIcons.solidBookmark,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: ListView.builder(
          controller: _imageController,
          physics: const PageScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Image.network(
              NetworkAssets.person,
              fit: BoxFit.fitWidth,
              width: MediaQuery.of(context).size.width,
            );
          },
        ),
      ),
    );
  }
}
