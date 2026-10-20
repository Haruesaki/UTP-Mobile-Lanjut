import 'package:flutter/widgets.dart';

abstract final class AppDimens {
  static const double pageMargin = 16;
  static const double headerTopGap = 32;
  static const double navContentHeight = 58;
  static const double miniPlayerHeight = 56;
  static const double miniPlayerMargin = 8;
  static const double statusBarFallback = 40;
  static const double bottomInsetFallback = 14;

  static double topInset(BuildContext context) {
    final top = MediaQuery.paddingOf(context).top;
    return top > 0 ? top : statusBarFallback;
  }

  static double bottomInset(BuildContext context) {
    final bottom = MediaQuery.paddingOf(context).bottom;
    return bottom > 0 ? bottom : bottomInsetFallback;
  }

  static double bottomChrome(BuildContext context) =>
      navContentHeight + bottomInset(context) + miniPlayerHeight;
}
