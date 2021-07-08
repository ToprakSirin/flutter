import 'package:flutter/material.dart';

class LisstviewLayoutProblemleri extends StatelessWidget {
  const LisstviewLayoutProblemleri({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Layout Problems'),
      ),
      body: Container(
        height: 200,
        child: Row(
          children: [
            Text('Başladı'),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                //shrinkWrap: true,
                children: [
                  Container(
                    width: 200,
                    color: Colors.orange.shade200,
                  ),
                  Container(
                    width: 200,
                    color: Colors.orange.shade400,
                  ),
                  Container(
                    width: 200,
                    color: Colors.orange.shade200,
                  ),
                  Container(
                    width: 200,
                    color: Colors.orange.shade400,
                  ),
                ],
              ),
            ),
            Text('Başladı'),
          ],
        ),
        decoration: BoxDecoration(
          border: Border.all(width: 4, color: Colors.red),
        ),
      ),
    );
  }

  Column columnicindeliste() {
    return Column(
      children: [
        Expanded(
          child: ListView(
            //shrinkWrap: true,
            children: [
              Text('Başladı'),
              Container(
                height: 200,
                color: Colors.orange.shade200,
              ),
              Container(
                height: 200,
                color: Colors.orange.shade400,
              ),
              Container(
                height: 200,
                color: Colors.orange.shade200,
              ),
              Container(
                height: 200,
                color: Colors.orange.shade400,
              )
            ],
          ),
        ),
        Text('Bitti'),
      ],
    );
  }
}
