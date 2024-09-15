import 'package:architecto/extensions/theme.dart';
import 'package:flutter/cupertino.dart';

class Input extends StatefulWidget {
  final String? hint;
  final String? label;
  final String? error;
  final String? placeholder;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscureText;
  final TextEditingController controller;

  const Input({
    Key? key,
    this.hint,
    this.label,
    this.error,
    this.placeholder,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(widget.label!, style: context.textTheme.textStyle),
        Container(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: widget.error != null
                  ? CupertinoColors.systemRed
                  : CupertinoColors.lightBackgroundGray,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            children: [
              if (widget.prefix != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: widget.prefix,
                ),
              Expanded(
                child: CupertinoTextField(
                  controller: widget.controller,
                  obscureText: widget.obscureText,
                  placeholder: widget.placeholder,
                  decoration: null,
                  onTap: () => setState(() {}),
                  onEditingComplete: () => setState(() {}),
                ),
              ),
              if (widget.suffix != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: widget.suffix,
                ),
            ],
          ),
        ),
        if (widget.error != null)
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              widget.error!,
              style: TextStyle(
                color: CupertinoColors.systemRed,
                fontSize: 12,
              ),
            ),
          ),
        if (widget.hint != null)
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              widget.hint!,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
