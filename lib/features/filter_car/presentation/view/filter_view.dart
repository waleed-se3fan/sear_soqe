import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:sear_soqe/features/favourite/presentation/widgets/favourite_card_widget.dart';
import 'package:sear_soqe/features/home/presentation/widgets/category_widget.dart';

class FilterCarView extends StatelessWidget {
  const FilterCarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,

        title: Text('323 سيارات متوفرة'),
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active_outlined),
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 16),
              InkWell(
                onTap: () {
                  final result = showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const FilterBottomSheet(),
                  );
                  // result سيحتوي على الفلاتر عندما تضغط "استعرض النتائج"
                  if (result != null) {
                    debugPrint('Filters: $result');
                  }
                },

                child: Container(
                  padding: EdgeInsets.all(8),

                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        spreadRadius: 1,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Colors.white),
                  ),
                  child: SvgPicture.asset('assets/images/setting.svg'),
                ),
              ),
              SizedBox(width: 16),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return CarDetailCard(
                  imageUrl: 'assets/images/popular-car.png',
                  title: 'تويوتا',
                  price: '100000',
                  city: 'القاهرة',
                  km: '10000',
                  fuel: 'بنزين',
                  year: '2020',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// مثال كامل لِـ Modal Bottom Sheet يشبه الصورة.
/// استدعيه عبر:
/// showModalBottomSheet(
///   context: context,
///   isScrollControlled: true,
///   backgroundColor: Colors.transparent,
///   builder: (_) => const FilterBottomSheet(),
/// );
class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({Key? key}) : super(key: key);

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  // حالة الاختيارات
  final List<String> popularTypes = ['كيا', 'تويوتا', 'هونداي', 'نيسان'];
  String searchText = '';
  Set<String> selectedTypes = {};
  RangeValues priceRange = const RangeValues(1000, 5000000);
  RangeValues yearRange = const RangeValues(2000, 2025);
  RangeValues kmRange = const RangeValues(0, 500000);
  String selectedBody = 'دفع رباعي';
  String? selectedColor;
  String sellerType = 'فرد';
  String condition = 'جديدة';
  String fuel = 'بنزين';
  Set<String> countrySpecs = {};
  String transmission = 'اوتوماتيك';
  int seats = 5;
  bool hasSingleOwner = false;
  bool fullMaintenance = false;

  // Helpers
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildHorizontalChips(
    List<String> items,
    Set<String> selected, {
    double height = 40,
  }) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (context, i) {
          final item = items[i];
          final isSelected = selected.contains(item);
          return ChoiceChip(
            label: Text(item),
            selected: isSelected,
            onSelected: (v) => setState(() {
              if (v)
                selected.add(item);
              else
                selected.remove(item);
            }),
            selectedColor: Theme.of(context).primaryColor.withOpacity(0.12),
            backgroundColor: Colors.white,
            shape: const StadiumBorder(side: BorderSide(color: Colors.grey)),
          );
        },
      ),
    );
  }

  Widget _buildRangeField({
    required String startHint,
    required String endHint,
    required RangeValues values,
    required ValueChanged<RangeValues> onChanged,
    double max = 1000000,
    int divisions = 100,
    String unit = '',
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: startHint,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                initialValue: values.start.round().toString(),
                onChanged: (v) {
                  final start = double.tryParse(v) ?? values.start;
                  onChanged(
                    RangeValues(start.clamp(0, values.end), values.end),
                  );
                },
              ),
            ),
            const SizedBox(width: 8),
            Text('إلى'),
            const SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: endHint,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                initialValue: values.end.round().toString(),
                onChanged: (v) {
                  final end = double.tryParse(v) ?? values.end;
                  onChanged(
                    RangeValues(values.start, end.clamp(values.start, max)),
                  );
                },
              ),
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 4,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
          ),
          child: RangeSlider(
            values: values,
            min: 0,
            max: max,
            divisions: divisions,
            labels: RangeLabels(
              '${values.start.round()}$unit',
              '${values.end.round()}$unit',
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }

  Widget _carShapeCard(String title, String imagePath, bool selected) {
    return GestureDetector(
      onTap: () => setState(() => selectedBody = title),
      child: Container(
        width: 120,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selected
              ? Theme.of(context).primaryColor.withOpacity(0.12)
              : Colors.white,
          border: Border.all(
            color: selected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade300,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: CategoryWidget(),
      ),
    );
  }

  Widget _colorDot(String colorName, Color color) {
    final isSelected = selectedColor == colorName;
    return GestureDetector(
      onTap: () => setState(() => selectedColor = colorName),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: isSelected
                  ? Border.all(width: 3, color: Colors.white)
                  : null,
              boxShadow: isSelected
                  ? [BoxShadow(color: Colors.black26, blurRadius: 6)]
                  : null,
            ),
          ),
          if (isSelected) const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _optionButtons(
    List<String> items,
    String selected,
    ValueChanged<String> onSelected,
  ) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items.map((e) {
        final isSelected = e == selected;
        return ChoiceChip(
          label: Text(e),
          selected: isSelected,
          onSelected: (_) => onSelected(e),
          selectedColor: Theme.of(context).primaryColor.withOpacity(0.12),
        );
      }).toList(),
    );
  }

  Widget _multiChoiceChips(
    List<String> items,
    Set<String> selected, {
    double height = 40,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items.map((e) {
        final isSelected = selected.contains(e);
        return ChoiceChip(
          label: Text(e),
          selected: isSelected,
          onSelected: (v) => setState(() {
            if (v)
              selected.add(e);
            else
              selected.remove(e);
          }),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // للعرض الكامل تقريبًا مثل الصورة، نستخدم MediaQuery لتعيين ارتفاع.
    final height = MediaQuery.of(context).size.height * 0.92;

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          height: height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: SingleChildScrollView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // handle
                  Center(
                    child: Container(
                      width: 60,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // العنوان + بحث
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'استعرض كل الأنواع',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),

                  // Popular types horizontal chips
                  _sectionTitle('أنواع مشهورة'),
                  _buildHorizontalChips(popularTypes, selectedTypes),

                  const SizedBox(height: 12),

                  // السعر Range
                  _sectionTitle('السعر'),
                  _buildRangeField(
                    startHint: '1,000',
                    endHint: '5,000,000',
                    values: priceRange,
                    max: 5000000,
                    divisions: 100,
                    unit: ' د.إ',
                    onChanged: (v) => setState(() => priceRange = v),
                  ),

                  // السنة
                  _sectionTitle('السنة'),
                  _buildRangeField(
                    startHint: '2000',
                    endHint: '2025',
                    values: yearRange,
                    max: 2025,
                    divisions: 25,
                    onChanged: (v) => setState(() => yearRange = v),
                  ),

                  // المسافة المقطوعة
                  _sectionTitle('المسافة المقطوعة (كم)'),
                  _buildRangeField(
                    startHint: '0',
                    endHint: '500,000',
                    values: kmRange,
                    max: 500000,
                    divisions: 50,
                    onChanged: (v) => setState(() => kmRange = v),
                  ),

                  // شكل السيارة
                  _sectionTitle('شكل السيارة'),
                  SizedBox(
                    height: 140,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(width: 8),
                        _carShapeCard(
                          'دفع رباعي',
                          '',
                          selectedBody == 'دفع رباعي',
                        ),
                        const SizedBox(width: 8),
                        _carShapeCard('كوبيه', '', selectedBody == 'كوبيه'),
                        const SizedBox(width: 8),
                        _carShapeCard('هاتشباك', '', selectedBody == 'هاتشباك'),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),

                  // اللون
                  _sectionTitle('اللون'),
                  Row(
                    children: [
                      _colorDot('أحمر', Colors.red),
                      _colorDot('أخضر', Colors.green),
                      _colorDot('أزرق', Colors.blue),
                      _colorDot('أسود', Colors.black),
                      _colorDot('وردي', Colors.pink),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // نوع البائع
                  _sectionTitle('نوع البائع'),
                  _optionButtons(
                    ['فرد', 'تاجير سيارات'],
                    sellerType,
                    (v) => setState(() => sellerType = v),
                  ),

                  const SizedBox(height: 12),

                  // حالة التصدير / استيراد
                  _sectionTitle('حالة التصدير'),
                  _optionButtons(
                    [
                      'جميع سيارات التصدير',
                      'للتصدير مقود يسار',
                      'للتصدير مقود يمين',
                    ],
                    condition,
                    (v) => setState(() => condition = v),
                  ),

                  const SizedBox(height: 12),

                  // نوع الوقود
                  _sectionTitle('نوع الوقود'),
                  _optionButtons(
                    ['بنزين', 'ديزل', 'هجينة', 'كهربائية'],
                    fuel,
                    (v) => setState(() => fuel = v),
                  ),

                  const SizedBox(height: 12),

                  // مواصفات خليجية (أمثلة)
                  _sectionTitle('مواصفات خليجية'),
                  _multiChoiceChips([
                    'مواصفات سعودية',
                    'مواصفات اماراتية',
                    'مواصفات كويتية',
                    'مواصفات قطرية',
                  ], countrySpecs),

                  const SizedBox(height: 12),

                  // نوع ناقل الحركة
                  _sectionTitle('نوع ناقل الحركة'),
                  _optionButtons(
                    ['اوتوماتيك', 'CVT', 'عادي'],
                    transmission,
                    (v) => setState(() => transmission = v),
                  ),

                  const SizedBox(height: 12),

                  // حالة السيارة
                  _sectionTitle('حالة السيارة'),
                  _optionButtons(
                    ['جديدة', 'مستعملة', 'مستعملة - حالة جيدة'],
                    condition,
                    (v) => setState(() => condition = v),
                  ),

                  const SizedBox(height: 12),

                  // عدد الاسطوانات / مقاعد / ... (كمثال)
                  _sectionTitle('عدد الاسطوانات'),
                  Wrap(
                    spacing: 8,
                    children: List.generate(8, (i) {
                      final val = (i + 1) * 2;
                      final isSelected = seats == val;
                      return ChoiceChip(
                        label: Text(val.toString()),
                        selected: isSelected,
                        onSelected: (_) => setState(() => seats = val),
                      );
                    }),
                  ),

                  const SizedBox(height: 12),

                  // خيارات واحدة / صيانة
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Switch(
                              value: hasSingleOwner,
                              onChanged: (v) =>
                                  setState(() => hasSingleOwner = v),
                            ),
                            const Text('مالك واحد'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Switch(
                              value: fullMaintenance,
                              onChanged: (v) =>
                                  setState(() => fullMaintenance = v),
                            ),
                            const Text('التاريخ الكامل للصيانة'),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  // أزرار الأسفل
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // إعادة الإعدادات
                            setState(() {
                              selectedTypes.clear();
                              priceRange = const RangeValues(1000, 5000000);
                              yearRange = const RangeValues(2000, 2025);
                              kmRange = const RangeValues(0, 500000);
                              selectedBody = 'دفع رباعي';
                              selectedColor = null;
                              sellerType = 'فرد';
                              condition = 'جديدة';
                              fuel = 'بنزين';
                              countrySpecs.clear();
                              transmission = 'اوتوماتيك';
                              seats = 5;
                              hasSingleOwner = false;
                              fullMaintenance = false;
                            });
                          },
                          child: const Text('إزالة الخيارات'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // استعرض النتائج - هنا ترجع القيم للصفحة الرئيسية أو تنفذ البحث
                            final filters = {
                              'types': selectedTypes.toList(),
                              'price': [priceRange.start, priceRange.end],
                              'year': [yearRange.start, yearRange.end],
                              'km': [kmRange.start, kmRange.end],
                              'body': selectedBody,
                              'color': selectedColor,
                              'seller': sellerType,
                              'fuel': fuel,
                              'transmission': transmission,
                              'singleOwner': hasSingleOwner,
                              'fullMaintenance': fullMaintenance,
                            };
                            Navigator.of(context).pop(
                              filters,
                            ); // ترجع الفلاتر للصفحة اللي فتحت الشيت
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Text('استعرض النتائج'),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
