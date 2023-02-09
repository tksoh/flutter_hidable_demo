import 'package:flutter/material.dart';
import 'package:hidable/hidable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hidable Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hidable Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const startCount = 30;
  int _counter = startCount;
  final scrollController = ScrollController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Hidable(
          controller: scrollController,
          child: AppBar(
            title: Text(widget.title),
            leading: IconButton(
              icon: const Icon(Icons.replay),
              onPressed: () {
                setState(() {
                  _counter = startCount;
                });
              },
              tooltip: 'Reset',
            ),
          ),
        ),
        body: ListView.builder(
          controller: scrollController,
          itemCount: _counter,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(title: Text('Item #${index + 1}')),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
