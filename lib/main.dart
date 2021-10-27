import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/provider/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProviderThemeMode(),
      child: Consumer<ProviderThemeMode>(
        builder: (context, providerTheme, child){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: providerTheme.isDark ? dark : light,
              home: MyHomePage()
          );
        },
      ),
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
                Provider.of<ProviderThemeMode>(context, listen: false).setTheme(newValue);
              }),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
