import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isPressed = false;

  void _handleTap() {
    setState(() {
      _isPressed = !_isPressed;
    });

    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _handleTap(),
      onTapUp: (_) => _handleTap(),
      onTapCancel: () => _handleTap(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        decoration: BoxDecoration(
          color: _isPressed ? Colors.blue : Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
