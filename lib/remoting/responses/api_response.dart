sealed class ApiResponse<T> {
  final T? body;
  final String? message;

  const ApiResponse({this.body, this.message});

  static ApiResponse<T> create<T>(T response) {
    return ApiSuccessResponse(response);
  }

  static ApiErrorResponse<T> createError<T>(String error) {
    return ApiErrorResponse(message: error.toString());
  }
}

class ApiSuccessResponse<T> extends ApiResponse<T> {
  const ApiSuccessResponse(T body) : super(body: body);
}

class ApiErrorResponse<T> extends ApiResponse<T> {
  const ApiErrorResponse({super.body, required super.message});
}
