import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:meta/meta.dart';
import 'package:test/test.dart';

///
@isTest
void but(
  String description,
  dynamic Function() body, {
  dynamic skip,
}) {
  test(
    '\n${' ' * GivenWhenThenOptions.pads}But $description',
    body,
    skip: skip,
  );
}
