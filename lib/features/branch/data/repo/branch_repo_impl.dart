import 'package:dartz/dartz.dart';
import '../models/branch_request_model.dart';
import '../../../../core/services/http_service_interface.dart';
import 'branch_repo.dart';

import '../../../../core/constants/endpoint_constants.dart';
import '../../../../core/error/http_failure.dart';
import '../models/branch_model.dart';

class BranchRepoImpl implements BranchRepo {
  final HttpServiceInterface _httpServiceInterface;

  const BranchRepoImpl(this._httpServiceInterface);

  @override
  Future<Either<HttpFailure, List<BranchModel>?>> getBranches() async {
    return await _httpServiceInterface.get(
      url: EndpointConstants.branch,
      fromJson: (decodedJson) => List<BranchModel>.from(
        decodedJson.map((e) => BranchModel.fromJson(e)),
      ),
    );
  }

  @override
  Future<Either<HttpFailure, BranchModel?>> addBranch(
      BranchRequestModel branchRequestModel) async {
    return await _httpServiceInterface.post(
      url: EndpointConstants.branch,
      fromJson: (decodedJson) => BranchModel.fromJson(decodedJson),
      body: branchRequestModel.toJson(),
    );
  }

  @override
  Future<Either<HttpFailure, BranchModel?>> updateBranch(
      String id, BranchRequestModel branchRequestModel) async {
    return await _httpServiceInterface.patch(
      url: '${EndpointConstants.branch}/$id',
      fromJson: (decodedJson) => BranchModel.fromJson(decodedJson),
      body: branchRequestModel.toJson(),
    );
  }
}
