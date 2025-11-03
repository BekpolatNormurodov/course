import 'package:course/library.dart';

class SotibOlishPage extends StatefulWidget {
  SotibOlishPage({super.key});

  @override
  State<SotibOlishPage> createState() => _SotibOlishPageState();
}

class _SotibOlishPageState extends State<SotibOlishPage> {
  String? selectedProvider;

  @override
  void initState() {
    super.initState();
    selectedProvider = 'payme'; // default tanlov (xohlasangiz null qiling)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70.h,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
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
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 18.sp,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        title: Text(
          'Sotib olish',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            8.h.verticalSpace,
            _productCard(),
            30.h.verticalSpace,
            Text(
              "To‘lov tizimini tanlang",
              style: TextStyle(
                fontSize: 18.sp,
                color: Color.fromRGBO(13, 20, 39, 1),
                fontWeight: FontWeight.w600,
                letterSpacing: 0,
              ),
            ),
            18.h.verticalSpace,
            _paymentTile(
              titleLeft: "Uzum bank",
              providerKey: "payme",
              rightIconPath: "assets/icons/payme.png",
            ),
            10.h.verticalSpace,
            _paymentTile(
              titleLeft: "Click",
              providerKey: "click",
              rightIconPath: "assets/icons/click.png",
            ),
            10.h.verticalSpace,
            _paymentTile(
              titleLeft: "Uzum bank",
              providerKey: "uzum",
              rightIconPath: "assets/icons/uzum.png",
            ),
            Spacer(),
            _totalAndButton(),
            20.h.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _productCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xFFE5E7EB)),
        boxShadow: [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 10.r,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              'assets/images/kursbanner.png',
              width: 64.w,
              height: 64.w,
              fit: BoxFit.cover,
            ),
          ),
          12.w.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sardor Qodirov",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Color(0xFF6B7280),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                2.h.verticalSpace,
                Text(
                  "Figma'ni tezda o‘rganing",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                6.h.verticalSpace,
                Text(
                  "1 200 000 UZS",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2563EB),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _paymentTile({
    required String titleLeft,
    required String providerKey,
    required String rightIconPath,
  }) {
    final bool isSelected = selectedProvider == providerKey;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isSelected ? Color(0xFF2563EB) : Color(0xFFE5E7EB),
          width: isSelected ? 1.2 : 1.0,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.r),
        onTap: () => setState(() => selectedProvider = providerKey),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Row(
            children: [
              // Radio + left title
              Container(
                width: 22.w,
                height: 22.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected ? Color(0xFF2563EB) : Color(0xFFD1D5DB),
                    width: 2,
                  ),
                ),
                alignment: Alignment.center,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 180),
                  width: isSelected ? 12.w : 0,
                  height: isSelected ? 12.w : 0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF2563EB),
                  ),
                ),
              ),
              10.w.horizontalSpace,
              Expanded(
                child: Text(
                  titleLeft,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
              // Right icon from assets (o'ng tomonda)
              SizedBox(
                height: 22.w,
                child: Image.asset(rightIconPath, fit: BoxFit.contain),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _totalAndButton() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            children: [
              Text(
                "Umumiy to‘lov",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color.fromRGBO(95, 100, 110, 1),
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Regular',
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    "280 000",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Color(0xFF2563EB),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    " so'm",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 18.h),
        // Saqlash
        SizedBox(
          width: double.infinity,
          height: 48.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromRGBO(53, 114, 237, 1),
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 14.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
            ),
            onPressed: () {
              // Tanlangan tilni shu yerda qo‘llang:
              // Get.updateLocale(_selected);
              Navigator.pop(context);
            },
            child: Text(
              "Davom etish",
              style: GoogleFonts.rubik(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                letterSpacing: 0,
                height: 1.4,
              ),
            ),
          ),
        ),

        SizedBox(height: 34.h),
      ],
    );
  }
}
