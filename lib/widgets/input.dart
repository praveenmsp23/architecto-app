import 'package:architecto/extensions/theme.dart';
import 'package:flutter/cupertino.dart';

class Input extends StatefulWidget {
  final String? hint;
  final String? label;
  final String? error;
  final String? placeholder;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType type;
  final bool obscureText;
  final VoidCallback? onChange;
  final TextEditingController controller;

  const Input({
    Key? key,
    this.hint,
    this.label,
    this.error,
    this.placeholder,
    this.prefix,
    this.suffix,
    this.onChange,
    this.type = TextInputType.text,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.label != null)
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(widget.label!),
            ),
          ),
        SizedBox(height: 6),
        Container(
          padding: EdgeInsets.symmetric(vertical: 1.0),
          decoration: BoxDecoration(
            border: Border.all(
              width: 2.0,
              color: widget.error != ""
                  ? CupertinoColors.systemRed
                  : CupertinoColors.lightBackgroundGray,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              if (widget.prefix != null)
                Padding(
                  padding: EdgeInsets.only(left: 12, right: 4),
                  child: widget.prefix,
                ),
              Expanded(
                child: CupertinoTextField(
                  decoration: null,
                  obscureText: widget.obscureText,
                  keyboardType: widget.type,
                  placeholder: widget.placeholder,
                  style: TextStyle(fontSize: 20),
                  controller: widget.controller,
                ),
              ),
              if (widget.suffix != null)
                Padding(
                  padding: EdgeInsets.only(left: 4, right: 12),
                  child: widget.suffix,
                ),
            ],
          ),
        ),
        SizedBox(height: 6),
        if (widget.error != "")
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.error!,
                style: TextStyle(
                  color: CupertinoColors.systemRed,
                ),
              ),
            ),
          ),
        SizedBox(height: 6),
        if (widget.hint != null)
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.hint!,
                style: TextStyle(
                  color: context.secondaryTextColor,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
