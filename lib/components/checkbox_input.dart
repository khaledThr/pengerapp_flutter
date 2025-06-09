import 'package:flutter/material.dart';
import 'package:penger/resources/apcolors.dart';

class CheckboxInput extends StatefulWidget {
  final bool value;
  final Widget ? lable;
  final ValueChanged<bool> onChanged;
  const CheckboxInput({
    super.key,
    required this.value,
    required this.onChanged, this.lable,
  });

  @override
  State<CheckboxInput> createState() => _CheckboxInputState();
}

class _CheckboxInputState extends State<CheckboxInput> {
  late bool value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Transform.scale(
          scale: 1.4,
          child: Checkbox(
            value: value,
            onChanged: (bool? newValue) => setState(() {
              value = newValue!;
              widget.onChanged(value);
            }),
            activeColor: Appcolors.primaryColor,
            checkColor: Colors.white,
            side: BorderSide(color: Appcolors.primaryColor),
          ),
        ),
       if(widget.lable !=null)...[
         const SizedBox(width: 4),
        Expanded(
          child: widget.lable!),
        
       ]
      ]
  );
  }

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }
}
