import 'package:scanner/constants.dart';

String fetchProduct(
    String productCode,
    List<List<String>> countryCodes,
    List<int> companyCodes8,
    List<int> companyCodes7,
    List<int> companyCodes6,
    List<int> companyCodes5,
    List<int> companyCodes4) {
  String result = '';


  try {
    for (var element in countryCodes) {
      if (int.parse(productCode.substring(0, 3)) >= int.parse(element[0]) &&
          int.parse(productCode.substring(0, 3)) <= int.parse(element[1])) {
        result = outText;
        break;
      } else {
        for (var element in companyCodes8) {
          if (int.parse(productCode.substring(3, 11)) == element) {
            result = outText;
            break;
          } else {
            for (var element in companyCodes7) {
              if (int.parse(productCode.substring(3, 10)) == element) {
                result = outText;
                break;
              } else {
                for (var element in companyCodes6) {
                  if (int.parse(productCode.substring(3, 9)) == element) {
                    result = outText;
                    break;
                  } else {
                    for (var element in companyCodes5) {
                      if (int.parse(productCode.substring(3, 8)) == element) {
                        result = outText;
                        break;
                      } else {
                        for (var element in companyCodes4) {
                          if (int.parse(productCode.substring(3, 7)) ==
                              element) {
                            result = outText;
                            break;
                          } else {
                            result = inText;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  } on Exception {
    result = 'San failed';
  }
  return result;
}
