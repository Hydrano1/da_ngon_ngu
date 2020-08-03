import 'package:da_ngon_ngu/localization/demo_localization.dart';
import 'package:flutter/cupertino.dart';

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).getTranslateValue(key);
}
