import 'package:ricky_and_mory_app/app_export.dart';

abstract class ICharacterRepository {
  Future<HttpResponse<CharactersPaginationResponse>> getCharacters(int page);
}

class CharacterRepository implements ICharacterRepository {
  final HttpManager _http;

  CharacterRepository(this._http);

  @override
  Future<HttpResponse<CharactersPaginationResponse>> getCharacters(
      int page) async {
    return await _http.request(
      path: 'character/?page=$page',
      method: HttpMethods.get,
      parser: (data) {
        return CharactersPaginationResponse.fromJson(data);
      },
    );
  }
}
