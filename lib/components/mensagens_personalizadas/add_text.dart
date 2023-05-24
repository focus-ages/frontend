import 'package:flutter/material.dart';
import '../../resources/color_pattern.dart';

class AddText extends StatefulWidget {
  final Function(String) onSave;
  final String placeholder;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  const AddText(
      {Key? key,
      required this.placeholder,
      required this.onSave,
      this.validator,
      this.keyboardType})
      : super(key: key);

  @override
  _AddTextState createState() => _AddTextState();
}

class _AddTextState extends State<AddText> {
  final TextEditingController _messageController = TextEditingController();
  final FocusNode _messageFocusNode = FocusNode();
  bool _showPlaceholder = true;
  bool error = false;
  String? errorMessage;

  @override
  void dispose() {
    _messageFocusNode.dispose();
    super.dispose();
  }

  String? _validateInput(String? value) {
    if (widget.validator != null) {
      String? result = widget.validator!(value);
      if (result != null) {
        setState(() {
          error = true;
          errorMessage = result;
        });
        FocusScope.of(context).requestFocus(_messageFocusNode);
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
    Size size = MediaQuery.of(context).size;
    String pushPath = "/";

    if (widget.placeholder == 'Escreva sua frase') {
      pushPath = "/home";
    }

    return Dialog(
      backgroundColor: ColorPattern.darkCard,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Container(
        decoration: BoxDecoration(
            color: ColorPattern.darkCard,
            borderRadius: BorderRadius.circular(20.0)),
        height: size.height * 0.3,
        padding: EdgeInsets.fromLTRB(
          size.width * 0.05,
          size.height * 0.03,
          size.width * 0.05,
          size.height * 0.03,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  TextFormField(
                    keyboardType: widget.keyboardType,
                    controller: _messageController,
                    focusNode: _messageFocusNode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      fillColor: ColorPattern.whiteOpacity,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.03,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(
                          width: 2.0,
                          color: error ? ColorPattern.error : Colors.blue,
                        ),
                      ),
                      hintText: '',
                      hintStyle: const TextStyle(color: ColorPattern.gray),
                    ),
                    maxLines: null,
                    minLines: 99,
                    style: const TextStyle(
                        fontSize: 16.0, color: ColorPattern.white),
                    onTap: () {
                      setState(() {
                        _showPlaceholder = false;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _showPlaceholder = value.isEmpty;
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPlaceholder = false;
                        _messageFocusNode.requestFocus();
                      });
                    },
                    child: AnimatedOpacity(
                      opacity: _showPlaceholder ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${widget.placeholder} ',
                              style: const TextStyle(
                                  color: ColorPattern.gray, fontSize: 16.0)),
                          const Icon(Icons.edit, color: ColorPattern.gray),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (error && errorMessage != null)
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  errorMessage!,
                  style: TextStyle(
                    color: ColorPattern.error,
                    fontSize: 12.0,
                  ),
                ),
              ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar',
                      style: TextStyle(color: ColorPattern.white)),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () => {
                    _validateInput(_messageController.text),
                    if (!error)
                      {
                        widget.onSave(_messageController.text),
                        Navigator.pop(context),
                        Navigator.pushNamed(context, pushPath)
                      }
                  },
                  child: const Text('Salvar',
                      style: TextStyle(color: ColorPattern.green)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
