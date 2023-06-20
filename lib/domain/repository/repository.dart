import 'package:dartz/dartz.dart';
import 'package:splashscreen/data/network/requests.dart';
import 'package:splashscreen/domain/model/models.dart';

import '../../data/network/failure.dart';

abstract class Repository{
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, Authentication>> register(RegisterRequest registerRequest);
  Future<Either<Failure,HomeObject>> getHome();
}
