import 'package:crafty_bay/app/app_colors.dart';
import 'package:flutter/material.dart';

class IncrementDecrementWidget extends StatefulWidget {
  const IncrementDecrementWidget({super.key, required this.onChange});

  final Function(int) onChange;

  @override
  State<IncrementDecrementWidget> createState() =>
      _IncrementDecrementWidgetState();
}

class _IncrementDecrementWidgetState extends State<IncrementDecrementWidget> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        _buildIconButton(
          onTap: () {
            if (value <= 1) return;
            value--;
            setState(() {});
            widget.onChange(value);
          },
          icon: Icons.remove,
        ),
        const SizedBox(width: 6),
        Text(
          value.toString().padLeft(2, '0'),
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700),
        ),
        const SizedBox(width: 6),
        _buildIconButton(
          onTap: () {
            if (value >= 20) return;
            value++;
            setState(() {});
            widget.onChange(value);
          },
          icon: Icons.add,
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color:
              ((value == 1 && icon == Icons.remove) ||
                  (value == 20 && icon == Icons.add))
              ? AppColors.themeColor.withValues(alpha: 0.5)
              : AppColors.themeColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 18,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
