import 'package:flutter/material.dart';
import 'package:penger/resources/apcolors.dart';
import 'package:penger/resources/appstyles.dart';

class Buttoncomponent extends StatefulWidget {
  final String label;
  final Widget? icon;
  final String? buttonType;
  final double?  widh;
  const Buttoncomponent({
    super.key,
    required this.label,
    this.icon,
    this.buttonType, this.widh,
  });

  @override
  State<Buttoncomponent> createState() => _ButtoncomponentState();
}

class _ButtoncomponentState extends State<Buttoncomponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: widget.buttonType == 'primary'
              ? Appcolors.primaryColor
              : Appcolors.primaryColorlight,
          foregroundColor: widget.buttonType == 'primary'
              ? Colors.white
              : Appcolors.primaryColor,
        ),
        child: Text(widget.label,style: Appstyles.title2(),),
      ),
    );
  }
}
