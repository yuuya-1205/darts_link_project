import 'package:flutter/material.dart';

class AppbarActionButton extends StatelessWidget {
  const AppbarActionButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.isActive = true,
  }) : super(key: key);

  final void Function() onPressed;
  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100)),
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(100),
          child: InkWell(
            onTap: isActive ? onPressed : null,
            child: Ink(
              color: isActive ? Colors.black : Colors.grey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ),
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
