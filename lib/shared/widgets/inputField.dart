import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final String? hint;
  final String? placeholder;
  final IconData? icon;
  final Color? color;
  final Widget? suffix;
  final Color? borderColor;
  final Color? errorTextColor;
  final Color? iconColor;
  final FocusNode? focusNode;
  final bool? readOnly;
  final bool? password;
  final String? initialValue;
  final String? textIcon;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextInputType? type;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final double? size;
  final double? borderRadius;
  final int? maxLine;
  final int? minLine;
  final bool? enabled;
  final double? fontSize;
  final Function()? onTap;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? formatters;

  const InputField({
    this.hint,
    this.color,
    this.controller,
    this.placeholder,
    this.focusNode,
    this.icon,
    this.type,
    this.readOnly,
    this.password,
    this.fontSize,
    this.errorTextColor,
    this.initialValue,
    this.borderColor,
    this.textStyle,
    this.suffix,
    this.onChanged,
    this.iconColor,
    this.validator,
    this.size,
    this.borderRadius,
    this.hintStyle,
    this.maxLine,
    this.textIcon,
    this.minLine,
    this.onTap,
    this.enabled,
    this.textAlign,
    this.formatters,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.hint != null)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.hint ?? '',
              //  style: widget.hintStyle ??
              // CustomTextTheme.secondary.headline2,
            ),
          ),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          cursorHeight: 20,
          cursorColor: Colors.black12,
          enabled: widget.enabled,
          autofocus: false,
          maxLines: widget.maxLine ?? 1,
          minLines: widget.minLine ?? 1,
          onChanged: widget.onChanged,
          validator: widget.validator,
          controller: widget.controller,
          obscureText: widget.password != null ? hidePassword : false,
          keyboardType: widget.type,
          inputFormatters: widget.formatters,
          onTap: widget.onTap,
          readOnly: widget.readOnly ?? false,
          initialValue: widget.initialValue,
          focusNode: widget.focusNode,
          textInputAction:
              widget.maxLine != null ? TextInputAction.newline : null,
          style: widget.textStyle ??
              TextStyle(
                  fontSize: widget.fontSize ?? 16, color: Color(0xff8B8686)),
          onFieldSubmitted: (_) {},
          textAlign: widget.textAlign ?? TextAlign.start,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.placeholder,
            hintStyle: widget.hintStyle ??
                TextStyle(color: Colors.grey, fontSize: widget.fontSize ?? 16),
            prefixIcon: widget.textIcon != null
                ? FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      widget.textIcon!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : widget.icon != null
                    ? Icon(widget.icon, color: widget.iconColor ?? Colors.grey)
                    : null,
            suffixIcon: widget.password != null
                ? IconButton(
                    icon: hidePassword == true
                        ? const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          ),
                    onPressed: () => setState(() {
                      hidePassword = !hidePassword;
                    }),
                  )
                : widget.suffix,
            filled: true,
            fillColor: widget.color ?? Colors.white,
            suffixIconConstraints: BoxConstraints(
              maxHeight: widget.size ?? 60,
              minHeight: widget.size ?? 60,
              maxWidth: widget.size == null ? 38 : (widget.size! + 3),
              minWidth: widget.size == null ? 38 : (widget.size! + 3),
            ),
            prefixIconConstraints: BoxConstraints(
              maxHeight: widget.size ?? 60,
              minHeight: widget.size ?? 60,
              maxWidth: widget.size == null ? 38 : (widget.size! + 3),
              minWidth: widget.size == null ? 38 : (widget.size! + 3),
            ),
            contentPadding: EdgeInsets.only(
              top: widget.icon == null
                  ? widget.suffix == null
                      ? widget.size == null
                          ? 19
                          : (widget.size! / 2)
                      : 0
                  : 0,
              bottom: widget.icon == null
                  ? widget.suffix == null
                      ? widget.size == null
                          ? 19
                          : (widget.size! / 2)
                      : 0
                  : 0,
              right: 15,
              left: widget.icon == null ? 15 : 0,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              borderSide: widget.borderColor != null
                  ? BorderSide(color: widget.borderColor!)
                  : const BorderSide(color: Colors.transparent),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              borderSide: widget.borderColor != null
                  ? BorderSide(color: widget.borderColor!)
                  : const BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              borderSide: widget.borderColor != null
                  ? BorderSide(color: widget.borderColor!)
                  : const BorderSide(color: Colors.transparent),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              borderSide: widget.borderColor != null
                  ? BorderSide(color: widget.borderColor!)
                  : const BorderSide(color: Colors.transparent),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
