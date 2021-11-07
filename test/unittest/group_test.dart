// ignore_for_file: depend_on_referenced_packages

import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:test/expect.dart';
// ignore: depend_on_referenced_packages bcs it is needed to run a test calls like (when, given) inside a test without registering them
import 'package:test_api/src/backend/declarer.dart';
import 'package:test_api/src/backend/group_entry.dart';

/// Given and when both delegate to [group].
/// 
/// see issue #1
void main() {
  given('async body of Future<null>', () => _testFunctions(_asyncFunc));

  given('async body of Future<int>', () => _testFunctions(_asyncFuncInt));
}

void _testFunctions(dynamic Function() body){
  then('"given" should throw', () {
      declare(() {
        expect(() => given('', body), throwsArgumentError);
      });
    });

    then('"when" shall throw', (){
      declare(() {
        expect(() => when('', body), throwsArgumentError);
      });
    });
    then('"whenn" shall throw', (){
      declare(() {
        expect(() => whenn('', body), throwsArgumentError);
      });
    });
    then('"when2" shall throw', (){
      declare(() {
        expect(() => when2('', (){}, then: body), throwsArgumentError);
      });
    });
}


/// Runs [body] with a declarer and returns the declared entries.
/// 
/// For ref [see](https://github.com/dart-lang/test/blob/767dbb5888ab5376ef0319006f7c90b028c1dbf8/pkgs/test_api/test/utils.dart#L173)
List<GroupEntry> declare(void Function() body) {
  final declarer = Declarer()..declare(body);
  return declarer.build().entries;
}


Future _asyncFunc() async {
  await Future.delayed(const Duration(seconds: 1));
}

Future<int> _asyncFuncInt() async {
   await Future.delayed(const Duration(seconds: 1));
   return 1;
}
