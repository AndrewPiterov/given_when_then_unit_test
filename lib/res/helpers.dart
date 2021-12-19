import 'package:given_when_then_unit_test/res/given_when_then_options.dart';

///
String getMainPad() => GivenWhenThenOptions.pads > 0 ? '\n' : ' ';

///
String getAdditionalPads() => GivenWhenThenOptions.pads > 0
    ? '\n${' ' * GivenWhenThenOptions.pads}'
    : ' ';
