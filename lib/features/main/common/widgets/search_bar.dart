import 'package:flutter/material.dart';

import '../../../../core/widgets/app_text_field.dart';


class MainSearchBar extends StatelessWidget {
  final GestureTapCallback? onTap ;
  final bool autoFocus;
  const MainSearchBar({super.key, this.autoFocus = false ,this.onTap});


  @override
  Widget build(BuildContext context) {
    return  AppTextField(
      onTap: onTap,
      autofocus: autoFocus,
      hintText: "Search for specialty, doctor",
      prefix: const Icon(Icons.search),) ;
  }
}
