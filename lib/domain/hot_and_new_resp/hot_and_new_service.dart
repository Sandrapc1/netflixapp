import 'package:dartz/dartz.dart';

import '../core/failures/main_failures.dart';
import 'model/hot_and_new_resp.dart';

abstract class HotAndNewService {
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewMovieData();
  Future<Either<MainFailure,HotAndNewResp>> getHotAndNewTvData();
}
