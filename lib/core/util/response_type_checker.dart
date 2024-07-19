import 'package:examplearch/app/data/model/call_state/call_state.dart';

Future<T?> handleResponse<T>(Future<CallState> Function() apiCall) async {
  try {
    var response = await apiCall();
    if (response is Success<T>) {
      return response.data;
    } else {
      throw response.message;
    }
  } catch (e) {
    throw "Error: $e";
  }
}
