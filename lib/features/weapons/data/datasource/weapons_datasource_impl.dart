import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:valorant/core/infra/http_client.dart';
import 'package:valorant/features/agents/data/exceptions/exceptions.dart';
import 'package:valorant/features/weapons/data/datasource/weapons_datasource.dart';
import 'package:valorant/features/weapons/data/exceptions/exceptions.dart';
import 'package:valorant/features/weapons/data/models/weapons_model.dart';

class WeaponsDatasourceImpl implements WeaponsDatasource {
  final HttpClient _httpClient;

  WeaponsDatasourceImpl({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<ListWeaponsModel> getWeapons() async {
    try {
      final Response response = await _httpClient.get(
        'weapons',
      );

      return ListWeaponsModel.fromMap(
        response.data,
      );
    } on DioException catch (e, s) {
      if (kDebugMode) {
        debugPrintStack(label: e.toString(), stackTrace: s);
      }
      final Map<String, dynamic> errors = e.response!.data['errors'];

      throw WeaponsExeception(
        message: errors.toString(),
      );
    } catch (e) {
      throw const AgentsExeception(
        message: 'Erro inesperado',
      );
    }
  }
}
