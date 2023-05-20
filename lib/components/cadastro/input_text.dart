import 'package:flutter/material.dart';

import '../../resources/color_pattern.dart';

class InputText extends StatefulWidget {
  const InputText({
    Key? key,
    required this.controller,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  bool error = false;
  String? errorMessage;
  bool isVisible = true;

  String? _validateInput(String? value) {
    if (widget.validator != null) {
      String? result = widget.validator!(value);
      if (result != null) {
        setState(() {
          error = true;
          errorMessage = result;
        });

        return '';
      }

      setState(() {
        error = false;
        errorMessage = null;
      });
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    double contentPaddingBottom = error ? -4 : 16;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 6, left: 6, right: 6),
            decoration: BoxDecoration(
              color: ColorPattern.darkCard,
              border: Border.all(
                  color: error ? ColorPattern.error : ColorPattern.darkCard),
              borderRadius: BorderRadius.circular(22),
            ),
            child: TextFormField(
              validator: _validateInput,
              controller: widget.controller,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ColorPattern.green,
                fontSize: 28,
              ),
              keyboardType: widget.keyboardType,
              decoration: const InputDecoration(
                filled: true,
                fillColor: ColorPattern.darkCard,
                hintStyle: TextStyle(color: ColorPattern.gray, fontSize: 24),
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                contentPadding: EdgeInsets.only(
                  top: 10,
                  bottom: 16,
                  left: 14,
                  right: 14,
                ),
                alignLabelWithHint: true,
                hintText: "Digite aqui",
                errorBorder: InputBorder.none,
              ),
            ),
          ),
          error
              ? Padding(
                  padding: const EdgeInsets.only(top: 4.0, left: 24),
                  child: Text(
                    errorMessage ?? '',
                    style: const TextStyle(
                      color: ColorPattern.error,
                      fontSize: 28,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
