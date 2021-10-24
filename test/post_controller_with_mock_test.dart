import 'package:given_when_then_unit_test/given_when_then_unit_test.dart'
    hide when;
import 'package:mocktail/mocktail.dart';
import 'package:shouldly/shouldly.dart';
import 'package:test/scaffolding.dart';
import './post_controller.dart';
import 'mocks.dart';

void main() {
  given('Post Controller', () {
    late PostController postController;
    late IPostRepository mockPostRepository;
    late IToastr mockToastr;

    before(() {
      mockPostRepository = MockPostRepository();
      mockToastr = MockToastsr();
      postController = PostController(
        repo: mockPostRepository,
        toastr: mockToastr,
      );
    });

    when2('save new valid post', () {
      when(() => mockPostRepository.addNew('new post'))
          .thenAnswer((_) => Future.value(true));
    }, then: () {
      then('should return true', () async {
        final res = await postController.addNew('new post');
        res.should.beTrue();
      });

      // ! DOES NOT WORK then('toastr shows error', () async {
      //   verify(() => mockToastr.success('ok')).called(1);
      // });
    });

    whenn('save new valid post', () {
      bool? saveResult;
      setUp(() async {
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
}
