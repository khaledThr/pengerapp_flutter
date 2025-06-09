import 'package:flutter/material.dart';
import 'package:penger/resources/apcolors.dart';
import 'package:penger/resources/appstyles.dart';

class Buttoncomponent extends StatefulWidget {
  final String label;
  final Widget? icon;
  final String? buttonType;
  final double? widh;
  final Function() onPressed;
  final bool isLoading;
  const Buttoncomponent({
    super.key,
    required this.label,
    this.icon,
    required this.buttonType,
    this.widh,
    required this.onPressed,
    this.isLoading=false
  });

  @override
  State<Buttoncomponent> createState() => _ButtoncomponentState();
}

class _ButtoncomponentState extends State<Buttoncomponent> {
  Map<String, Color> bgcolors = {
    "primary": Appcolors.primaryColor,
    "secondary": Appcolors.primaryColorlight,
    "light": Colors.white,
  };
  Map<String, Color> fgcolors = {
    "primary": Colors.white,
    "secondary": Appcolors.primaryColor,
    "light": Colors.black,
  };
  Map<String, Color> bordercolors = {
    "primary": Appcolors.primaryColor,
    "secondary": Appcolors.primaryColorlight,
    "light": Appcolors.light20,
  };

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: bordercolors[widget.buttonType]!),
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: bgcolors[widget.buttonType],
          foregroundColor: fgcolors[widget.buttonType],
        ),
        child: widget.isLoading? : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.icon != null) widget.icon!,
            Text(widget.label, style: Appstyles.title2()),
          ],
        ),
      ),
    );
  }
}
