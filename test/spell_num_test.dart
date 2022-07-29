import 'package:spell_num/spell_num.dart';

void main() {
  (spellNum(985432723.55, 2, 'EUR'));
  (spellNum(18.06, 2, 'USD'));
  (spellNum(9.9, 2, 'USD'));
  // [985432723, 55]
  // 55
  // Nine Hundred Eighty Five Million Four Hundred Thirty Two Thousand Seven Hundred Twenty Three Euros and Fifty Five Cents
  // [18, 6]
  // 06
  // Eighteen Dollars and Six Cents
  // [9, 90]
  // 90
  // Nine Dollars and Ninety Cents
}
