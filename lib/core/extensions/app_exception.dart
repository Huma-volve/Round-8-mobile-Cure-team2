import '../error/error_handler.dart';
import '../error/exceptions.dart';

extension ErrorHandlerExtension on Object {
  AppException get toAppException {
    if (this is Exception ) {
      return ErrorHandler.handleError(this as Exception);
    }else if (this is Error){
      return ErrorHandler.handleError(this as Error) ;
    }
    else {
      return const UnknownException(message: 'unknownError');
    }
  }
}