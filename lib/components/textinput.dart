import 'package:flutter/material.dart';
import 'package:penger/resources/apcolors.dart';

class Inputcomponent extends StatefulWidget {
  final String lable;
  final bool isPassword;
  final bool isEnabled;
  final bool isrequired;
  final TextEditingController textEdcontroller;
  final ValueChanged<String>? onsubmited;
  final TextInputAction? textInputAction;
  final FocusNode? docusNode;
  const Inputcomponent({
    super.key,
    required this.lable,
    this.isPassword = false,
    required this.textEdcontroller,
    this.onsubmited,
    this.textInputAction,
    this.docusNode,
    this.isrequired = true,  this.isEnabled=true,
  });

  @override
  State<Inputcomponent> createState() => _InputcomponentState();
}

class _InputcomponentState extends State<Inputcomponent> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled,
      autovalidateMode: AutovalidateMode.onUnfocus,
      validator: (input) {
        if (!widget.isrequired) {
          return null;
        }
        if (input == null || input.isEmpty) {
          return "This field is required";
        }
        return null;
      },
      obscureText: !show && widget.isPassword,
      onFieldSubmitted: widget.onsubmited,
      textInputAction: widget.textInputAction ?? TextInputAction.next,
      focusNode: widget.docusNode,
      decoration: InputDecoration(
        labelText: widget.lable,
        suffixIcon: widget.isPassword
            ? InkWell(
                onTap: () => setState(() => show = !show),
                splashColor: Appcolors.light20.withValues(alpha: 480),
                highlightColor: Appcolors.light20.withValues(alpha: 480),
                child: Icon(
                  show
                      ? Icons.remove_red_eye_outlined
                      : Icons.visibility_off_outlined,
                  color: Appcolors.light20,
                ),
              )
            : null,
        iconColor: Appcolors.light20,
        labelStyle: TextStyle(color: Appcolors.light20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: Appcolors.light20.withValues(alpha: 480),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Appcolors.light20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Appcolors.primaryColor),
        ),
      ),
    );
  }
}
