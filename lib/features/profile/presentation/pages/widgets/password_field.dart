import 'package:cure_team_2/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordFieldTile extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final String? errorText;
  final int maxLength;

  const PasswordFieldTile({
    super.key,
    required this.label,
    required this.controller,
    this.errorText,
    this.maxLength = 10,
  });

  @override
  State<PasswordFieldTile> createState() => _PasswordFieldTileState();
}

class _PasswordFieldTileState extends State<PasswordFieldTile> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontFamily: AppTextStyles.montserratButton.fontFamily,
            fontSize: AppTextStyles.montserratButton.fontSize,
            fontWeight: AppTextStyles.montserratButton.fontWeight,
            color: const Color(0xff05162c),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 44,
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          decoration: BoxDecoration(
            color: const Color(0xffF5F6F7),
            borderRadius: BorderRadius.circular(6),
            border: widget.errorText != null
                ? Border.all(color: Colors.red, width: 1)
                : null,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  obscureText: _obscure,
                  maxLength: widget.maxLength,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                    isCollapsed: true,
                    hintText: '********',
                    contentPadding: EdgeInsets.zero,
                    counterText: '',
                  ),
                  style: const TextStyle(fontSize: 14),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _obscure = !_obscure;
                  });
                },
                child: SvgPicture.asset(
                  _obscure
                      ? 'assets/icons/eye.svg'
                      : 'assets/icons/eyeopen.svg',
                  width: 24,
                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    Color(0xff05162c),
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              widget.errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
