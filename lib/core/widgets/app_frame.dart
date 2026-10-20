import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppFrame extends StatelessWidget {
  const AppFrame({super.key, required this.child});
  final Widget child;

  static const Size reference = Size(375, 834);

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    if (!kIsWeb || mq.size.width <= 600) return child;
    return ColoredBox(
      color: Colors.black,
      child: Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: SizedBox.fromSize(
            size: reference,
            child: MediaQuery(
              data: mq.copyWith(
                size: reference,
                padding: const EdgeInsets.only(top: 40, bottom: 14),
                viewPadding: const EdgeInsets.only(top: 40, bottom: 14),
              ),
              child: ClipRect(child: child),
            ),
          ),
        ),
      ),
    );
  }
}
