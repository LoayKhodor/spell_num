library spell_num;


String spellNum(double num, int decimalPlaces,  String cur, String subCur) {
  final List<String> units = [
    "", "Thousand ", "Million ", "Billion ", "Trillion ", "Quadrillion "
    // Add more units as needed
  ];

  String getThreeDigits(int value) {
    String result = "";

    if (value >= 100) {
      result += "${getDigit((value ~/ 100).toString())}Hundred ";
      value %= 100;
    }

    if (value >= 10 && value <= 19) {
      return "$result${getTens(value.toString())}";
    } else if (value >= 20) {
      result += getTens((value ~/ 10).toString());
      value %= 10;
    }

    if (value > 0) {
      result += getDigit(value.toString());
    }

    return result;
  }

  String result = "";
  int integerPart = num.toInt();
  int decimalPart = 0;


  if(num.toString().contains('.')) {
    decimalPart = int.parse(num.toString().split('.')[1]);
    decimalPlaces = decimalPart
        .toString()
        .length;
  } else {
    decimalPlaces = 0;
  }

  int unitIndex = 0;
  while (integerPart > 0) {
    int threeDigits = integerPart % 1000;
    if (threeDigits > 0) {
      result = getThreeDigits(threeDigits) + units[unitIndex] + result;
    }
    integerPart ~/= 1000;
    unitIndex++;
  }
  result += "$cur ";

  if (decimalPlaces > 0) {
    result += "and ${getTens((decimalPart ~/ 10).toString())}${getDigit((decimalPart % 10).toString())}$subCur ";
  }
  return result;
}

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