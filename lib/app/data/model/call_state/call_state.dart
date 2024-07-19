abstract class CallState {
  final String message;
  CallState({required this.message});
}

class Success<T> extends CallState {
  T? data;
  Success({super.message = "Successful", required this.data});
}

class Error extends CallState {
  Error({super.message = "Error"});
}
