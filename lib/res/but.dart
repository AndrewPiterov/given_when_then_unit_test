import 'package:given_when_then_unit_test/res/helpers.dart';
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
    '${getAdditionalPads()}But $description',
    body,
    skip: skip,
  );
}
