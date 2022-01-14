# given_when_then_unit_test

[![pub package](https://img.shields.io/pub/v/given_when_then_unit_test.svg?label=given_when_then_unit_test&color=blue)](https://pub.dev/packages/given_when_then_unit_test)
[![likes](https://badges.bar/given_when_then_unit_test/likes)](https://pub.dev/packages/given_when_then_unit_test/score)
[![codecov](https://codecov.io/gh/AndrewPiterov/given_when_then_unit_test/branch/main/graph/badge.svg?token=VM9LTJXGQS)](https://codecov.io/gh/AndrewPiterov/given_when_then_unit_test)
[![style: lint](https://img.shields.io/badge/style-lint-4BC0F5.svg)](https://pub.dev/packages/lint)
[![Dart](https://github.com/AndrewPiterov/given_when_then_unit_test/actions/workflows/dart.yml/badge.svg)](https://github.com/AndrewPiterov/given_when_then_unit_test/actions/workflows/dart.yml)

A Flutter package for creating more readable tests. If you are not familiar with [Flutter's Unit tests](https://flutter.dev/docs/cookbook/testing/unit/introduction)

**Given** we feel that our tests are the best documentation of the behaviors in our code.\
**When** we read our tests.\
**Then** we want them to be easy to understand.\
**And** test code be elegant.\
**But** be written without any pain.

## Features

### Improve test code readability

```dart
// Without `given_when_then`
group('calculator', () {
  // ...
  group('add 1', () => calc.add(1), then: () {
    test('result should be 1', () {
      // ...
    });

    group('[and] subtract 1', () => calc.subtract(1), body: () {
      test('res should be 0', () {
        // ...
      });
    });
  });
});

// 🔥 With `given_when_then` as a common English sentence
given('calculator', () {
  // ...
  when('add 1', () => calc.add(1), then: () {
    then('result should be 1', () {
      // ...
    });

    when('[and] subtract 1', () => calc.subtract(1), body: () {
      then('res should be 0', () {
        // ...
      });
    });
  });
});
```

#### With [`shouldly`](https://pub.dev/packages/shouldly) it makes super readable test code 😍

```dart
given('calculator', () {
  late Calculator calc;

  before(() {
    calc = Calculator();
  });

  when('add 1', () {
    before(() => calc.add(1));

    then('result should be 1', () {
      calc.res.should.be(1);
    });

    when('[and] subtract 1', () {
      before(() => calc.subtract(1));
      then('res should be 0', () {
        calc.res.should.beZero();
      });
    });
  });
});
```

### Auto compose test message as BDD style

#### Without `given_when_then`

```bash
✓ calculator When add 1 result should be 1
✓ calculator When add 1 [and] subtract 1 res should be 0
```

#### With `given_when_then` with minimal effort

```bash
✓ Given empty calculator When add 1 Then result should be 1
✓ Given empty calculator When add 1 and subtract 1 Then res should be 0
```

## Usage

### Simple example

#### Without given_when_then

```dart
  group('empty calculator', body: () {
    late Calculator calc;

    setUp(() {
      calc = Calculator();
    });

    group('add 1', () {

      setUp(() {
        calc.add(1);
      });

      test('result should be 1', () {
        calc.res.should.be(1);
      });

      group('[and] subtract 1', () {

        setUp(() {
          calc.subtract(1);
        });

        test('res should be 0', () {
          calc.res.should.beZero();
        });
      });
    });
  });
```

#### With given_when_then

```dart
  given('empty calculator', () {
    late Calculator calc;

    before(() {
      calc = Calculator();
    });

    when('add 1', () => calc.add(1), then: () {
      then('result should be 1', () {
        calc.res.should.be(1);
      });

      and('subtract 1', () => calc.subtract(1), body: () {
        then('res should be 0', () {
          calc.res.should.beZero();
        });
      });
    });
  });
```

### Advanced example with mocking

```dart
given('Post Controller', body: () {
    late PostController postController;
    late IPostRepository mockPostRepository;
    late IToastr mockToastr;

    before(() {
      mockPostRepository = MockPostRepository();
      mockToastr = MockToastr();
      postController = PostController(
        repo: mockPostRepository,
        toastr: mockToastr,
      );
    });

    whenn('save new valid post', () {
      bool? saveResult;

      before(() async {
        when(() => mockPostRepository.addNew('new post'))
            .thenAnswer((_) => Future.value(true));

        saveResult = await postController.addNew('new post');
      });

      then('should return true', () async {
        saveResult.should.beTrue();
      });

      then('toastr shows success', () async {
        verify(() => mockToastr.success('ok')).called(1);
      });
    });

    whenn('save new invalid post', () {
      bool? saveResult;
      before(() async {
        when(() => mockPostRepository.addNew('new invalid post'))
            .thenAnswer((_) => Future.value(false));

        saveResult = await postController.addNew('new invalid post');
      });

      then('should return false', () async {
        saveResult.should.beFalse();
      });

      then('toastr shows error', () async {
        verify(() => mockToastr.error('invalid post')).called(1);
      });
    });
  });
```

### Test cases

There are two ways how to use `test cases`:

#### version 1

```dart
testCases([
  const TestCase([1, 1, 2]),
  const TestCase([5, 3, 8])
], (testCase) {
  final x = testCase.args[0] as int;
  final y = testCase.args[1] as int;

  given('two numbers $x and $y', () {
    //
    when('summarizing them', () {
      then('the result should be equal to ${testCase.args.last}', () {
        (x + y).should.be(testCase.args[2] as int);
      });
    });
  });
});
```

```bash
✓ 
Given two numbers 1 and 1 
When summarizing them 
Then the result should be equal to 2
✓ 
Given two numbers 5 and 3 
When summarizing them 
Then the result should be equal to 8

```

#### version 2 - with generic

```dart
testCases2<String, String>([
  const TestCase2('Flutter', 'F'),
  const TestCase2('Awesome', 'A'),
], (args) {
  test('Word ${args.arg1} start with ${args.arg2}', () {
    args.arg1.should.startWith(args.arg2);
  });
});
```

```bash
✓ Word Flutter start with F
✓ Word Awesome start with A
```

## Formatting the test report 📜

You can format the test report, make it in a single line, or print every step on each line by setting variable `GivenWhenThenOptions.pads` with any integer value, e.g.

```dart
GivenWhenThenOptions.pads = 4;
```

and result will be:

```bash
Given the account balance is $100 
    And the card is valid 
    And the machine contains enough money 
When the Account Holder requests $20 
Then the Cashpoint should dispense
    And the account balance should be $80
    And the card should be returned
```

## Known Issues

* Collision with [mocktail](https://pub.dev/packages/mocktail) or [mockito](https://pub.dev/packages/mockito) packages which bring `where` method too, you can hide `when` and use `whenn` of this package like below

But prefer to hide and rename imports like so.

```dart 
import 'package:mocktail/mocktail.dart' hide when;
import 'package:mocktail/mocktail.dart' as mktl show when;
```

```dart
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart' hide when;

void main() {
  given('Post Controller', () {
    // .. omit
    whenn('save new invalid post', () {
      // ... omit
      then('should return false', () async {
        saveResult.should.beFalse();
      });

      then('toastr shows error', () async {
        verify(() => mockToastr.error('invalid post')).called(1);
      });
    });
  });
}
```

### And & But

Steps `And` and `But` are inter-changeable.

However, `But` in the English language is generally used in a negative context. And using `But` makes the intent of the test explicit and removes any possible ambiguities.

## Contributing

We accept the following contributions:

* Ideas how to improve readability or performance
* [Reporting issues](https://github.com/AndrewPiterov/given_when_then_unit_test/issues/new)
* Fixing bugs
* Improving documentation and comments

## Maintainers

* [Andrew Piterov](mailto:piterov1990@gmail.com?subject=[GitHub]%20Source%20Dart%20given_when_then_unit_test)

<a href="https://www.buymeacoffee.com/devcraft.ninja" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" alt="Buy Me A Coffee" height="41" width="174"></a>
