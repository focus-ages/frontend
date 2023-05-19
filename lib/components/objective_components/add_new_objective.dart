import 'package:flutter/material.dart';
import '../../resources/color_pattern.dart';

class AddNewObjective extends StatefulWidget {
  final Function(String) onSave;
  final String placeholder;

  const AddNewObjective(
      {Key? key, required this.placeholder, required this.onSave})
      : super(key: key);

  @override
  _AddNewObjectiveState createState() => _AddNewObjectiveState();
}

class _AddNewObjectiveState extends State<AddNewObjective> {
  final TextEditingController _objectiveController = TextEditingController();
  final FocusNode _objectiveFocusNode = FocusNode();
  bool _showPlaceholder = true;

  @override
  void dispose() {
    _objectiveFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                  TextField(
                    controller: _objectiveController,
                    focusNode: _objectiveFocusNode,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: ColorPattern.whiteOpacity,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.height * 0.03,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
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
                        _objectiveFocusNode.requestFocus();
                      });
                    },
                    child: AnimatedOpacity(
                      opacity: _showPlaceholder ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 200),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Digite seu objetivo ',
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
                    widget.onSave(_objectiveController.text),
                    Navigator.pop(context),
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
