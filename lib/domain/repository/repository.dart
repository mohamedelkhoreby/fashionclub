import 'package:dartz/dartz.dart';

import '../../data/network/failure.dart';
import '../model/models.dart';

abstract class Repository{
  Future<Either<Failure,HomeObject>> getHome();
}
