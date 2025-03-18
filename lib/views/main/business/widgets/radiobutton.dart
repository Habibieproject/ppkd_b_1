import 'package:flutter/material.dart';
import 'package:ppkd_b_1/data/model_name.dart';

enum SingingCharacter { lafayette, jefferson }

class RadiobuttonScreen extends StatefulWidget {
  const RadiobuttonScreen({super.key});

  @override
  State<RadiobuttonScreen> createState() => _RadiobuttonScreenState();
}

class _RadiobuttonScreenState extends State<RadiobuttonScreen> {
  String dataValue = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(listNameModelData[0].nameSchool),
          subtitle: Text(listNameModelData[0].address),
          leading: Radio<String>(
            value: listNameModelData[0].nameSchool,
            groupValue: dataValue,
            onChanged: (String? value) {
              setState(() {
                dataValue = value!;
              });
            },
          ),
        ),
        ListTile(
          title: Text(listNameModelData[1].nameSchool),
          subtitle: Text(listNameModelData[1].address),

          leading: Radio<String>(
            fillColor: WidgetStateProperty.all(Colors.red),
            value: listNameModelData[1].nameSchool,
            groupValue: dataValue,
            onChanged: (String? value) {
              setState(() {
                dataValue = value!;
                print(dataValue);
              });
            },
          ),
        ),
        ListTile(
          title: Text(listNameModelData[2].nameSchool),
          subtitle: Text(listNameModelData[2].address),

          leading: Radio<String>(
            value: listNameModelData[2].nameSchool,
            groupValue: dataValue,
            onChanged: (String? value) {
              setState(() {
                dataValue = value!;
              });
              print(dataValue);
            },
          ),
        ),
      ],
    );
  }
}
