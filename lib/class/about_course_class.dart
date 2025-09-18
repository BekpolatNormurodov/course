import 'package:course/library.dart';

class TabChip extends StatelessWidget {
  final String label;
  final bool active;
  TabChip({required this.label, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 6.w, bottom: 18.h),
      width: 100.w,
      height: 38.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? Color.fromRGBO(53, 114, 237, 1) : Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14.sp,
          color:
              active
                  ? Color.fromRGBO(253, 254, 255, 1)
                  : Color.fromRGBO(27, 29, 36, 1),
        ),
      ),
    );
  }
}

class TabChipItem {
  about(context, theme) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h, left: 16.w, right: 16.w, bottom: 24.h),
      child: Column(
        children: [
          // About text
          Text(
            "Ushbu kurs davomida siz dasturni o'rnatishdan tortib, so'nggi trenddagi dizaynlarni tayyorlashni o'rganib olasiz. Barcha videolarni ko'rib, o'rgangan olganlaringizdan so'ng bemalol pulli buyurtmalarni qabul qilishga mumkin",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 24.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bu kursda nimalarni o\'rganasiz?',
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 14.h),
              _CheckLine(text: 'Photoshop asoslarini bilib olasiz'),
              _CheckLine(text: 'SMM dizayn tayyorlay olasiz'),
              _CheckLine(text: 'Grafik dizayn bilan ishlay olasiz'),
              _CheckLine(text: 'Va barcha dizayn ishlarini qila olasiz'),
            ],
          ),
          SizedBox(height: 6.h),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bu kursda nimalarni o\'rganasiz?',
                style: theme.textTheme.titleMedium,
              ),
              SizedBox(height: 12.h),
              _BulletLine(text: 'Kompyuter'),
              _BulletLine(text: 'Ishlatyoq'),
              _BulletLine(text: 'Internet'),
            ],
          ),
        ],
      ),
    );
  }

  themes() {
    return SizedBox(
      height: 400.h,
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 14.w),
            decoration: BoxDecoration(
              color: Color.fromRGBO(253, 254, 255, 1),
              borderRadius: BorderRadius.circular(5.r),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  color: Color.fromRGBO(0, 0, 0, 0.18),
                  blurRadius: 6.r,
                ),
              ],
            ),
            child: ExpansionTile(
              initiallyExpanded: false,
              tilePadding: EdgeInsets.symmetric(horizontal: 18.w),
              controlAffinity: ListTileControlAffinity.platform,
              childrenPadding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
              ),
              collapsedShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
              ),
              title: Container(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${index + 1}. Poligrafiya uchun dizayn",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(4, 21, 66, 1),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/book.png",
                          color: Color.fromRGBO(179, 179, 179, 1),
                          width: 18.w,
                          height: 18.h,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "23 ta dars",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Regular',
                            color: Color.fromRGBO(57, 60, 67, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Image.asset(
                          "assets/icons/clock.png",
                          width: 18.w,
                          height: 18.h,
                          color: Color.fromRGBO(179, 179, 179, 1),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          "14:40min",
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: 'Regular',
                            color: Color.fromRGBO(57, 60, 67, 1),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              children: [
                SizedBox(
                  height: 312.h,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, i) {
                      return _buildTile(
                        title: "Umumiy qoidalar",
                        duration: "01:10",
                        index: i,
                        isActive: i == 0 ? true : false,
                        isLocked: true,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  izohlar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ⭐ Umumiy reyting
        SizedBox(
          height: 400.h,
          child: ListView.separated(
            itemCount: 10,
            itemBuilder: (context, index) {
              return index == 0
                  ? Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 24.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(.5, .5),
                          color: Color.fromRGBO(0, 0, 0, 0.12),
                          blurRadius: 7.r,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 12.h,
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 18.w,
                            vertical: 10.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(253, 254, 255, 1),
                            borderRadius: BorderRadius.circular(12.r),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(.5, .5),
                                color: Color.fromRGBO(0, 0, 0, 0.12),
                                blurRadius: 7.r,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              // Reyting soni
                              Text(
                                "5",
                                style: TextStyle(
                                  fontSize: 52.sp,
                                  color: Color.fromRGBO(4, 21, 66, 1),
                                  fontFamily: 'Regular',
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              SizedBox(width: 16.w),
                              // Yulduzchalar va matn
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Kurs reytingi",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Color.fromRGBO(165, 166, 168, 1),
                                      fontFamily: 'Regular'
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Row(
                                    children: List.generate(
                                      5,
                                      (index) => Icon(
                                        Icons.star,
                                        color: Color.fromRGBO(253, 208, 50, 1),
                                        size: 18.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 12.w,
                            right: 32.w,
                            top: 6.h,
                            bottom: 12.h,
                          ),
                          child: Column(
                            children: [
                              _buildRatingRow("5 baho", 22),
                              _buildRatingRow("4 baho", 0),
                              _buildRatingRow("3 baho", 0),
                              _buildRatingRow("2 baho", 0),
                              _buildRatingRow("1 baho", 0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                  : Container();
            },
            separatorBuilder: (context, index) {
              return _buildReviewCard(
                name: "Sherzod Burhonov",
                date: "17.10.2021, 23:35",
                comment:
                    "O‘zi boshlang‘ich bilimni Telegram kanalidagi videolardan o‘rganganman. "
                    "Bugun shu kursni sotib olish nasib qilgan ekan. Hali kursni tugatganim yo‘q, "
                    "lekin qolganlarga ham sotib olishni tavsiya qilaman.",
              );
            },
          ),
        ),
      ],
    );
  }
}

class _CheckLine extends StatelessWidget {
  _CheckLine({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.h),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 22.sp,
            color: Color.fromRGBO(82, 125, 236, 1),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                color: Color.fromRGBO(95, 100, 110, 1),
                fontFamily: 'Regular',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletLine extends StatelessWidget {
  _BulletLine({required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          Icon(Icons.star, size: 10.sp, color: Color.fromRGBO(229, 0, 0, 1)),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14.sp,
                color: Color.fromRGBO(95, 100, 110, 1),
                fontFamily: 'Regular',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTile({
  required String title,
  required String duration,
  required int index,
  bool isActive = false,
  bool isLocked = true,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Color.fromRGBO(241, 239, 239, 1), width: 2.w),
        top:
            index == 0
                ? BorderSide(
                  color: Color.fromRGBO(241, 239, 239, 1),
                  width: 2.w,
                )
                : BorderSide(width: 0, color: Colors.transparent),
      ),
    ),
    child: Row(
      children: [
        Image.asset(
          isActive ? "assets/icons/openvideo.png" : "assets/icons/lock.png",
          width: isActive ? 18.w : 16.2.w,
          height: 18.h,
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Regular',
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(95, 100, 110, 1),
            ),
          ),
        ),
        Text(
          duration,
          style: TextStyle(
            fontSize: 12.sp,
            color: Color.fromRGBO(165, 166, 168, 1),
            fontFamily: 'Regular',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

// 📊 Reyting chiziqlari
Widget _buildRatingRow(String label, int count) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 7.5.h),
    child: Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color.fromRGBO(4, 21, 66, 1),
            fontFamily: 'Regular',
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: LinearProgressIndicator(
            value: count / 22, // faqat 22 ta review
            color:
                count > 0
                    ? Color.fromRGBO(253, 208, 50, 1)
                    : Color.fromRGBO(233, 238, 251, 1),
            backgroundColor: Colors.grey.shade200,
            minHeight: 12.h,
            borderRadius: BorderRadius.circular(5.r),
          ),
        ),
        Container(
          width: 32.w,
          margin: EdgeInsets.only(left: 10.w),
          child: Text(
            count > 0 ? "$count ta" : '',
            style: TextStyle(
              color: Color.fromRGBO(4, 21, 66, 1),
              fontFamily: 'Regular',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}

// 💬 Bitta sharh kartasi
Widget _buildReviewCard({
  required String name,
  required String date,
  required String comment,
}) {
  return Container(
    margin: EdgeInsets.only(bottom: 30.h, left: 16.w, right: 16.w),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundColor: Color.fromRGBO(219, 239, 254, 1),
              child: Image.asset(
                "assets/icons/person.png",
                width: 30.w,
                height: 30.h,
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Regular',
                    color: Color.fromRGBO(13, 20, 39, 1),
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: Color.fromRGBO(165, 166, 168, 1),
                    fontSize: 12.sp,
                    fontFamily: 'Regular',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Text(
          comment,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Regular',
            color: Color.fromRGBO(58, 59, 61, 1),
            fontSize: 14.sp,
            height: 1.5,
          ),
        ),
        SizedBox(height: 10.h),
        RatingBarIndicator(
          rating: 5,
          itemBuilder:
              (context, index) =>
                  Icon(Icons.star, color: Color.fromRGBO(253, 208, 50, 1)),
          itemCount: 5,
          itemSize: 20.0.sp,
        ),
      ],
    ),
  );
}
