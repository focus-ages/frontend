import 'package:flutter/material.dart';

import '../../resources/color_pattern.dart';

class InputText extends StatefulWidget {
  const InputText({
    Key? key,
    required this.controller,
    //required this.placeholder,
    this.validator,
    this.keyboardType,
  }) : super(key: key);

  //final String placeholder;
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
              color: ColorPattern.darkMode,
              border: Border.all(
                  color: error ? ColorPattern.error : ColorPattern.darkMode),
              borderRadius: BorderRadius.circular(22),
            ),
            child: TextFormField(
              validator: _validateInput,
              controller: widget.controller,
              style: const TextStyle(
                color: ColorPattern.green,
                fontSize: 28,
              ),
              keyboardType: widget.keyboardType,
              decoration: const InputDecoration(
                filled: true,
                fillColor: ColorPattern.darkCard,
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
                hintText: "Digite seu nome",
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

/*
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2.3,
        height: MediaQuery.of(context).size.width / 8,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextFormField(
            controller: _nameController,
            style: const TextStyle(
              color: ColorPattern.green,
              fontSize: 28,
            ),
            decoration: const InputDecoration(
              hintText: 'Digite Aqui',
              hintStyle: TextStyle(color: ColorPattern.gray, fontSize: 19),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mensagem de erro: ';
              }
              return null;
            },
            onSaved: (value) {
              //_inputValue = value!;
            },
          ),
        ),
      ),
    );
  }*/
}
