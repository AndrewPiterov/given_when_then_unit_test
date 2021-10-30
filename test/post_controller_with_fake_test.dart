import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shouldly/shouldly.dart';
import './post_controller.dart';
import 'mocks.dart';

class FakePostRepository extends Fake implements IPostRepository {
  List<String> _posts = [];

  @override
  List<String> get posts => _posts;

  @override
  Future fetchMore() async {
    _posts = Iterable.generate(10).map((e) => e.toString()).toList();
  }
}

void main() {
  given('Post Controller', () {
    late PostController postController;
    late IPostRepository postRepository;
    late IToastr mockToastsr;

    before(() {
      postRepository = FakePostRepository();
      mockToastsr = MockToastsr();
      postController = PostController(
        repo: postRepository,
        toastr: mockToastsr,
      );
    });

    when2(
      'load initial posts',
      () {
        postController.fetchMore();
      },
      then: () {
        then('should be non empty list', () {
          postController.posts.should.haveCount(10);
        });
      },
    );
  });
}
