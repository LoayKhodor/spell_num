import 'package:spell_num/spell_num.dart';

void main() {
  spellNum(985432723.55, 2, 'EUR');
  // Nine Hundred Eighty Five Million Four Hundred Thirty Two Thousand Seven Hundred Twenty Three Euros and Fifty Five Cents

  spellNum(18.06, 2, 'USD');
  //Eighteen Dollars and Six Cents

  spellNum(9.9, 2, '\$');
  //Nine Dollars and Ninety Cents

 spellNum(3330.00, 2, '\$');

  //Three Thousand Three Hundred Thirty Dollars
}
