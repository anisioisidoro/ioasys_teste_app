import 'package:flutter/material.dart';

class TextFieldPassword extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final IconData? suffixIcon;

  final bool isPassword;
  final Function? alterPasswordView;
  final IconData? prefixIcon;

  const TextFieldPassword(
      {Key? key,
      this.focusNode,
      this.textEditingController,
      this.suffixIcon,
      this.isPassword = true,
      this.prefixIcon,
      this.alterPasswordView})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => focusNode?.requestFocus(),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color(0xFFF5F5F5),
            border: Border.all(width: 0, color: Colors.transparent)),
        child: Center(
          child: TextField(
            controller: textEditingController,
            focusNode: focusNode,
            textAlign: TextAlign.left,
            obscureText: isPassword,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                child: Icon(suffixIcon),
                onTap:  alterPasswordView!(),
              ),
              prefixIcon: Icon(
                prefixIcon,
                size: 5,
              ),
              border: InputBorder.none,
              hintText: "",
            ),
          ),
        ),
      ),
    );
  }
}
