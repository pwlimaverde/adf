import 'package:flutter/material.dart';

import '../utilites/icons_padrao.dart';

class FieldPadrao extends StatelessWidget {
  final String label;
  final bool obscureText;
  final IconButton? sufixIconButton;
  final ValueNotifier<bool> obscureTextVN;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;


  FieldPadrao({
    super.key,
    required this.label,
    this.obscureText = false,
    this.sufixIconButton,
    this.controller,
    this.validator,
    this.focusNode,
  })  : assert(
          obscureText == true ? sufixIconButton == null : true,
          'Obscuretext não pode ser enviado em conjunto com sulfixIconButton',
        ),
        obscureTextVN = ValueNotifier(obscureText);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: obscureTextVN,
        builder: (
          _,
          obscureTextValue,
          child,
        ) {
          return TextFormField(
            controller: controller,
            validator: validator,
            focusNode: focusNode,
            obscureText: obscureTextValue,
            decoration: InputDecoration(
              isDense: true,
              labelText: label,
              labelStyle: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1.0,
                ),
              ),
              suffixIcon: sufixIconButton ??
                  (obscureText == true
                      ? Padding(
                          padding: const EdgeInsets.only(
                            right: 5,
                          ),
                          child: IconButton(
                            onPressed: () {
                              obscureTextVN.value = !obscureTextValue;
                            },
                            icon: Icon(
                              !obscureTextValue
                                  ? IconsPadrao.eyeSlash
                                  : IconsPadrao.eye,
                              size: 15,
                            ),
                          ),
                        )
                      : null),
            ),
          );
        });
  }
}
