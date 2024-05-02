import 'package:dartz/dartz.dart';
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
}
