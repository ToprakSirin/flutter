import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_paket/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_paket/counter_bloc/counter_event.dart';
import 'package:flutter_bloc_paket/counter_bloc/counter_state.dart';
import 'package:flutter_bloc_paket/theme_cubit.dart';

import 'bloc_plugin/cubit/sayici_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, tema) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: tema,
            home: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => CounterBloc(),
                ),
                BlocProvider(
                  create: (context) => SayiciCubit(),
                ),
              ],
              child: MyHomePage(),
            ),
          );
        },
      ),
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
          BlocBuilder<SayiciCubit, SayiciState>(
              builder: (context, SayiciState) {
            return Text(
              SayiciState.deger.toString(),
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
        FloatingActionButton(
          onPressed: () {
            context.read<ThemeCubit>().temaDegistir();
          },
          tooltip: 'Tema Değiştir',
          child: Icon(Icons.brightness_6),
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<SayiciCubit>().arttir();
          },
          tooltip: 'Tema Değiştir',
          child: Icon(Icons.accessibility),
        ),
      ],
    );
  }
}
