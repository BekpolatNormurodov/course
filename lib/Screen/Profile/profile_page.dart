import 'package:course/library.dart';
import 'package:course/Screen/Profile/change_language.dart';
import 'package:course/config/api_config.dart';
import 'package:course/Repository/user/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  static const _blue = Color.fromRGBO(53, 114, 237, 1);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Load user data when page opens
    Future.microtask(() => context.read<UserProvider>().loadUser());
  }

  Future<void> _pickAndUploadImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        final userProvider = context.read<UserProvider>();
        final success = await userProvider.uploadImage(image.path);

        if (success) {
          Get.snackbar(
            'Muvaffaqiyatli',
            'Rasm yuklandi',
            backgroundColor: Colors.green.shade100,
            colorText: Colors.green.shade900,
            snackPosition: SnackPosition.TOP,
            duration: Duration(seconds: 2),
          );
        } else {
          Get.snackbar(
            'Xatolik',
            'Rasmni yuklashda xatolik',
            backgroundColor: Colors.red.shade100,
            colorText: Colors.red.shade900,
            snackPosition: SnackPosition.TOP,
          );
        }
      }
    } catch (e) {
      Get.snackbar(
        'Xatolik',
        'Rasmni tanlashda xatolik: $e',
        backgroundColor: Colors.red.shade100,
        colorText: Colors.red.shade900,
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final user = userProvider.user;
        final isLoading = userProvider.isLoading;

        return Scaffold(
          backgroundColor: ProfilePage._blue,
          body: Column(
            children: [
              Container(
                height: 225.h,
                width: double.infinity,
                color: ProfilePage._blue,
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 40.h),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset("assets/icons/soundwhite.png"),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child:
                          isLoading
                              ? CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white,
                                ),
                              )
                              : Column(
                                children: [
                                  Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 40.r,
                                        backgroundColor: Colors.white,
                                        backgroundImage:
                                            user?.image != null &&
                                                    user!.image!.isNotEmpty &&
                                                    Uri.tryParse(user.image!) != null
                                                ? NetworkImage(user.image!)
                                                : null,
                                        onBackgroundImageError:
                                            user?.image != null
                                                ? (exception, stackTrace) {
                                                  if (kDebugMode) {
                                                    print(
                                                      'Image load error: $exception',
                                                    );
                                                  }
                                                }
                                                : null,
                                        child: user?.image == null || user!.image!.isEmpty
                                            ? Icon(
                                                Icons.person,
                                                size: 40.sp,
                                                color: Color.fromRGBO(
                                                  53,
                                                  114,
                                                  237,
                                                  1,
                                                ),
                                              )
                                            : null,
                                      ),
                                      Positioned(
                                        right: 0,
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: _pickAndUploadImage,
                                          child: Container(
                                            padding: EdgeInsets.all(4.w),
                                            decoration: BoxDecoration(
                                              color: Color.fromRGBO(
                                                53,
                                                114,
                                                237,
                                                1,
                                              ),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: Colors.white,
                                                width: 2.w,
                                              ),
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              size: 16.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    user?.fullName ?? 'Foydalanuvchi',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22.sp,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'SemiBold',
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    user?.phoneNumber ?? '',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontFamily: 'Regular',
                                    ),
                                  ),
                                ],
                              ),
                    ),
                  ],
                ),
              ),

              /// 2) OQ PANEL (chiplar shu ichida, ko‘kka qisman kirib turadi)
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(18.r),
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 17.h,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: _StatChip(
                                title: 'Samaradorlik',
                                icon: 'raketa',
                                value: '%98',
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: _StatChip(
                                title: 'Yakunlangan\nkurslar',
                                icon: 'school',
                                value: '58',
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: _StatChip(
                                title: 'Yakunlangan\ndarslar',
                                icon: 'checklist',
                                value: '12',
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10.h),

                      /// 3) MENYU LENTASI
                      GestureDetector(
                        onTap: () {
                          if (user != null) {
                            Get.to(() => PersonalDataPage(user: user));
                          }
                        },
                        child: _MenuItem(
                          leadingIcon: "edit",
                          title: "Ma'lumotlarni tahrirlash",
                          page: null,
                        ),
                      ),
                      _ThinDivider(),
                      _MenuItem(
                        leadingIcon: "kurs",
                        title: "Mening kurslarim",
                        page: MyCoursesPage(),
                      ),
                      _ThinDivider(),
                      _MenuItem(
                        leadingIcon: "history",
                        title: "Tranzaksiyalar tarixi",
                        page: TransactionHistoryPage(),
                      ),
                      _ThinDivider(),
                      _MenuItem(
                        leadingIcon: "languageblack",
                        title: "Til",
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "O’zbekcha",
                              style: TextStyle(
                                color: Color.fromRGBO(112, 114, 118, 1),
                                fontSize: 14.sp,
                                fontFamily: 'Regular',
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Icon(
                              Icons.chevron_right,
                              size: 18.sp,
                              color: Color.fromRGBO(159, 166, 178, 1),
                            ),
                          ],
                        ),
                        page: null,
                        onTap: () {
                          showLanguageBottomSheet(context);
                        },
                      ),
                      _ThinDivider(),
                      _MenuItem(
                        leadingIcon: "share",
                        title: "Biz bilan aloqa",
                        page: MyCoursesPage(),
                      ),
                      _ThinDivider(),
                      GestureDetector(
                        onTap: () async {
                          // Confirmation dialog
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                title: Text(
                                  'Chiqish',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                content: Text(
                                  'Akkountdan chiqmoqchimisiz?',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'Regular',
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () => Navigator.pop(context, false),
                                    child: Text(
                                      'Bekor qilish',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed:
                                        () => Navigator.pop(context, true),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromRGBO(
                                        53,
                                        114,
                                        237,
                                        1,
                                      ),
                                    ),
                                    child: Text('Chiqish'),
                                  ),
                                ],
                              );
                            },
                          );

                          if (confirm == true) {
                            // Token'ni o'chirish
                            await ApiConfig.deleteToken();

                            // Login page'ga o'tish (Replace bilan)
                            Get.offAll(() => LoginPage());
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 14.h,
                            horizontal: 14.w,
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Image.asset("assets/icons/exit.png", width: 20.w),
                              SizedBox(width: 16.w),
                              Expanded(
                                child: Text(
                                  "Akkountdan chiqish",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Regular',
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: 20.sp,
                                color: Color.fromRGBO(159, 166, 178, 1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// --- Statistik chip (to‘g‘ri maket: tepa label, pastda ikon + qiymat)
class _StatChip extends StatelessWidget {
  final String title;
  final String value;
  final String icon;

  _StatChip({required this.title, required this.value, required this.icon});

  static const _chipBg = Color.fromRGBO(238, 240, 245, 1);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: _chipBg,
        borderRadius: BorderRadius.circular(18.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Label (kichik, kulrang)
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.black,
              fontFamily: 'Regular',
              fontWeight: FontWeight.w500,
            ),
          ),

          /// Pastki qatorda: ikon + qiymat
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/icons/$icon.png", width: 20.w),
              SizedBox(width: 6.w),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(45, 52, 56, 1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// --- Menyu bandi (leading ikon mayda, kulrang doira ichida)
class _MenuItem extends StatelessWidget {
  final String leadingIcon;
  final String title;
  final Widget? trailing;
  final page;
  final VoidCallback? onTap;

  _MenuItem({
    required this.leadingIcon,
    required this.title,
    required this.page,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? (page != null ? () => Get.to(page) : null),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
        alignment: Alignment.center,
        child: Row(
          children: [
            Image.asset("assets/icons/$leadingIcon.png", width: 20.w),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Color.fromRGBO(0, 0, 0, 1),
                  fontFamily: 'Regular',
                ),
              ),
            ),
            trailing ??
                Icon(
                  Icons.chevron_right,
                  size: 20.sp,
                  color: Color.fromRGBO(159, 166, 178, 1),
                ),
          ],
        ),
      ),
    );
  }
}

class _ThinDivider extends StatelessWidget {
  _ThinDivider();

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: Color(0xFFE7EBF0));
  }
}
