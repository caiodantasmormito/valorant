import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:valorant/core/infra/http_client.dart';
import 'package:valorant/features/maps/data/datasource/maps_datasource.dart';
import 'package:valorant/features/maps/data/exceptions/exceptions.dart';
import 'package:valorant/features/maps/data/models/maps_model.dart';

class MapsDatasourceImpl implements MapsDatasource {
  final HttpClient _httpClient;

  MapsDatasourceImpl({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<ListMapsModel> getMaps() async {
    try {
      final Response response = await _httpClient.get(
        'maps',
      );

      return ListMapsModel.fromMap(
        response.data,
      );
    } on DioException catch (e, s) {
      if (kDebugMode) {
        debugPrintStack(label: e.toString(), stackTrace: s);
      }
      final Map<String, dynamic> errors = e.response!.data['errors'];

      throw MapsExeception(
        message: errors.toString(),
      );
    } catch (e) {
      throw const MapsExeception(
        message: 'Erro inesperado',
      );
    }
  }
}
