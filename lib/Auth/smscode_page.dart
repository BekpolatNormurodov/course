import 'package:course/library.dart';

class SmsCodePage extends StatefulWidget {
  final String phone;
  SmsCodePage({super.key, required this.phone});

  @override
  State<SmsCodePage> createState() => _SmsCodePageState();
}

class _SmsCodePageState extends State<SmsCodePage> {
  final _pinController = TextEditingController();
  final _focusNode = FocusNode();

  static int initialSeconds = 179;
  int secondsLeft = initialSeconds;
  Timer? _timer;

  void startCountdown() {
    _timer?.cancel();
    setState(() => secondsLeft = initialSeconds);

    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      if (secondsLeft <= 1) {
        t.cancel();
        setState(() => secondsLeft = 0);
      } else {
        setState(() => secondsLeft--);
      }
    });
  }

  Future<void> sendSmsAgain() async {
    startCountdown();
  }

  String format(int totalSeconds) {
    final m = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final s = (totalSeconds % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  @override
  void initState() {
    super.initState();
    startCountdown(); // sahifa ochilganda sanashni boshlaydi
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color blue = Color(0xFF2E6CF6);

    // Pinput bezaklari (rasmga mos yumaloqlik va rang)
    final defaultPinTheme = PinTheme(
      width: 48.w,
      height: 48.w,
      textStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        fontFamily: 'Regular',
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(238, 240, 245, 1),
      ),
    );

    final canResend = secondsLeft == 0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80.h,
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 64.w,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            alignment: Alignment.center,
            child: Container(
              width: 34.w,
              height: 34.w,
              decoration: BoxDecoration(
                color: Color.fromRGBO(238, 240, 245, 1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
              alignment: Alignment.center,
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.sp,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        title: Text(
          'Tasdiqlash',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 60.h),
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.phone,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                    letterSpacing: 0.2.w,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Ushbu telefon raqamiga 6 sonli kod yuborildi, ushbu kodni kiriting va telefon raqamingizni tasdiqlang!',
                  style: TextStyle(
                    fontSize: 14.sp,
                    height: 1.5.h,
                    color: Color(0xFF495057),
                    fontFamily: 'Regular',
                  ),
                ),
                SizedBox(height: 80.h),

                // “Kodini kiriting” sarlavha
                Center(
                  child: Text(
                    'Kodini kiriting',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: 'Regular',
                      color: Color.fromRGBO(107, 112, 115, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),

                // 6 ta OTP katak
                Center(
                  child: Pinput(
                    length: 6,
                    controller: _pinController,
                    focusNode: _focusNode,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyDecorationWith(
                      border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.5),
                        width: 0.8.w,
                      ),
                      color: Color.fromRGBO(238, 240, 245, 1),
                    ),
                    submittedPinTheme: defaultPinTheme,
                    separatorBuilder: (index) => SizedBox(width: 12.w),
                    showCursor: true,
                    keyboardType: TextInputType.number,
                    preFilledWidget: Text(
                      "0",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        fontFamily: 'Regular',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),

                // Taymer
                !canResend
                    ? Center(
                      child: Text(
                        format(secondsLeft),
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Regular',
                        ),
                      ),
                    )
                    : Center(
                      child: GestureDetector(
                        onTap: canResend ? sendSmsAgain : null,
                        child: Text(
                          'Qayta yuborish',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(53, 114, 237, 1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 54.h,
                  child: ElevatedButton(
                    onPressed: () => Get.to(AsosiyPage()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Davom etttish',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),

                // Ikkinchi kulrang tugma
                SizedBox(
                  width: double.infinity,
                  height: 54.h,
                  child: TextButton(
                    onPressed: () => Get.back(),
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xFFF1F3F6),
                      foregroundColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                      textStyle: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.arrow_back,
                          size: 20.sp,
                          color: Colors.black87,
                        ),
                        Text(
                          'Boshqa raqam kiritish',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Regular',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
