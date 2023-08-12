import 'package:spell_num/spell_num.dart';

void main() {
  spellNum(985432723.55, 2, 'Euros', 'Cents');
  // Nine Hundred Eighty Five Million Four Hundred Thirty Two Thousand Seven Hundred Twenty Three Euros and Fifty Five Cents

  spellNum(18.06, 2, 'USD','Cents');
  //Eighteen Dollars and Six Cents

  spellNum(9.9, 1, 'USD','Cents');
  //Nine Dollars and Ninety Cents

 spellNum(9438293330, 2, 'Lebanese Pounds', '');

  //Three Thousand Three Hundred Thirty Dollars
}
