import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learning/provider/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'until/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(
      create: (_) => ProviderThemeMode(isDarkMode: prefs.getBool(Constants.ThemeMode)),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderThemeMode>(
      builder: (context, providerTheme, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: providerTheme.getTheme,
            home: MyHomePage());
      },
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
          IconButton(
            icon: Icon(Icons.brightness_6),
            color: Colors.white,
            onPressed: () {
              Provider.of<ProviderThemeMode>(context, listen: false)
                  .checkTheme();
            },
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
