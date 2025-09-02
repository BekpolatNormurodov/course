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

  // taymer ko‘rinishi (demo uchun 00:00)
  String timerText = '00:00';

  @override
  void dispose() {
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
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black87,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color.fromRGBO(238, 240, 245, 1),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 56.w,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFF3F4F6),
                borderRadius: BorderRadius.circular(10.r),
              ),
              margin: EdgeInsets.symmetric(vertical: 8.h),
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
                SizedBox(height: 36.h),

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
                SizedBox(height: 12.h),

                // 6 ta OTP katak
                Center(
                  child: Pinput(
                    obscuringWidget: Text("p"),
                    length: 6,
                    controller: _pinController,
                    focusNode: _focusNode,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyDecorationWith(
                      border: Border.all(color: blue, width: 1.2.w),
                      color: Color.fromRGBO(238, 240, 245, 1),
                    ),
                    submittedPinTheme: defaultPinTheme,
                    separatorBuilder: (index) => SizedBox(width: 12.w),
                    showCursor: true,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: 16.h),

                // Taymer
                Center(
                  child: Text(
                    timerText,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ),

                // Davom ettish tugmasi (ko‘k, pill rounded)
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
                          style: TextStyle(fontSize: 16.sp, fontFamily: 'Regular', fontWeight: FontWeight.w500),
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
