import 'package:dartz/dartz.dart';
import 'package:splashscreen/data/network/failure.dart';
import 'package:splashscreen/domain/model/models.dart';
import 'package:splashscreen/domain/repository/repository.dart';
import 'package:splashscreen/domain/usecase/base_usecase.dart';

import '../../app/function.dart';
import '../../data/network/requests.dart';


class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.login(LoginRequest(
        input.email, input.password, deviceInfo.identifier, deviceInfo.name));
  }
}


class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}