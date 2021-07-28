import 'package:flutter/material.dart';
import 'package:flutter_state/counter.dart';
import 'package:provider/provider.dart';

class ProviderSayacUygulamasi extends StatelessWidget {
  const ProviderSayacUygulamasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider ile Sayaç App"),
      ),
      body: Center(
        child: MyColumn(),
      ),
      floatingActionButton: MyFloatingActionButtons(),
    );
  }
}

class MyFloatingActionButtons extends StatelessWidget {
  const MyFloatingActionButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var mySayac = Provider.of<Counter>(context, listen: false);
    debugPrint("floating action button build");

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: "1",
          onPressed: () {
            context.read<Counter>().arttir();
          },
          child: Icon(Icons.add),
        ),
        SizedBox(
          height: 5,
        ),
        FloatingActionButton(
          heroTag: "2",
          onPressed: () {
            context.read<Counter>().azalt();
          },
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}

class MyColumn extends StatelessWidget {
  const MyColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint("myColumn widget build");
    //var mySayac = Provider.of<Counter>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          //mySayac.sayac.toString(),
          context.watch<Counter>().sayac.toString(),
          style: TextStyle(fontSize: 32),
        ),
      ],
    );
  }
}
