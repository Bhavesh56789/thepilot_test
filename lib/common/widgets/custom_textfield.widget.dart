import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? errorText;
  final bool? obscureText;
  final TextInputType keyboardType;
  final Function(String) onChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.errorText,
    this.obscureText,
    this.keyboardType = TextInputType.text,
    required this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool? obscureText;
  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      obscureText: obscureText ?? false,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
          color: Color(0xFF8F9098),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFC5C6CC)),
          borderRadius: BorderRadius.circular(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFC5C6CC)),
          borderRadius: BorderRadius.circular(12),
        ),
        errorText: widget.errorText,
        suffixIcon:
            obscureText != null
                ? IconButton(
                  icon: Icon(
                    obscureText! ? Icons.visibility_off : Icons.visibility,
                  ),
                  color: Color(0xFF8F9098),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText!; // Toggle state
                    });
                  },
                )
                : null,
      ),
    );
  }
}
