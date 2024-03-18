import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtension on BuildContext {
  Size get size => MediaQuery.of(this).size;
  double get height => size.height;
  double get width => size.width;

  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom > 0;
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;

  AppLocalizations get localization => AppLocalizations.of(this)!;
}
