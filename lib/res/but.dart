import 'package:meta/meta.dart';
import 'package:test/test.dart';

import 'helpers.dart';

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
