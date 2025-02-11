import 'package:dicoding_flutter_fundamental/core/domain/resource.dart';
import 'package:dicoding_flutter_fundamental/remoting/responses/api_response.dart';

Future<Resource<ResultType>> resourceCommon<ResultType, RequestType>({
  required Future<ApiResponse<RequestType>> Function() fetch,
  required ResultType Function(RequestType) mapping,
  Future<void> Function(ResultType)? doOnFetchSuccess,
}) async {
  final apiResponse = await fetch();

  switch (apiResponse) {
    case ApiSuccessResponse<RequestType>():
      final result = mapping(apiResponse.body as RequestType);
      if (doOnFetchSuccess != null) {
        await doOnFetchSuccess(result);
      }
      return Success(result);

    case ApiErrorResponse<RequestType>():
      final message = apiResponse.message;
      final errorBody = apiResponse.body != null
          ? mapping(apiResponse.body as RequestType)
          : null;
      return Error(data: errorBody, message: message);
  }
}
