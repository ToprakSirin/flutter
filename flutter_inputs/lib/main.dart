import 'package:flutter/material.dart';
import 'package:flutter_inputs/stepper_kullanimi.dart';

import 'package:flutter_inputs/text_form_field_kullanimi.dart';

import 'date_time.dart';
import 'diger_form_elemanlari.dart';
import 'dropDownButton_dropDownMenu.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: StepperOrnek(),
    );
  }
}

class TextFieldIslemleri extends StatefulWidget {
  final String title;
  const TextFieldIslemleri({Key? key, required this.title}) : super(key: key);

  @override
  _TextFieldIslemleriState createState() => _TextFieldIslemleriState();
}

class _TextFieldIslemleriState extends State<TextFieldIslemleri> {
  late TextEditingController _emailController;
  late FocusNode _focusNode;
  int maxLineCount = 1;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: 'emre@emre.com');
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        maxLineCount = 3;
      } else {
        maxLineCount = 1;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              focusNode: _focusNode,
              controller: _emailController,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              maxLines: maxLineCount,
              maxLength: 20,
              onChanged: (String deger) {
                if (deger.length > 3) {
                  setState(() {
                    _emailController.value = TextEditingValue(
                      text: deger,
                      selection: TextSelection.collapsed(offset: deger.length),
                    );
                  });
                }
              },
              cursorColor: Colors.pink,
              decoration: InputDecoration(
                labelText: 'Label Text',
                hintText: 'E mail Giriniz.',
                // icon: Icon(Icons.add),
                prefixIcon: Icon(Icons.email),
                suffixIcon: Icon(Icons.access_alarms_outlined),
                filled: true,
                fillColor: Colors.orange.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18.0)),
                ),
              ),
              onSubmitted: (String deger) {
                print("submit" + deger);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_emailController.text),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _emailController.text = 'emrealtunbilek@gmail.com';
          });
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
