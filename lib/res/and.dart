import 'package:given_when_then_unit_test/res/given_when_then_options.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

///
@isTestGroup
void and(
  String description,
  dynamic Function() body,
) {
  if (body is Future Function()) {
    throw ArgumentError('body may not be async.');
  }

  group(
    '\n${' ' * GivenWhenThenOptions.pads}And $description',
    () {
      body();
    },
  );
}
