import 'package:flutter/material.dart';

class TemelButonlar extends StatelessWidget {
  const TemelButonlar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          onLongPress: () {
            debugPrint('Uzun Basıldı');
          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          child: Text('Text  Button'),
        ),
        TextButton.icon(
          onPressed: () {},
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.yellow),
            overlayColor:
                MaterialStateProperty.all(Colors.yellow.withOpacity(0.5)),
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.teal;
              }
              if (states.contains(MaterialState.hovered)) {
                return Colors.orange;
              }
              return null;
            }),
            //backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
          icon: Icon(Icons.add),
          label: Text('Text Button with icon'),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              primary: Colors.red, onPrimary: Colors.yellow),
          child: Text('Elevated Button'),
        ),
        ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text('Elevated Button with icon'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: Text('Outlined Button'),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side: BorderSide(color: Colors.red, width: 4)),
          ),
          label: Text('Outlined Button with icon'),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              width: 9,
              color: Colors.purple,
            ),
            shape: StadiumBorder(),
          ),
          label: Text('Outlined Button with icon'),
        ),
      ],
    );
  }
}
