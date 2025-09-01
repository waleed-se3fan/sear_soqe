import 'package:flutter/material.dart';

/// =============== Colors ===============
class AppColors {
  static const primary = Color(0xFF4F53FF); // بنفسجي فاتح قريب من لقطة الشاشة
  static const blue = Color(0xFF2E7DFF);
  static const green = Color(0xFF25D366); // لون واتساب
  static const text = Color(0xFF111111);
  static const subText = Color(0xFF7B7B7B);
  static const chipBg = Color(0xFFF5F6FA);
  static const cardBorder = Color(0xFFE9EBF0);
}

/// =============== View ===============
class CarDetailsView extends StatefulWidget {
  const CarDetailsView({super.key});

  @override
  State<CarDetailsView> createState() => _CarDetailsViewState();
}

class _CarDetailsViewState extends State<CarDetailsView> {
  final _images = [
    // حط صورك الحقيقية هنا
    "https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg",
    "https://images.pexels.com/photos/1402787/pexels-photo-1402787.jpeg",
    "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg",
  ];
  int _page = 0;
  bool _isFav = false;
  bool _showFullDesc = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: const _BottomActionBar(),
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _GalleryHeader(
                  images: _images,
                  page: _page,
                  onPageChanged: (i) => setState(() => _page = i),
                  isFav: _isFav,
                  onToggleFav: () => setState(() => _isFav = !_isFav),
                ),
              ),

              /// العنوان + السعر
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "تويوتا فيلوز 1.5 لتر GLX 2024",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.text,
                            height: 1.4,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "رس 2,300,00",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: AppColors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// بطاقات المواصفات السريعة (4 عناصر)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: _SpecQuickGrid(
                    items: const [
                      SpecItem(
                        title: "سنة الصنع",
                        value: "2019",
                        icon: Icons.calendar_month,
                      ),
                      SpecItem(
                        title: "عدد الكيلومترات",
                        value: "كم 54,555",
                        icon: Icons.speed,
                      ),
                      SpecItem(
                        title: "نوع الوقود",
                        value: "بنزين",
                        icon: Icons.local_gas_station,
                      ),
                      SpecItem(
                        title: "ناقل الحركة",
                        value: "أوتوماتيك",
                        icon: Icons.settings,
                      ),
                    ],
                  ),
                ),
              ),

              /// عنوان قسم
              SliverToBoxAdapter(
                child: const _SectionTitle(title: "تفاصيل السيارة"),
              ),

              /// Chips التفاصيل
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: const [
                      _InfoChip(title: "الموقع", value: "القاهرة"),
                      _InfoChip(title: "اللون", value: "رمادي"),
                      _InfoChip(title: "المواصفات", value: "أمريكية"),
                      _InfoChip(title: "الفئة", value: "بريميوم"),
                      _MoreChip(count: 12),
                    ],
                  ),
                ),
              ),

              /// الاضافات
              SliverToBoxAdapter(child: const _SectionTitle(title: "الإضافات")),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: const [
                      _FeatureItem("ABS"),
                      _FeatureItem("نظام الثبات"),
                      _FeatureItem("مرايا كهرباء"),
                      _FeatureItem("بلوتوث"),
                      _FeatureItem("مساعد صعود المرتفعات"),
                      _FeatureItem("التحكم في ثبات السرعة"),
                    ],
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "اعرض الكل 19 للإضافات",
                      style: TextStyle(color: AppColors.primary),
                    ),
                  ),
                ),
              ),

              /// الوصف
              SliverToBoxAdapter(child: const _SectionTitle(title: "وصف")),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: _ExpandableDescription(
                    showFull: _showFullDesc,
                    onToggle: () =>
                        setState(() => _showFullDesc = !_showFullDesc),
                    text:
                        "حالة حقيقة منتهى الجودة منذ زمن طويل، وهي أن المحتوى القوي لصفحة ما "
                        "يسحب القارئ إلى قراءة كامل الشكل الخارجي للنص. تم تجربة ترميز "
                        "المعرض في الصفحة التي أمامك، ولذلك تمت الاستعانة بنصوص تجريبية "
                        "تعطي انطباعًا مبدئيًا. يفضّل عند كتابة وصف السيارة الالتزام "
                        "باللغة البسيطة مع تفاصيل دقيقة عن الصيانة وعدد الملاك والملاحظات.",
                  ),
                ),
              ),

              /// معلومات البائع
              SliverToBoxAdapter(
                child: const _SectionTitle(title: "معلومات البائع"),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: _SellerInfoCard(
                    sellerName: "اسم حساب البائع",
                    sellerNote: "الملف الخاص به",
                    onViewProfile: () {},
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        ),
      ),
    );
  }
}

/// =============== Components ===============

/// معرض الصور مع الأزرار العلوية والبادج
class _GalleryHeader extends StatelessWidget {
  final List<String> images;
  final int page;
  final ValueChanged<int> onPageChanged;
  final bool isFav;
  final VoidCallback onToggleFav;

  const _GalleryHeader({
    required this.images,
    required this.page,
    required this.onPageChanged,
    required this.isFav,
    required this.onToggleFav,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(16);
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
      child: ClipRRect(
        borderRadius: radius,
        child: Stack(
          children: [
            SizedBox(
              height: 220,
              width: double.infinity,
              child: PageView.builder(
                itemCount: images.length,
                onPageChanged: onPageChanged,
                itemBuilder: (_, i) =>
                    Image.network(images[i], fit: BoxFit.cover),
              ),
            ),

            // أعلى يسار: مشاركة - مفضلة
            Positioned(
              top: 10,
              left: 10,
              child: Row(
                children: [
                  _CircleIconButton(icon: Icons.share, onTap: () {}),
                  const SizedBox(width: 8),
                  _CircleIconButton(
                    icon: isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? Colors.red : null,
                    onTap: onToggleFav,
                  ),
                ],
              ),
            ),

            // أعلى يمين: رجوع
            Positioned(
              top: 10,
              right: 10,
              child: _CircleIconButton(
                icon: Icons.arrow_back,
                onTap: () => Navigator.maybePop(context),
              ),
            ),

            // أسفل يسار: مؤشر الصفحات
            Positioned(
              left: 12,
              bottom: 10,
              child: _ImageCounter(current: page + 1, total: images.length),
            ),

            // أسفل يمين: بادج "مميز"
            Positioned(
              right: 12,
              bottom: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "مميز",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ImageCounter extends StatelessWidget {
  final int current;
  final int total;
  const _ImageCounter({required this.current, required this.total});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.45),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "$current/$total",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;
  const _CircleIconButton({
    required this.icon,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(icon, size: 20, color: color ?? AppColors.text),
        ),
      ),
    );
  }
}

/// شبكة المواصفات السريعة
class SpecItem {
  final String title;
  final String value;
  final IconData icon;
  const SpecItem({
    required this.title,
    required this.value,
    required this.icon,
  });
}

class _SpecQuickGrid extends StatelessWidget {
  final List<SpecItem> items;
  const _SpecQuickGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 8, bottom: 12),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // مريح للموبايل (عمودين × صفين)
        mainAxisExtent: 82,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemBuilder: (_, i) {
        final it = items[i];
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.cardBorder),
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.chipBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8),
                child: Icon(it.icon, size: 18, color: AppColors.primary),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      it.title,
                      style: const TextStyle(
                        color: AppColors.subText,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      it.value,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

/// عنوان قسم
class _SectionTitle extends StatelessWidget {
  final String title;
  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w800,
          color: AppColors.text,
        ),
      ),
    );
  }
}

/// Chip معلومة
class _InfoChip extends StatelessWidget {
  final String title;
  final String value;
  const _InfoChip({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.chipBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$title:",
            style: const TextStyle(color: AppColors.subText, fontSize: 12),
          ),
          const SizedBox(width: 6),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}

class _MoreChip extends StatelessWidget {
  final int count;
  const _MoreChip({required this.count});
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColors.cardBorder),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      ),
      onPressed: () {},
      child: Text(
        "+$count المزيد",
        style: const TextStyle(color: AppColors.text),
      ),
    );
  }
}

/// عنصر ميزة مع أيقونة صح
class _FeatureItem extends StatelessWidget {
  final String text;
  const _FeatureItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.check_circle, size: 20, color: AppColors.primary),
          const SizedBox(width: 8),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 14))),
        ],
      ),
    );
  }
}

/// وصف قابل للتمديد
class _ExpandableDescription extends StatelessWidget {
  final String text;
  final bool showFull;
  final VoidCallback onToggle;

  const _ExpandableDescription({
    required this.text,
    required this.showFull,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    const maxLines = 5;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          maxLines: showFull ? null : maxLines,
          overflow: showFull ? TextOverflow.visible : TextOverflow.ellipsis,
          style: const TextStyle(height: 1.6, color: AppColors.text),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: onToggle,
          child: Text(
            showFull ? "إخفاء" : "عرض المزيد",
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

/// كارت معلومات البائع
class _SellerInfoCard extends StatelessWidget {
  final String sellerName;
  final String sellerNote;
  final VoidCallback onViewProfile;

  const _SellerInfoCard({
    required this.sellerName,
    required this.sellerNote,
    required this.onViewProfile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.chipBg,
                child: const Icon(
                  Icons.account_circle,
                  size: 30,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sellerName,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      sellerNote,
                      style: const TextStyle(color: AppColors.subText),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          OutlinedButton(
            onPressed: onViewProfile,
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.primary),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
            child: const Center(
              child: Text(
                "اعرض حساب البائع والعائلة الخاصة",
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// شريط الأزرار السفلي (واتساب / اتصال / رسالة)
class _BottomActionBar extends StatelessWidget {
  const _BottomActionBar();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(16, 8, 16, 12),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.sms), // استخدم أيقونة مناسبة لديك
              label: const Text("واتساب"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text("اتصل"),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.primary),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                "رسالة",
                style: TextStyle(color: AppColors.primary),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// =============== Example entry ===============
/// استخدم CarDetailsView كـ شاشة:
///
/// MaterialApp(
///   home: CarDetailsView(),
/// );
