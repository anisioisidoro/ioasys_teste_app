import 'package:flutter/material.dart';

class SharedTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextEditingController? textEditingController;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final String? hintText;
  final Function(String value)? onChanged;
  final Function? onSubmitted;
  final Function? cleanData;

  const SharedTextField({
    Key? key,
    this.focusNode,
    this.textEditingController,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText,
    this.onChanged, this.onSubmitted, this.cleanData,
  }) : super(key: key);

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
            decoration: InputDecoration(
              suffixIcon: Icon(suffixIcon),
              
              border: InputBorder.none,
              hintText: hintText ?? "",
            ),
            onChanged:  onChanged!,
            
          ),
        ),
      ),
    );
  }
}
