import 'package:course/library.dart';

class PersonalDataPage extends StatefulWidget {
  const PersonalDataPage({super.key});

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  String gender = "Ayol";
  // mask: dd.MM.yyyy
  final maskFormatter = MaskTextInputFormatter(
    mask: '##.##.####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      String day = picked.day.toString().padLeft(2, '0');
      String month = picked.month.toString().padLeft(2, '0');
      String year = picked.year.toString();
      setState(() {
        dateController.text = "$day.$month.$year";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                "Shaxsiy ma’lumotlar",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(13, 20, 39, 1),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Barcha shaxsiy ma’lumotlaringizni kiriting",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color.fromRGBO(57, 60, 67, 1),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                "Ism",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color.fromRGBO(13, 20, 39, 1),
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Ismingizni kiriting",
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    fontFamily: 'Regular',
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(238, 240, 245, 1),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                "Familiya",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color.fromRGBO(13, 20, 39, 1),
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: surnameController,
                decoration: InputDecoration(
                  hintText: "Familiyangizni kiriting",
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    fontFamily: 'Regular',
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(238, 240, 245, 1),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 14.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              SizedBox(height: 24.h),
              Text(
                "Tug’ilgan sana",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color.fromRGBO(13, 20, 39, 1),
                ),
              ),
              SizedBox(height: 10.h),

              TextFormField(
                controller: dateController,
                inputFormatters: [maskFormatter],
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 16.sp, fontFamily: 'Regular'),
                decoration: InputDecoration(
                  hintText: "dd.mm.yyyy",
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    fontFamily: 'Regular',
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(238, 240, 245, 1),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 18.h,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.calendar_month_outlined,
                      size: 24.sp,
                      color: Color.fromRGBO(95, 99, 104, 1),
                    ),
                    onPressed: _pickDate,
                  ),
                ),
              ),

              SizedBox(height: 24.h),
              Text(
                "Jins",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Color.fromRGBO(13, 20, 39, 1),
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => gender = "Erkak");
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        decoration: BoxDecoration(
                          color:
                              gender == "Erkak"
                                  ? Color.fromRGBO(53, 114, 237, 1)
                                  : Color.fromRGBO(238, 240, 245, 1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Erkak",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color:
                                gender == "Erkak" ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() => gender = "Ayol");
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15.h),
                        decoration: BoxDecoration(
                          color:
                              gender == "Ayol"
                                  ? Color.fromRGBO(53, 114, 237, 1)
                                  : Color.fromRGBO(238, 240, 245, 1),

                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "Ayol",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color:
                                gender == "Ayol" ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(),

              // Yakunlash button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Ma'lumotlarni qayta ishlash
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(53, 114, 237, 1),
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                  child: Text(
                    "Yakunlash",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
