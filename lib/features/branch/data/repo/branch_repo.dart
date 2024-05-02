import 'package:dartz/dartz.dart';

import '../../../../core/error/http_failure.dart';
import '../models/branch_model.dart';

abstract class BranchRepo {
  Future<Either<HttpFailure, List<BranchModel>?>> getBranches();
}
