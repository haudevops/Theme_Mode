import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/provider/counter.dart';
import 'package:provider_learning/provider/theme.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ProviderThemeMode()),
      ChangeNotifierProvider(create: (_) => ProviderCounter()),
    ],
    child: MyApp(),),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Mode',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: context.watch<ProviderThemeMode>().isDark
            ? Brightness.dark
            : Brightness.light,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Mode'),
        actions: [
          Switch(
              value: context.watch<ProviderThemeMode>().isDark,
              onChanged: (newValue) {
                Provider.of<ProviderThemeMode>(context, listen: false).setThemeDark(newValue);
              })
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
