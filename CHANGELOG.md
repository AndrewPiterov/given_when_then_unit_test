## 0.2.1

* Update dependencies

## 0.2.0

* Update dependencies

## 0.1.0

* [Change] each `GIVEN` `WHEN` `THEN` on separate line by default

## 0.0.10

* [Fix] of async tests are executed from sync function, not awaiting the Future, see [#11]

## 0.0.9

* [Add] generic `testCases1<A>`, `testCases2<A, B>`, `testCases3<A, B, C>`

## 0.0.8

* [Add] `testCases`

## 0.0.7

* [Add] `And` step
* [Add] `But` step
* [Add] `` for test report formatting

## 0.0.6

* [Fix] Downgrade test to `^0.4.2` due to incompatibility with flutter, see [#5](https://github.com/AndrewPiterov/given_when_then_unit_test/issues/5) (@Hu1buerger)
* [Fix] `skip` as dynamic [#6](https://github.com/AndrewPiterov/given_when_then_unit_test/issues/6)

## 0.0.5

* [Fix] Bug #1 - async bodies of `given`, `when` aka `group` (@Hu1buerger)
* [Refactor] removed code duplication (@Hu1buerger)

## 0.0.4

* Downgrade `test` to `^1.16.0`

## 0.0.3

* Improve documentation

## 0.0.2

* [Add] [examples](./example/lib/example.dart)
* Refactoring
* 100% test coverage

## 0.0.1

* [Add] `given` `when` `then` methods
* [Add] `before`, `after`, `beforeAll`, `afterAll` test fixtures
