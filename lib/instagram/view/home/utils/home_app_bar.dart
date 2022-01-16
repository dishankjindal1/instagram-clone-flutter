import 'package:flutter/material.dart';
import 'package:instagram/instagram/constants.dart';
import 'package:instagram/instagram/view/home/utils/camera/camera_screen.dart';

class HomeAppBar extends StatelessWidget with PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: _TransformImageAsset(
        child: Image.asset(
          ImageAssets.logoTitle,
          fit: BoxFit.fitHeight,
          height: 80,
        ),
      ),
      leading: _TransformIconButton(
        child: IconButton(
          icon: Image.asset(ImageAssets.camera),
          onPressed: () async {
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CameraScreen.initPage(context)));
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _TransformImageAsset extends StatelessWidget {
  const _TransformImageAsset({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 5),
      child: child,
    );
  }
}

class _TransformIconButton extends StatelessWidget {
  const _TransformIconButton({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(10, 0),
      child: child,
    );
  }
}
