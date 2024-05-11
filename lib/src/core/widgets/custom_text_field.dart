import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskem/src/core/extensions/context_extension.dart';
import 'package:taskem/src/core/extensions/theme_extension.dart';
import 'package:taskem/src/core/helpers/platform_check_mixin.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.title,
    this.hint,
    this.obscure = false,
    this.maxLength,
    this.maxLines,
    this.controller,
    this.inputFormatters,
    this.validator,
    this.keyboardType,
    this.canBeEmpty = false,
    this.suffix,
    this.onTap,
    this.padding,
    this.autofillHints,
  });

  factory CustomTextField.password({
    Key? key,
    String? title,
    String? hint,
    int? maxLength,
    int? maxLines,
    TextEditingController? controller,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String value)? validator,
    Iterable<String>? autofillHints,
    TextInputType? keyboardType,
  }) {
    return CustomTextField(
      key: key,
      title: title,
      hint: hint,
      obscure: true,
      maxLength: maxLength,
      maxLines: maxLines,
      controller: controller,
      inputFormatters: inputFormatters,
      autofillHints: autofillHints ??
          const [
            AutofillHints.password,
          ],
      validator: validator,
      keyboardType: keyboardType,
    );
  }

  final String? title;
  final String? hint;
  final bool obscure;
  final bool canBeEmpty;
  final int? maxLength;
  final int? maxLines;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  final String? Function(String value)? validator;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final EdgeInsets? padding;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> with PlatformCheck {
  late final ValueNotifier<bool> showPassword;

  @override
  void initState() {
    super.initState();
    showPassword = ValueNotifier(true);
  }

  @override
  void dispose() {
    super.dispose();
    showPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final translation = context.translation;

    // TODO(ripls56): remove hardcode color
    final fillColor = theme.isDark ? const Color(0xFF313131) : Colors.white;

    final padding = widget.padding ??
        const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        );

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );

    return Column(
      key: widget.key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              widget.title!,
            ),
          ),
        ValueListenableBuilder(
          valueListenable: showPassword,
          builder: (context, value, child) {
            return TextFormField(
              autofillHints: widget.autofillHints,
              cursorHeight: isCupertino ? 16 : null,
              maxLines: widget.maxLines ?? 1,
              onTap: widget.onTap,
              maxLength: widget.maxLength,
              controller: widget.controller,
              validator: (val) {
                final value = val?.trim();
                if (widget.canBeEmpty) {
                  if (value != null) {
                    return widget.validator?.call(value);
                  }
                  return null;
                }

                if (value == null || value.isEmpty) {
                  return translation.validator.empty;
                }

                return widget.validator?.call(value);
              },
              inputFormatters: widget.inputFormatters,
              keyboardType: widget.keyboardType,
              decoration: InputDecoration(
                counterStyle: const TextStyle(
                  fontSize: 0,
                  height: 0,
                ),
                suffix: widget.obscure
                    ? Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              HapticFeedback.lightImpact();
                              showPassword.value = !showPassword.value;
                            },
                            child: Platform.isMacOS || Platform.isIOS
                                ? Icon(
                                    showPassword.value
                                        ? CupertinoIcons.eye
                                        : CupertinoIcons.eye_slash,
                                    size: 16,
                                  )
                                : Icon(
                                    showPassword.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    size: 16,
                                  ),
                          ),
                        ),
                      )
                    : widget.suffix,
                hintText: widget.hint,
                fillColor: fillColor,
                contentPadding: padding,
                filled: true,
                border: border,
                errorBorder: border,
                enabledBorder: border,
                disabledBorder: border,
                focusedBorder: border,
                focusedErrorBorder: border,
              ),
              obscureText: widget.obscure && showPassword.value,
            );
          },
        ),
      ],
    );
  }
}
