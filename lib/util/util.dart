import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class Util {
static String formataDinheiro(double valor){
    FlutterMoneyFormatter fmf = new FlutterMoneyFormatter(
        amount: valor, 
        settings: MoneyFormatterSettings(
          symbol: "R\$",
          thousandSeparator: '.',
          decimalSeparator: ',',
          fractionDigits: 2,
        ));
    return fmf.output.symbolOnLeft;
  }
}
