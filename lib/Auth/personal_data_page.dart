import 'package:course/library.dart';
import 'package:course/Repository/user/user_model.dart';
import 'package:course/Repository/user/user_provider.dart';
import 'package:course/config/api_config.dart';
import 'package:provider/provider.dart';

class PersonalDataPage extends StatefulWidget {
  final UserModel? user;
  final bool isFromLogin;

  const PersonalDataPage({super.key, this.user, this.isFromLogin = false});

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  late TextEditingController nameController;
  late TextEditingController surnameController;
  late TextEditingController dateController;
  late String gender;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user?.firstName ?? '');
    surnameController = TextEditingController(
      text: widget.user?.lastName ?? '',
    );

    // Format birth date from yyyy-MM-dd to dd.MM.yyyy
    String formattedDate = '';
    if (widget.user?.birthDate != null && widget.user!.birthDate!.isNotEmpty) {
      try {
        final parts = widget.user!.birthDate!.split('-');
        if (parts.length == 3) {
          formattedDate = '${parts[2]}.${parts[1]}.${parts[0]}';
        }
      } catch (e) {
        formattedDate = '';
      }
    }
    dateController = TextEditingController(text: formattedDate);

    gender = widget.user?.gender ?? "Erkak";
  }

  @override
  void dispose() {
    nameController.dispose();
    surnameController.dispose();
    dateController.dispose();
    super.dispose();
  }

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
      appBar:
          widget.isFromLogin
              ? null
              : AppBar(
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.white,
                toolbarHeight: 70.h,
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
                      margin: EdgeInsets.symmetric(
                        vertical: 8.h,
                        horizontal: 8.w,
                      ),
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
                  "Ma'lumotlarni tahrirlash",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              if (widget.isFromLogin) ...[
                Text(
                  "Shaxsiy ma'lumotlar",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(13, 20, 39, 1),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Barcha shaxsiy ma'lumotlaringizni kiriting",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color.fromRGBO(57, 60, 67, 1),
                  ),
                ),
                SizedBox(height: 24.h),
              ],
              if (!widget.isFromLogin) SizedBox(height: 10.h),
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
                  onPressed: _isLoading ? null : _updateUserData,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(53, 114, 237, 1),
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                  ),
                  child:
                      _isLoading
                          ? SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                          : Text(
                            widget.isFromLogin ? "Yakunlash" : "Saqlash",
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

  Future<void> _updateUserData() async {
    setState(() => _isLoading = true);

    try {
      if (widget.isFromLogin) {
        // Login flow: just save token and go to home (no PATCH)
        await ApiConfig.saveToken(await ApiConfig.getToken());

        Get.snackbar(
          'Muvaffaqiyatli',
          'Ma\'lumotlar saqlandi',
          backgroundColor: Colors.green.shade100,
          colorText: Colors.green.shade900,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 2),
        );

        // Small delay to show the snackbar
        await Future.delayed(Duration(milliseconds: 500));
        Get.offAll(() => NavigatorBar());
      } else {
        // Edit mode: PATCH to update user data using provider
        // Convert dd.MM.yyyy to yyyy-MM-dd
        String? birthDate;
        if (dateController.text.isNotEmpty) {
          try {
            final parts = dateController.text.split('.');
            if (parts.length == 3) {
              birthDate = '${parts[2]}-${parts[1]}-${parts[0]}';
            }
          } catch (e) {
            birthDate = null;
          }
        }

        final userProvider = context.read<UserProvider>();
        final success = await userProvider.updateUser(
          firstName: nameController.text.trim(),
          lastName: surnameController.text.trim(),
          birthDate: birthDate,
          gender: gender,
        );

        if (success) {
          Get.snackbar(
            'Muvaffaqiyatli',
            'Ma\'lumotlar saqlandi',
            backgroundColor: Colors.green.shade100,
            colorText: Colors.green.shade900,
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 2),
          );
          // Go back to profile after 2 seconds
          await Future.delayed(Duration(seconds: 2));
          Get.back();
        } else {
          Get.snackbar(
            'Xatolik',
            'Ma\'lumotlarni yangilashda xatolik',
            backgroundColor: Colors.red.shade100,
            colorText: Colors.red.shade900,
            snackPosition: SnackPosition.TOP,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        'Xatolik',
        'Ma\'lumotlarni yangilashda xatolik: $e',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
