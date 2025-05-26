import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.backgroundColor,
    required this.titleColor,
    required this.title,
    required this.borderRadius,
  });
  final Color backgroundColor;
  final Color titleColor;
  final String title;
  final BorderRadius borderRadius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
        ),
        onPressed: () {},
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: titleColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
        ),
      ),
    );
  }
}
