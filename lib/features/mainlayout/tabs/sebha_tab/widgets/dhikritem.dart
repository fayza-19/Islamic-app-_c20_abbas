// Data model: one Dhikr phrase + its target count (always 33 here)
class DhikrItem {
  final String text;
  final int target;

  const DhikrItem({required this.text, required this.target});
}

const List<DhikrItem> dhikrList = [
  DhikrItem(text: 'سبحان الله', target: 33),
  DhikrItem(text: 'الحمد لله', target: 33),
  DhikrItem(text: 'الله أكبر', target: 33),
];