import 'package:flutter/material.dart';

import '../../model/filter_model.dart';

class RadioCheckListWidget extends StatefulWidget {
  const RadioCheckListWidget({
    super.key,
    required this.optionList,
    required this.optionType,
  });
  final List<String> optionList;
  final OptionType optionType;

  @override
  State<RadioCheckListWidget> createState() => _RadioCheckListWidgetState();
}

class _RadioCheckListWidgetState extends State<RadioCheckListWidget> {
  String selectedRadio = "";
  List<bool> isSelected = [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.optionList.length,
      itemBuilder: (context, index) {
        if (widget.optionType == OptionType.radio) {
          return RadioListTile(
            value: widget.optionList[index],
            groupValue: selectedRadio,
            onChanged: (value) {
              setState(() {
                selectedRadio = value.toString();
              });
            },
            title: Text(widget.optionList[index]),
          );
        } else {
          widget.optionList.forEach((element) {
            isSelected.add(false);
          });
          return CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            value: isSelected[index],
            onChanged: (value) {
              setState(() {
                isSelected[index] = value!;
              });
            },
            title: Text(widget.optionList[index]),
          );
        }
      },
    );
  }
}
