import 'package:three_screeens/core/data/model/users_response.dart';

import '../../../core/data/remote/api_dio.dart';
import '../../../core/data/remote/response_extensions.dart';

class RemoteDataSourceImpl {

  static Future<UsersResponse> getUsers(int page, int perPage) async {
    final url = 'https://reqres.in/api/users?page=$page&per_page=$perPage';
    final resp = await getIt(url);

    return UsersResponse.fromJson(resp.bodyAsMap);
  }

}
