import 'package:flutter/material.dart';
import 'package:flutter_learn_bloc_cubit/cubit/counter_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counter=CounterCubit();


  @override
  Widget build(BuildContext context) {
      final counterstate=counter.state;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: (Color(0xFF009688)),
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(   
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterCubit, int>(
              bloc: counter,
              builder: (context,counterstate) {
                return Text(
                '$counterstate',
                style: Theme.of(context).textTheme.headlineMedium,
              );
              },
              
            ),
              
            
          ],
        ),
      ),
      floatingActionButton: 
          FloatingActionButton(
        onPressed: (){
          counter.increment();
          print(counterstate);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    
      
    );
  }
}
