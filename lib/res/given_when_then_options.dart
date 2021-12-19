// ignore_for_file: avoid_classes_with_only_static_members

/// Options for Given When Then
class GivenWhenThenOptions {
  /// Paddings for test report formatting before `And` and `But`
  ///
  ///Example:
  /// ```bash
  /// Given one thing
  ///   And another thing
  ///   And yet another thing
  /// When I open my eyes
  /// Then I see something
  ///   But I do not see something else
  /// ```
  static int pads = 0;
}
