import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class FilterChipPill extends StatelessWidget {
  const FilterChipPill({
    super.key,
    required this.label,
    required this.selected,
    this.horizontalPadding = 16,
  });
  final String label;
  final bool selected;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        color: selected ? AppColors.green : AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Text(
        label,
        style: AppTextStyles.chip13.copyWith(
          color: selected ? AppColors.onGreen : AppColors.textPrimary,
        ),
      ),
    );
  }
}
