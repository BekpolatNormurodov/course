import 'package:course/library.dart';

void main() => runApp(
  ScreenUtilInit(
    designSize: Size(375, 812),
    builder: (context, child) => MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Course',
      theme: ThemeData(
        textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
      ),
      home: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
          useMaterial3: true,
        ),
        home: NavigatorBar(),
      ),
    );
  }
}
