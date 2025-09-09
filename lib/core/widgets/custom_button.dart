import 'package:flutter/material.dart';

import '../theme_manager/collor_pallete.dart';

class CustomButton extends StatelessWidget {

  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Widget? child;

  const CustomButton({super.key, this.onTap, this.backgroundColor,required this.child});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? ColorPallete.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.symmetric(vertical: 14),
        side: BorderSide(
          color: ColorPallete.yellow,
        ),
      ),
      child: child,

    );
  }
}
