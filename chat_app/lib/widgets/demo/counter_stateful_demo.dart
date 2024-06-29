import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {
  Color buttonColor; // widget variable

  CounterStateful({super.key, required this.buttonColor});

  @override
  State<CounterStateful> createState() {
    State<CounterStateful> stateAssociatedWithThisWidget =
        _CounterStatefulState();
    return stateAssociatedWithThisWidget;
  }
}

class _CounterStatefulState extends State<CounterStateful> {
  int counter = 0; // State Variable

  void increment() {
    if (mounted) {
      // mounted is better before setState to avoid runtime crashes
      setState(() {
        counter++;
      });
    }
    print(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: widget.buttonColor,
          child: Icon(Icons.add),
          onPressed: () {
            increment();
          }),
      body: Center(
        child: Text(
          '$counter',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
