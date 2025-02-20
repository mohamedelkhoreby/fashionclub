import 'package:dartz/dartz.dart';
import 'package:fashionclub/data/mapper/mapper.dart';

import '../../domain/model/models.dart';
import '../../domain/repository/repository.dart';
import '../../presentation/resources/strings_manager.dart';
import '../../presentation/resources/values_manager.dart';
import '../data_source/local_data_source.dart';
import '../data_source/remote_data_source.dart';
import '../network/error_handler.dart';
import '../network/failure.dart';
import '../network/network_info.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  RepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, HomeObject>> getHome() async {
    try {
      // get from cache
      final response = await _localDataSource.getHome();
      return Right(response.toDomain());
    } catch (cacheError) {
      // we have cache error so we should call API

      if (await _networkInfo.isConnected) {
        try {
          // its safe to call the API
          final response = await _remoteDataSource.getHome();

          if (response.status == ApiInternalStatus.success) // success
          {
            // return data (success)
            // return right
            // save response to local data source
            _localDataSource.saveHomeToCache(response);
            return Right(response.toDomain());
          } else {
            // return biz logic error
            // return left
            return Left(Failure(response.status ?? ApiInternalStatus.failure,
                response.message ?? ResponseMessage.defaultError));
          }
        } catch (error) {
          return (Left(ErrorHandler.handle(error).failure));
        }
      } else {
        // return connection error
        return Left(DataSource.noInternetConnection.getFailure());
      }
    }
  }
}
