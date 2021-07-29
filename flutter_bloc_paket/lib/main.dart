import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_paket/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_paket/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_paket/counter_bloc/counter_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          BlocProvider(create: (context) => CounterBloc(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Flutter Bloc Paketi"),
        ),
        body: MyCenterWidget(),
        floatingActionButton: MyActions());
  }
}

class MyCenterWidget extends StatelessWidget {
  const MyCenterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          BlocBuilder<CounterBloc, CounterState>(
              builder: (context, counterState) {
            return Text(
              counterState.sayac.toString(),
              style: Theme.of(context).textTheme.headline4,
            );
          }),
        ],
      ),
    );
  }
}

class MyActions extends StatelessWidget {
  const MyActions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(CounterArttir());
          },
          tooltip: 'Arttır',
          child: Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(CounterAzalt());
          },
          tooltip: 'Azalt',
          child: Icon(Icons.remove),
        ),
      ],
    );
  }
}
