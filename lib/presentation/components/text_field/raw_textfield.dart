import 'package:flutter/material.dart';
import 'package:sleep_sound/data/resources/color_palette.dart';

class RawTextField extends StatefulWidget {
  final String _hint;
  final IconData? _icon;
  final TextEditingController _textFieldController;
  const RawTextField(
      Key? key,
      this._hint,
      this._icon,
      this._textFieldController,
      ) : super(key: key);

  @override
  RawTextFieldState createState() => RawTextFieldState();
}

class RawTextFieldState extends State<RawTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: textWhite.withOpacity(0.3),
      autofocus: false,
      controller: widget._textFieldController,
      onChanged: (name) => setState(() {
        name = widget._textFieldController.text;
      }),
      decoration: InputDecoration(
          focusColor: darkPurple.withOpacity(0.4),
          fillColor: darkPurple.withOpacity(0.4),
          hoverColor: darkPurple.withOpacity(0.4),
          prefixIcon: widget._icon!=null
              ? Icon(
            widget._icon,
            color: textWhite.withOpacity(0.3),
          )
              : null,
          suffixIcon: Visibility(
            visible: widget._textFieldController.text.isNotEmpty,
            child: IconButton(
                onPressed: () => setState(() {
                  widget._textFieldController.text = '';
                }),
                icon: Icon(Icons.clear,color: textWhite.withOpacity(0.3))),
          ),
          hintText: widget._hint,
          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          hintStyle: TextStyle(
              color: textWhite.withOpacity(0.3),
            fontFamily: 'JosefinSans-Thin',
            fontWeight: FontWeight.w200,
            fontSize: 16.0,
            letterSpacing: -0.3
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none
          )),
    );
  }
}
