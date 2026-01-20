import 'dart:async';
import 'package:course/library.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NoInternetPage extends StatefulWidget {
  const NoInternetPage({super.key});

  @override
  State<NoInternetPage> createState() => _NoInternetPageState();
}

class _NoInternetPageState extends State<NoInternetPage> {
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    // Listen to connectivity changes
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> result,
    ) {
      if (result.contains(ConnectivityResult.mobile) ||
          result.contains(ConnectivityResult.wifi)) {
        // Internet qayta paydo bo'ldi, avtomatik orqaga qayt
        if (mounted) {
          Get.back();
        }
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _checkConnection(BuildContext context) async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      // Internet bor, orqaga qayt
      Get.back();
    } else {
      // Hali ham yo'q
      Get.snackbar(
        'Internet yo\'q',
        'Iltimos, internetni yoqing',
        backgroundColor: Colors.orange.shade100,
        colorText: Colors.orange.shade900,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // No Internet Icon/Image
                Icon(
                  Icons.wifi_off_rounded,
                  size: 120.sp,
                  color: Color.fromRGBO(53, 114, 237, 1),
                ),
                SizedBox(height: 40.h),

                // Title
                Text(
                  'Internet yo\'q',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SemiBold',
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                SizedBox(height: 12.h),

                // Description
                Text(
                  'Internet aloqasi yo\'q. Iltimos, internetni tekshiring va qayta urinib ko\'ring.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontFamily: 'Regular',
                    color: Color.fromRGBO(112, 114, 118, 1),
                    height: 1.5,
                  ),
                ),
                SizedBox(height: 40.h),

                // Retry Button
                GestureDetector(
                  onTap: () => _checkConnection(context),
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(53, 114, 237, 1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Qayta urinish',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'SemiBold',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
