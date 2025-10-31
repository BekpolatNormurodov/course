import 'package:course/library.dart';

/// =======================
/// Model
/// =======================
class Transaction {
  final String title;
  final DateTime date;
  final int amount; // manfiy = chiqim, musbat = kirim
  final String provider; // masalan: Payme, Click

  Transaction({
    required this.title,
    required this.date,
    required this.amount,
    required this.provider,
  });
}

/// =======================
/// Filter enums & result
/// =======================
enum TolovTuri { barchasi, kirim, chiqim }

class FilterResult {
  final TolovTuri? tolovTuri;
  final DateTime? sana;

  const FilterResult({this.tolovTuri, this.sana});

  @override
  String toString() => 'FilterResult(tolovTuri: $tolovTuri, sana: $sana)';
}

/// Sana formatlovchi (intl’siz)
String _fmtDate(DateTime d) {
  String two(int x) => x.toString().padLeft(2, '0');
  return "${two(d.day)}.${two(d.month)}.${d.year}";
}

class TransactionHistoryApp extends StatelessWidget {
  TransactionHistoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true),
        home: TransactionHistoryPage(),
      ),
    );
  }
}

/// =======================
/// PAGE
/// =======================
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
                color: const Color.fromRGBO(238, 240, 245, 1),
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
                initialType: TolovTuri.barchasi,
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
                // TODO: shu yerda ro‘yxatni filtrlang (agar kerak bo‘lsa)
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
  const _ListTile();

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
              color: const Color.fromRGBO(253, 254, 255, 1),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0),
                  blurRadius: 3.r,
                  color: const Color.fromRGBO(0, 0, 0, 0.12),
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
                  color: const Color.fromRGBO(13, 20, 39, 1),
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  letterSpacing: 0,
                ),
              ),
              subtitle: Text(
                "28 - Oktyabr, 2024",
                style: GoogleFonts.rubik(
                  color: const Color.fromRGBO(13, 20, 39, 0.6),
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                ),
              ),
              trailing: Text(
                "-100 000 UZS",
                style: GoogleFonts.rubik(
                  color: const Color.fromRGBO(13, 20, 39, 1),
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
Future<FilterResult?> showFilterBottomSheet(
  BuildContext context, {
  TolovTuri? initialType,
  DateTime? initialDate,
}) {
  return showModalBottomSheet<FilterResult>(
    context: context,
    isScrollControlled: false,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
    ),
    builder: (ctx) => _FilterSheet(
      initialType: initialType,
      initialDate: initialDate,
    ),
  );
}

class _FilterSheet extends StatefulWidget {
  const _FilterSheet({this.initialType, this.initialDate});
  final TolovTuri? initialType;
  final DateTime? initialDate;

  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  final _formKey = GlobalKey<FormState>();
  TolovTuri? _type;
  DateTime? _date;
  late final TextEditingController _dateCtrl;

  @override
  void initState() {
    super.initState();
    _type = widget.initialType;
    _date = widget.initialDate;
    _dateCtrl = TextEditingController(text: _date != null ? _fmtDate(_date!) : '');
  }

  @override
  void dispose() {
    _dateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration _fieldDec(String hint, {Widget? suffixIcon}) {
      return InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.rubik(fontSize: 13.sp, color: const Color(0x990D1427)),
        filled: true,
        fillColor: const Color(0xFFF3F5F7),
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
      );
    }

    Future<void> _pickDate() async {
      final now = DateTime.now();
      final picked = await showDatePicker(
        context: context,
        initialDate: _date ?? now,
        firstDate: DateTime(2000),
        lastDate: DateTime(now.year + 5),
        helpText: 'Sana tanlang',
        builder: (c, child) => Theme(
          data: Theme.of(c).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFF2E6CF6)),
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
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 60.h),
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
                      fontSize: 16.5.sp,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF0D1427),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.red),
                ),
              ],
            ),
            SizedBox(height: 18.h),

            // To'lov turi
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "To‘lov turi",
                style: GoogleFonts.rubik(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 6.h),
            DropdownButtonFormField<TolovTuri?>(
              value: _type,
              isExpanded: true,
              items: const [
                DropdownMenuItem<TolovTuri?>(value: null, child: Text("Tanlang")),
                DropdownMenuItem<TolovTuri?>(value: TolovTuri.barchasi, child: Text("Barchasi")),
                DropdownMenuItem<TolovTuri?>(value: TolovTuri.kirim, child: Text("Kirim")),
                DropdownMenuItem<TolovTuri?>(value: TolovTuri.chiqim, child: Text("Chiqim")),
              ],
              onChanged: (v) => setState(() => _type = v),
              decoration: _fieldDec("Tanlang"),
              icon: const Icon(Icons.keyboard_arrow_down_rounded),
            ),
            SizedBox(height: 14.h),

            // Sana
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sana",
                style: GoogleFonts.rubik(fontSize: 13.sp, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(height: 6.h),
            TextFormField(
              controller: _dateCtrl,
              readOnly: true,
              onTap: _pickDate,
              decoration: _fieldDec(
                "dd.MM.yyyy",
                suffixIcon: const Icon(Icons.calendar_today_outlined),
              ),
            ),
            SizedBox(height: 18.h),

            // Saqlash
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E6CF6),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(
                    context,
                    FilterResult(tolovTuri: _type, sana: _date),
                  );
                },
                child: Text(
                  "Saqlash",
                  style: GoogleFonts.rubik(
                    fontSize: 14.5.sp,
                    fontWeight: FontWeight.w600,
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
