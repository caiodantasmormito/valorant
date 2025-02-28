import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:valorant/core/domain/usecase/usecase.dart';
import 'package:valorant/features/weapons/domain/entities/weapons_entity.dart';
import 'package:valorant/features/weapons/domain/usecase/usecase.dart';

part 'get_weapons_state.dart';

class GetWeaponsCubit extends Cubit<GetWeaponsState> {
  final WeaponsUsecase _getWeaponsUsecase;
  GetWeaponsCubit({required WeaponsUsecase getWeaponsUsecase})
      : _getWeaponsUsecase = getWeaponsUsecase,
        super(GetWeaponsInitial());

  Future<void> getWeapons() async {
    emit(GetWeaponsLoading());

    final (failure, result) = await _getWeaponsUsecase(const NoParams());

    if (failure != null) {
      emit(
        GetWeaponsError(message: failure.message!),
      );
      return;
    }

    emit(GetWeaponsSuccess(
      data: result!,
    ));
  }
}
