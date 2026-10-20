import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('search_field'),
      width: 343,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.searchField,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 6),
            child: Icon(Icons.search, size: 28, color: AppColors.searchFieldIcon),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              'What do you want to listen to?',
              style: AppTextStyles.bodyBold16.copyWith(color: AppColors.textHint),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
