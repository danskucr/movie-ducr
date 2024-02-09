import 'package:movie_ducr/features/profile/data/datasource/profile_datasource.dart';
import 'package:movie_ducr/features/profile/data/models/profile_reseponse.dart';

class ProfileUc {
  final ProfileDatasource _dataSource;
  ProfileUc({required ProfileDatasource dataSource})
      : _dataSource = dataSource;
  Future<ProfileResponse> call() async {
    try {
      ProfileResponse response;
      response = await _dataSource.getProfile();
      return response;
    } on ServerException {
      throw ProfileException("Error al cargar perfil de usuario");
    }
  }
}
class ServerException implements Exception {
  final String message;
  final int statusCode;
  ServerException({this.message = '', this.statusCode = 0});
}


class ProfileException implements Exception {
  final String message;
  ProfileException(this.message);
}
