import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MsgAppBar extends StatefulWidget with PreferredSizeWidget{
  const MsgAppBar({ Key? key }) : super(key: key);

  @override
  State<MsgAppBar> createState() => _MsgAppBarState();

    @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}

class _MsgAppBarState extends State<MsgAppBar> {

  String username = "User Messages";

  @override
  void initState() {
    super.initState();
    username = FirebaseAuth.instance.currentUser!.displayName!;
  }
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(username),
    );
  }

}