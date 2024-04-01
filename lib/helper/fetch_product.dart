import 'package:scanner/constants.dart';
import 'package:scanner/models/company_barcode_model.dart';
import 'package:scanner/models/country_barcode_model.dart';

String fetchProduct({
  required String productCode,
  required List<CountryBarcodeModel> countriesBarcodes,
  required List<CompanyBarcodeModel> companiesBarcodes,
}) {

  List<CompanyBarcodeModel> companyCodes4 = [],
      companyCodes5 = [],
      companyCodes6 = [],
      companyCodes7 = [],
      companyCodes8 = [];

// Create a map to hold references to the lists based on barcode length
  Map<int, List<CompanyBarcodeModel>> companyCodesMap = {
    4: companyCodes4,
    5: companyCodes5,
    6: companyCodes6,
    7: companyCodes7,
    8: companyCodes8,
  };

  for (var element in companiesBarcodes) {
    int barcodeLength = element.barcodeNumber.toString().length;
    // Check if the map contains the list for the current barcode length
    if (companyCodesMap.containsKey(barcodeLength)) {
      companyCodesMap[barcodeLength]?.add(element);
    }
  }

  String result = '';

  try {
    for (var element in countriesBarcodes) {
      if (int.parse(productCode.substring(0, 3)) >= int.parse(element.firstCode) &&
          int.parse(productCode.substring(0, 3)) <= int.parse(element.lastCode)) {
        result = outText;
        break;
      } else {
        for (var element in companyCodes8) {
          if (int.parse(productCode.substring(3, 11)) ==
              element.barcodeNumber) {
            result = outText;
            break;
          } else {
            for (var element in companyCodes7) {
              if (int.parse(productCode.substring(3, 10)) ==
                  element.barcodeNumber) {
                result = outText;
                break;
              } else {
                for (var element in companyCodes6) {
                  if (int.parse(productCode.substring(3, 9)) ==
                      element.barcodeNumber) {
                    result = outText;
                    break;
                  } else {
                    for (var element in companyCodes5) {
                      if (int.parse(productCode.substring(3, 8)) ==
                          element.barcodeNumber) {
                        result = outText;
                        break;
                      } else {
                        for (var element in companyCodes4) {
                          if (int.parse(productCode.substring(3, 7)) ==
                              element.barcodeNumber) {
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
