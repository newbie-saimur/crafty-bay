import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class BuildSectionHeader extends StatefulWidget {
  const BuildSectionHeader({
    super.key,
    required this.title,
    required this.onTapSeeAll,
  });

  final String title;
  final VoidCallback onTapSeeAll;

  @override
  State<BuildSectionHeader> createState() => _BuildSectionHeaderState();
}

class _BuildSectionHeaderState extends State<BuildSectionHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontSize: MediaQuery.sizeOf(context).width < 600 ? null : 26,
          ),
        ),
        TextButton(
          onPressed: widget.onTapSeeAll,
          child: Text(
            "See All",
            style: TextStyle(
              color: AppColors.themeColor,
              fontSize: MediaQuery.sizeOf(context).width < 600 ? null : 18,
            ),
          ),
        ),
      ],
    );
  }
}
