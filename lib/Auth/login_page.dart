import 'package:course/library.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller = TextEditingController(text: '+998');
  final phoneMask = MaskTextInputFormatter(
    mask: '+998 (##) ###-##-##',
    filter: {"#": RegExp(r'\d')},
    type: MaskAutoCompletionType.lazy,
  );

  String formatPhone(String input) {
    // Masalan input: "999999999"
    if (input.length != 9) return input;

    final code = input.substring(0, 2); // 99
    final part1 = input.substring(2, 5); // 999
    final part2 = input.substring(5, 7); // 99
    final part3 = input.substring(7, 9); // 99

    return '+998 $code $part1 $part2 $part3';
  }

  @override
  Widget build(BuildContext context) {
    Color blue = Color.fromRGBO(53, 114, 237, 1);

    return Stack(
      children: [
        Container(
          width: double.infinity,
          color: blue,
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                SizedBox(height: 50.h),
                // Logo
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
              ],
            ),
          ),
        ),

        // White card part
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6.r,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 60.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Tizimga kirish',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'SemiBold',
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Google button
                  _AuthButton(
                    icon: "google",
                    label: 'Google orqali davom ettirish',
                    onTap: () {},
                  ),
                  SizedBox(height: 18.h),

                  // Apple button
                  _AuthButton(
                    icon: "apple",
                    label: 'Sign up with Apple',
                    onTap: () {},
                  ),
                  SizedBox(height: 18.h),

                  // Divider text
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1.h,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        'Yoki telefon raqam orqali davom ettiring',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Container(
                          height: 1.h,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  // Label
                  Text(
                    'Telefon raqami',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'regular',
                    ),
                  ),
                  SizedBox(height: 8.h),
                  // Phone input
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [phoneMask],
                    cursorColor: Color.fromRGBO(0, 0, 0, 0.8),
                    controller: controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(238, 240, 245, 1),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 16.h,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(238, 240, 245, 1),
                          width: 1.w,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: BorderSide(
                          color: Color.fromRGBO(0, 0, 0, .5),
                          width: 0.5.w,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // Submit button
                  SizedBox(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: () {
                        final raw =
                            phoneMask
                                .getUnmaskedText(); // raqamni maskasiz holatga qaytaradi.
                        Get.to(SmsCodePage(phone: formatPhone(raw)));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Tizimga kirish',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _AuthButton extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback onTap;

  _AuthButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          height: 48.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                blurRadius: 2.r,
                offset: Offset(1, 1),
              ),
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.08),
                blurRadius: 2.r,
                offset: Offset(-1, -1),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/icons/$icon.png")),
                ),
              ),
              SizedBox(width: 12),
              Text(
                label,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: 'Regular',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
