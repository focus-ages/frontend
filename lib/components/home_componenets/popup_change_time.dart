import 'package:flutter/material.dart';
import 'package:front/validators/number_validator.dart';

import '../../resources/color_pattern.dart';

class PopUpChangeTime extends StatefulWidget {
  NumberValidator numberValidator = NumberValidator();
  var idPopUp;

  PopUpChangeTime({Key? key, this.idPopUp}) : super(key: key);

  @override
  State<PopUpChangeTime> createState() => _PopUpChangeTimeState();
}

class _PopUpChangeTimeState extends State<PopUpChangeTime> {
  //int time = 20;

  final TextEditingController _controller = TextEditingController();
  String minutosString = "";
  String _valuePrevious = "";

  void editPopUp() {
    String title = "";
    String timeString = _controller.text;

    _controller.clear();

    //_valuePrevious = _controller.text;

    if (widget.idPopUp == 0) {
      title = "Meta diária";
      timeString = _valuePrevious + " Horas";
    } else {
      title = "Tempo de notificações";
      timeString = _controller.text + " Minutos";
    }

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return GestureDetector(
              onTap: () {
                _controller.text = _valuePrevious;
                Navigator.of(context).pop();
              },
              child: AlertDialog(
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                backgroundColor: ColorPattern.darkCard,
                title: Text(
                  title,
                  style:
                      const TextStyle(color: ColorPattern.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
                content: Container(
                  width: 10,
                  height: 55,
                  decoration: BoxDecoration(
                      color: ColorPattern.whiteOpacity,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                      controller: _controller,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: ColorPattern.white),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: timeString,
                          hintStyle:
                              const TextStyle(color: ColorPattern.gray))),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _controller.text = _valuePrevious;
                      });
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar',
                        style: TextStyle(color: ColorPattern.green)),
                  ),
                  TextButton(
                      onPressed: () {
                        if (NumberValidator.validateRequired(
                                _controller.text) ==
                            null) {
                          if (widget.idPopUp == 0) {
                            if (NumberValidator.validateDailyGoal(
                                    _controller.text) ==
                                null) {
                              _valuePrevious = _controller.text;
                              setState(() {
                                _controller.text;
                              });
                              Navigator.of(context).pop();
                            } else {
                              _controller.text = _valuePrevious;
                              Navigator.of(context).pop();
                            }
                          } else {
                            if (NumberValidator.validateNotificationTime(
                                    _controller.text) ==
                                null) {
                              _valuePrevious = _controller.text;
                              setState(() {
                                _controller.text;
                              });
                              Navigator.of(context).pop();
                            } else {
                              _controller.text = _valuePrevious;
                              Navigator.of(context).pop();
                            }
                          }
                        } else {
                          setState(() {
                            _controller.text = _valuePrevious;
                          });
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text('Salvar',
                          style: TextStyle(color: ColorPattern.green))),
                ],
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    //String minutosString = _controller.text;
    // TODO: implement build
    return TextButton(
        onPressed: () {
          editPopUp();
        },
        child: Row(children: [
          RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: _controller.text,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorPattern.green,
                    )),
                const TextSpan(
                    text: ' min',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: ColorPattern.white,
                    )),
              ],
            ),
          ),
          const Padding(padding: EdgeInsets.only(left: 3)),
          const Icon(Icons.edit, color: ColorPattern.white, size: 18),
        ]));
  }
}
