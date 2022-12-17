import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();

    for (int i = 0; i < text.length; i++) {
      if (i > 10) {
        buffer.write("");
      } else {
        buffer.write(text[i]);
        var nonZeroIndex = i + 1;
        // if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length && nonZeroIndex!=16) {
        //   buffer.write(
        //       ' ');
        // }
        if ((nonZeroIndex == 3 ||nonZeroIndex == 6)&&
            nonZeroIndex != text.length &&
            nonZeroIndex != 16) {
          buffer.write(" ");
        }
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}
