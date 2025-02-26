import 'package:valorant/features/maps/data/models/maps_model.dart';

abstract interface class MapsDatasource {
  Future<ListMapsModel> getMaps();
}
