library spell_num;

String spellNum(double num, int decimal, String cur) {
  String getDigit(String num) {
    String temp = "";
    switch (num) {
      case "1":
        temp = "One ";
        break;
      case "2":
        temp = "Two ";
        break;
      case "3":
        temp = "Three ";
        break;
      case "4":
        temp = "Four ";
        break;
      case "5":
        temp = "Five ";
        break;
      case "6":
        temp = "Six ";
        break;
      case "7":
        temp = "Seven ";
        break;
      case "8":
        temp = "Eight ";
        break;
      case "9":
        temp = "Nine ";
        break;
      default:
        temp = "";
    }
    return temp;
  }

  String getTens(String digit) {
    String result;

    if (digit[0] == '1') {
      switch (digit) {
        case "10":
          result = "Ten ";
          break;
        case "11":
          result = "Eleven ";
          break;
        case "12":
          result = "Twelve ";
          break;
        case "13":
          result = "Thirteen ";
          break;
        case "14":
          result = "Fourteen ";
          break;
        case "15":
          result = "Fifteen ";
          break;
        case "16":
          result = "Sixteen ";
          break;
        case "17":
          result = "Seventeen ";
          break;
        case "18":
          result = "Eighteen ";
          break;
        case "19":
          result = "Nineteen ";
          break;
        default:
          result = "";
      }
    } else {
      switch (digit[0]) {
        case '2':
          result = "Twenty ";
          break;
        case '3':
          result = "Thirty ";
          break;
        case '4':
          result = "Forty ";
          break;
        case '5':
          result = "Fifty ";
          break;
        case '6':
          result = "Sixty ";
          break;
        case '7':
          result = "Seventy ";
          break;
        case '8':
          result = "Eighty ";
          break;
        case '9':
          result = "Ninety ";
          break;
        default:
          result = "";
          break;
      }
      result += getDigit((digit.substring(1)));
    }
    return result;
  }

  String result = "";
  String spellDec = "";
  String spellNum = "";

  List<int> numbers = [];
//round the decimal in case you want no decimals
  if (decimal == 0) {
    numbers.add(num.ceilToDouble().toInt());
  } else {
    numbers = (num.toStringAsFixed(decimal)
        .split('.')
        .map((e) => int.parse(e))
        .toList());
  }
  String numAsString = numbers.elementAt(0).toString().padLeft(2, '0');
  print(numbers);
  if (numAsString.length >= 2) {
    for (int i = 0; i < numAsString.length; i++) {
      if (i == numAsString.length - 9) {
        spellNum += getDigit(numAsString.substring(i, i + 1));
        if (!(numAsString.substring(i, i + 1) == ("0"))) {
          spellNum += "Hundred ";
        }
      }
      if (numAsString.length > 7) {
        if (i == numAsString.length - 7) {
          --i;
          if (i == numAsString.length - 8) {
            spellNum += getTens(numAsString.substring(i, i + 2));
            spellNum += "Million ";
            ++i;
            continue;
          }

          spellNum += getDigit(numAsString.substring(i, i + 1));
          spellNum += "Million ";
          continue;
        }
      }
      if (numAsString.length == 7) {
        if (i == numAsString.length - 7) {
          spellNum += getDigit(numAsString.substring(i, i + 1));
          spellNum += "Million ";
          continue;
        }
      }
      if (i == numAsString.length - 6) {
        spellNum += getDigit(numAsString.substring(i, i + 1));
        spellNum += "Hundred ";
      }
      if (numAsString.length > 4) {
        if (i == numAsString.length - 4) {
          --i;
          if (i == numAsString.length - 5) {
            spellNum += getTens(numAsString.substring(i, i + 2));
            spellNum += "Thousand ";
            ++i;
            continue;
          }
          if (i == numAsString.length - 4) {
            spellNum += getTens(numAsString.substring(i, i + 1));
            spellNum += "Thousand ";
            continue;
          }
        }
      }
      if (numAsString.length == 4) {
        if (i == numAsString.length - 4) {
          spellNum += getDigit(numAsString.substring(i, i + 1));
          spellNum += "Thousand ";
          continue;
        }
      }

      if (i == numAsString.length - 3) {
        spellNum += getDigit(numAsString.substring(i, i + 1));
        if (!(numAsString.substring(i, i + 1) == ("0"))) {
          spellNum += "Hundred ";
        }
      }

      if (i == numAsString.length - 2) {
        spellNum += getTens(numAsString.substring(i));
      }
    }
  } else {
    getDigit(numAsString);
  }
  if (numbers.elementAt(1) != 0) {
    String dec = numbers.elementAt(1).toString().padLeft(2, '0');
    if (cur == ("\$") || cur == "USD") spellDec += "and ${getTens(dec)}Cents";
    if (cur == ("€") || cur == "EUR") spellDec += "and ${getTens(dec)}Cents";
    // if (cur == ("LBP")) spellDec += "and " + GetTens(dec) + " Pences";
  }

  if (cur == ("\$") || cur == "USD") spellNum += "Dollars";
  if (cur == ("€") || cur == "EUR") spellNum += "Euros";
  if (cur == ("LBP")) spellNum += " Lebanese Pounds";

  result = "$spellNum $spellDec";

  return result;
}
