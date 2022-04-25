abstract class AddAccountPageStates {}

class PageIdle extends AddAccountPageStates {}

class Loading extends AddAccountPageStates {}

class Error extends AddAccountPageStates {
  final String msg;

  Error(this.msg);
}

class ImagesLoaded extends AddAccountPageStates {
  final List<Map<String, dynamic>> images;

  ImagesLoaded(this.images);
}
