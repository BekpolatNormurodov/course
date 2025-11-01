import 'package:course/library.dart';

class TransactionHistoryPage extends StatelessWidget {
  TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          'Tranzaksiyalar tarixi',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          // 🔽 Filter bottom sheet shu yerda ochiladi
          GestureDetector(
            onTap: () async {
              final res = await showFilterBottomSheet(
                context,
                initialDate: DateTime.now(),
              );
              if (res != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Filtr qo‘llandi: "
                      "${res.tolovTuri == null ? 'Tanlanmagan' : res.tolovTuri!.name} — "
                      "${res.sana != null ? _fmtDate(res.sana!) : 'sana tanlanmagan'}",
                    ),
                  ),
                );
              }
            },
            child: Image.asset(
              "assets/icons/filtr.png",
              width: 22.w,
              height: 22.w,
            ),
          ),
          SizedBox(width: 14.w),
        ],
      ),
      body: _ListTile(),
      backgroundColor: Colors.white,
    );
  }
}

/// =======================
/// LIST
/// =======================
class _ListTile extends StatelessWidget {
  _ListTile();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
        itemCount: 20,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 2.h),
        itemBuilder: (context, index) {
          return Container(
            height: 56.h,
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 6.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Color.fromRGBO(253, 254, 255, 1),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 3.r,
                  color: Color.fromRGBO(0, 0, 0, 0.12),
                ),
              ],
            ),
            child: ListTile(
              minTileHeight: 56.h,
              tileColor: Colors.transparent,
              contentPadding: EdgeInsets.symmetric(horizontal: 8.w),
              leading: Image.asset("assets/images/payme.png"),
              title: Text(
                "Java dasturlash tili asoslari",
                style: GoogleFonts.rubik(
                  color: Color.fromRGBO(13, 20, 39, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  letterSpacing: 0,
                ),
              ),
              subtitle: Text(
                "28 - Oktyabr, 2024",
                style: GoogleFonts.rubik(
                  color: Color.fromRGBO(13, 20, 39, 0.6),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
              trailing: Text(
                "-100 000 UZS",
                style: GoogleFonts.rubik(
                  color: Color.fromRGBO(13, 20, 39, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                  letterSpacing: 0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// =======================
/// FILTER BOTTOM SHEET
/// =======================
/// Chaqarish:
/// final res = await showFilterBottomSheet(context,
///   initialType: TolovTuri.barchasi,
///   initialDate: DateTime.now(),
/// );
Future showFilterBottomSheet(
  BuildContext context, {
  DateTime? initialDate,
}) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: false,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder:
        (ctx) =>
            _FilterSheet(initialDate: initialDate),
  );
}

class _FilterSheet extends StatefulWidget {
  _FilterSheet({this.initialDate});
  final DateTime? initialDate;

  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _date;
  late final TextEditingController _dateCtrl;

  String? selectedProvider;
  final List<String> _providers = ['Payme', 'Click', 'Anor'];

  @override
  void initState() {
    super.initState();
    _date = widget.initialDate;
    _dateCtrl = TextEditingController(
      text: _date != null ? _fmtDate(_date!) : '',
    );
  }

  @override
  void dispose() {
    _dateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration fieldDec(String hint, {Widget? suffixIcon}) {
      return InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.rubik(fontSize: 14.sp, color: Color(0x990D1427)),
        filled: true,
        fillColor: Color(0xFFF3F5F7),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
      );
    }

    Future<void> pickDate() async {
      final now = DateTime.now();
      final picked = await showDatePicker(
        context: context,
        initialDate: _date ?? now,
        firstDate: DateTime(2000),
        lastDate: DateTime(now.year + 5),
        helpText: 'Sana tanlang',
        builder:
            (c, child) => Theme(
              data: Theme.of(c).copyWith(
                colorScheme: ColorScheme.light(primary: Color(0xFF2E6CF6)),
              ),
              child: child!,
            ),
      );
      if (picked != null) {
        setState(() {
          _date = picked;
          _dateCtrl.text = _fmtDate(picked);
        });
      }
    }

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 60.h),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Filterlash",
                    style: GoogleFonts.rubik(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0,
                      color: Colors.black,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.close,
                    color: Color.fromRGBO(255, 10, 10, 1),
                  ),
                ),
              ],
            ),
            SizedBox(height: 18.h),

            // To'lov turi
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "To’lov turi",
                style: GoogleFonts.rubik(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                  color: Color.fromRGBO(13, 20, 39, 1),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            DropdownButtonFormField<String?>(
              dropdownColor: Colors.grey.shade200,
              value: null,
              isExpanded: true,
              decoration: fieldDec("To'lov provayderi"),
              icon: Icon(Icons.keyboard_arrow_down_rounded),
              hint: Text(
                "Tanlang",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: 'Regular',
                  letterSpacing: 0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              items: <DropdownMenuItem<String?>>[
                ..._providers.map(
                  (p) => DropdownMenuItem<String?>(value: p, child: Text(p)),
                ),
              ],
              onChanged: (v) {
                setState(() => selectedProvider = v);
                // kerak bo‘lsa: print('Tanlangan: $v');
              },
            ),
            SizedBox(height: 24.h),

            // Sana
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sana",
                style: GoogleFonts.rubik(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0,
                  color: Color.fromRGBO(13, 20, 39, 1),
                ),
              ),
            ),
            SizedBox(height: 6.h),
            TextFormField(
              controller: _dateCtrl,
              readOnly: true,
              onTap: pickDate,
              decoration: fieldDec(
                "dd.MM.yyyy",
                suffixIcon: Icon(
                  Icons.calendar_month_outlined,
                  color: Color.fromRGBO(95, 99, 104, 1),
                ),
              ),
            ),
            SizedBox(height: 24.h),

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
                  Navigator.pop(context);
                },
                child: Text(
                  "Saqlash",
                  style: GoogleFonts.rubik(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0,
                    height: 1.4,
                  ),
                ),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      ),
    );
  }
}

/// Sana formatlovchi (intl’siz)
String _fmtDate(DateTime d) {
  String two(int x) => x.toString().padLeft(2, '0');
  return "${two(d.day)}.${two(d.month)}.${d.year}";
}
