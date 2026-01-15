import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class CustomOptionBadges extends StatefulWidget {
  const CustomOptionBadges({
    super.key,
    required this.title,
    required this.values,
    required this.onSelected,
  });

  final String title;
  final List<String> values;
  final Function(int selectedIndex) onSelected;

  @override
  State<CustomOptionBadges> createState() => _CustomOptionBadgesState();
}

class _CustomOptionBadgesState extends State<CustomOptionBadges> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 42,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.values.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _selectedIndex = index;
                  setState(() {});
                  widget.onSelected(index);
                },
                child: Chip(
                  side: BorderSide(
                    color: _selectedIndex == index ? AppColors.themeColor : Colors.grey.withValues(alpha: 0.2),
                  ),
                  backgroundColor: _selectedIndex == index
                      ? AppColors.themeColor
                      : null,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  elevation: 2,
                  label: Text(
                    widget.values[index],
                    style: TextStyle(
                      color: _selectedIndex == index ? Colors.white : null,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (_, _) => const SizedBox(width: 8),
          ),
        ),
      ],
    );
  }
}
