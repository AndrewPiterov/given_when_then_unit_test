class PostController {
  PostController({
    required IPostRepository repo,
    required IToastr toastr,
  })  : _repo = repo,
        _toastr = toastr;

  final IPostRepository _repo;
  final IToastr _toastr;

  List<String> get posts => _repo.posts;

  Future fetchMore() => _repo.fetchMore();

  Future<bool> addNew(String post) async {
    final isSuccess = await _repo.addNew(post);
    if (isSuccess) {
      _toastr.success('ok');
    } else {
      _toastr.error('invalid post');
    }
    return isSuccess;
  }
}

abstract class IPostRepository {
  List<String> posts = List.empty();

  Future fetchMore();

  Future<bool> addNew(String post);
}

abstract class IToastr {
  void success(String message);
  void error(String message);
}
