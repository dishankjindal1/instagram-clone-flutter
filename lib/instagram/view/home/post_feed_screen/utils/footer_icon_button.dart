import 'package:flutter/material.dart';

class FooterIconButton extends StatefulWidget {
  const FooterIconButton({
    required this.icon,
    required this.iconOnPressed,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final IconData iconOnPressed;
  final VoidCallback onPressed; 

  @override
  State<FooterIconButton> createState() => _FooterIconButtonState();
}

class _FooterIconButtonState extends State<FooterIconButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.onPressed;
        setState(() {
          _isPressed = !_isPressed;
        });
      },
      icon: Icon(_isPressed ? widget.iconOnPressed : widget.icon),
    );
  }
}
