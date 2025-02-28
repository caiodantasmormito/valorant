import 'package:valorant/features/weapons/data/models/weapons_model.dart';

abstract interface class WeaponsDatasource {
  Future<ListWeaponsModel> getWeapons();
}
