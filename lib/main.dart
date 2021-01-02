
import 'package:code_track/Utils/ThemeManager.dart';
import 'package:code_track/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
      create: (_)=> ThemeNotifier(),

    child: MyApp(),
  ));
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context ,theme , _)=> MaterialApp(
        title: 'Code Management',
        debugShowCheckedModeBanner: false,
        theme: theme.getTheme(),
        home: HomePage(),
      ),
    );
  }
}
