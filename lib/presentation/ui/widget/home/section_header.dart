import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const SectionHeader({
    super.key, required this.title, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),),
        TextButton(onPressed:onTap
            , child: const Text('See All'))
      ],
    );
  }
}