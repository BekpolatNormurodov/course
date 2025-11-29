import 'package:course/Repository/banner/banner_provider.dart';
import 'package:course/Repository/mentor%20banner/mentorbanner_provider.dart';
import 'package:course/library.dart';

void main() => runApp(
  ScreenUtilInit(
    designSize: Size(375, 812),
    builder: (context, child) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CoursesProvider(CoursesService()),
          ),
          ChangeNotifierProvider(
            create: (_) => CourseIdProvider(CourseIdService()),
          ),
          ChangeNotifierProvider(create: (_) => BannerProvider()),
          ChangeNotifierProvider(create: (_) => MentorBannerProvider()),
        ],
        child: MyApp(),
      );
    },
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
        ),
        home: NavigatorBar(),
      ),
    );
  }
}
