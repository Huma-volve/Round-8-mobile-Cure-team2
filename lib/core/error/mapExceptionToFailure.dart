import 'package:cure_team_2/core/error/exceptions.dart';
import 'package:cure_team_2/core/error/failures.dart';

Failure mapExceptionToFailure(Exception e) {
  switch (e.runtimeType) {
    case UnauthorizedException:
      return const UnauthorizedFailure();
    case ForbiddenException:
      return const ForbiddenFailure();
    case NotFoundException:
      return const NotFoundFailure();
    case BadRequestException:
      return const BadRequestFailure();
    case ConflictException:
      return const ConflictFailure();
    case InternalServerErrorException:
      return const InternalServerErrorFailure();
    case RequestTimeoutException:
      return const TimeoutFailure();
    case NoInternetException:
      return const NoInternetFailure();
    // case FirebaseAuthExceptionCustom:
    //   return const FirebaseAuthFailure();
    // case FirebaseFirestoreException:
    //   return const FirebaseFirestoreFailure();
    // case FirebaseStorageException:
    //   return const FirebaseStorageFailure();
    // case CacheException:
      // return const CacheFailure();
    default:
      return const UnknownFailure();
  }
}
