import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:valorant/core/infra/http_client.dart';
import 'package:valorant/features/agents/data/datasources/agents_datasource.dart';
import 'package:valorant/features/agents/data/exceptions/exceptions.dart';
import 'package:valorant/features/agents/data/models/agents_model.dart';

class AgentsDatasourceImpl implements AgentsDatasource {
  final HttpClient _httpClient;

  AgentsDatasourceImpl({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<ListAgentsModel> getAgents() async {
    try {
      final Response response = await _httpClient.get(
        'agents?isPlayableCharacter=true',
      );

      return ListAgentsModel.fromMap(
        response.data,
      );
    } on DioException catch (e, s) {
      if (kDebugMode) {
        debugPrintStack(label: e.toString(), stackTrace: s);
      }
      final Map<String, dynamic> errors = e.response!.data['errors'];

      throw AgentsExeception(
        message: errors.toString(),
      );
    } catch (e) {
      throw const AgentsExeception(
        message: 'Erro inesperado',
      );
    }
  }
}
