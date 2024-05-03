import 'package:dartz/dartz.dart';
import '../models/branch_request_model.dart';
import '../../../../core/error/http_failure.dart';
import '../models/branch_model.dart';

abstract class BranchRepo {
  Future<Either<HttpFailure, List<BranchModel>?>> getBranches();
  Future<Either<HttpFailure, BranchModel?>> addBranch(
      BranchRequestModel branchRequestModel);
  Future<Either<HttpFailure, BranchModel?>> updateBranch(
      String id, BranchRequestModel branchRequestModel);
}
