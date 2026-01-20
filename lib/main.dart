import 'package:course/Repository/banner/banner_provider.dart';
import 'package:course/Repository/mentor_banner/mentorbanner_provider.dart';
import 'package:course/Repository/user/user_provider.dart';
import 'package:course/Repository/cart/cart_provider.dart';
import 'package:course/Screen/no_internet_page.dart';
import 'package:course/library.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:course/config/api_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // .env faylini yuklash
  await dotenv.load(fileName: ".env");

  runApp(
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
            ChangeNotifierProvider(create: (_) => UserProvider()),
            ChangeNotifierProvider(create: (_) => CartProvider()),
          ],
          child: MyApp(),
        );
      },
    ),
  );
}

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
        defaultTransition: Transition.fade,
        transitionDuration: Duration(milliseconds: 300),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()),
          GetPage(name: '/no-internet', page: () => NoInternetPage()),
        ],
        home: SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // Token borligini tekshirish
    final isLoggedIn = await ApiConfig.isLoggedIn();

    // 1 soniya kutish (splash effect uchun)
    await Future.delayed(Duration(seconds: 1));

    // Token bo'lsa Home'ga, yo'q bo'lsa Login'ga
    if (isLoggedIn) {
      Get.offAll(() => NavigatorBar());
    } else {
      Get.offAll(() => LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(53, 114, 237, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 180.w,
              height: 100.h,
              decoration: BoxDecoration(color: Colors.white),
              alignment: Alignment.center,
              child: Text(
                'Logo',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'SemiBold',
                ),
              ),
            ),
            SizedBox(height: 20.h),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
