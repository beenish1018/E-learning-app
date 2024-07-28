import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final IconData prefixIcon;
  final Widget? suffixIcon;

  CustomTextField({
    required this.controller,
    required this.label,
    this.obscureText = false,
    required this.prefixIcon,
    this.suffixIcon,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        border: Border.all(
          color: _isFocused ? Colors.blueAccent : Colors.grey[300]!,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        focusNode: _focusNode,
        decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
            color: _isFocused ? Colors.blueAccent : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          prefixIcon: Icon(widget.prefixIcon, color: _isFocused ? Colors.blueAccent : Colors.grey),
          suffixIcon: widget.suffixIcon,
        ),
        cursorColor: Colors.blueAccent,
      ),
    );
  }
}
