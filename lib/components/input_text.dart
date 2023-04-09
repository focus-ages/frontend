import 'package:flutter/material.dart';

import '../resources/color_pattern.dart';

class InputText extends StatefulWidget {
  const InputText({Key? key}) : super(key: key);

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final _formKey = GlobalKey<FormState>();
  String _inputValue = '';

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
            decoration: const InputDecoration(
              hintText: 'Fulano',
              hintStyle: TextStyle(color: ColorPattern.green, fontSize: 24),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Mensagem de erro: ';
              }
              return null;
            },
            onSaved: (value) {
              _inputValue = value!;
            },
          ),
        ),
      ),
    );
  }
}
