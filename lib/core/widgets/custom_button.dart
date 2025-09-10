import 'package:flutter/material.dart';

import '../theme_manager/collor_pallete.dart';

class CustomButton extends StatelessWidget {

  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? borderColor;
  final double borderRadius;
  final Widget? child;

  const CustomButton({super.key, this.onTap, this.backgroundColor= ColorPallete.yellow,required this.child,this.borderColor,this.borderRadius = 16});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: EdgeInsets.symmetric(vertical: 14),
        side: BorderSide(
          color: borderColor ?? backgroundColor ?? ColorPallete.yellow,
          width: 2,
        ),
      ),
      child: child,

    );
  }
}
