import 'package:test/test.dart';

/// Registers a function to be run once before all tests.
///
/// [callback] may be asynchronous; if so, it must return a [Future].
///
/// If this is called within a test group, [callback] will run before all tests
/// in that group. It will be run after any [setUpAll] callbacks in parent
/// groups or at the top level. It won't be run if none of the tests in the
/// group are run.
///
/// **Note**: This function makes it very easy to accidentally introduce hidden
/// dependencies between tests that should be isolated. In general, you should
/// prefer [setUp], and only use [setUpAll] if the callback is prohibitively
/// slow.
void beforeAll(dynamic Function() callback) {
  setUpAll(callback);
}

/// Registers a function to be run before tests.
///
/// This function will be called before each test is run. [callback] may be
/// asynchronous; if so, it must return a [Future].
///
/// If this is called within a test group, it applies only to tests in that
/// group. [callback] will be run after any set-up callbacks in parent groups or
/// at the top level.
///
/// Each callback at the top level or in a given group will be run in the order
/// they were declared.
void before(dynamic Function() callback) {
  setUp(callback);
}

/// Registers a function to be run after tests.
///
/// This function will be called after each test is run. [callback] may be
/// asynchronous; if so, it must return a [Future].
///
/// If this is called within a test group, it applies only to tests in that
/// group. [callback] will be run before any tear-down callbacks in parent
/// groups or at the top level.
///
/// Each callback at the top level or in a given group will be run in the
/// reverse of the order they were declared.
///
/// See also [addTearDown], which adds tear-downs to a running test.
void after(dynamic Function() callback) {
  tearDown(callback);
}

/// Registers a function to be run once after all tests.
///
/// If this is called within a test group, [callback] will run after all tests
/// in that group. It will be run before any [tearDownAll] callbacks in parent
/// groups or at the top level. It won't be run if none of the tests in the
/// group are run.
///
/// **Note**: This function makes it very easy to accidentally introduce hidden
/// dependencies between tests that should be isolated. In general, you should
/// prefer [tearDown], and only use [tearDownAll] if the callback is
/// prohibitively slow.
void afterAll(dynamic Function() callback) {
  tearDownAll(callback);
}
