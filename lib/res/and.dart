import 'package:meta/meta.dart';
import 'package:test/test.dart';

import 'helpers.dart';

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
    '${getAdditionalPads()}And $description',
    () {
      body();
    },
  );
}
