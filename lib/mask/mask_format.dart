import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class InputMask {
  static MaskTextInputFormatter maskPhoneNumber = MaskTextInputFormatter(
      mask: '998 ## ### ## ##', filter: {"#": RegExp(r'[0-9]')});
}
