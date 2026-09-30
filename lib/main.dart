import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ListView 1-30',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NumberListPage(),
    );
  }
}

class NumberListPage extends StatelessWidget {
  const NumberListPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: const Text('1 到 30 列表'),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    );

    var listView = ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        final number = index + 1;
        return ListTile(title: Text('$number'));
      },
    );

    return Scaffold(appBar: appBar, body: listView);
  }
}
