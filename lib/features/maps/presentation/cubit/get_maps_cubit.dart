import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:valorant/core/domain/usecase/usecase.dart';
import 'package:valorant/features/maps/domain/entities/maps_entity.dart';
import 'package:valorant/features/maps/domain/usecases/maps_usecase.dart';

part 'get_maps_state.dart';

class GetMapsCubit extends Cubit<GetMapsState> {
  final MapsUsecase _getMapsUsecase;
  GetMapsCubit({required MapsUsecase getMapsUsecase})
      : _getMapsUsecase = getMapsUsecase,
        super(GetMapsInitial());

  Future<void> getMaps() async {
    emit(GetMapsLoading());

    final (failure, result) = await _getMapsUsecase(const NoParams());

    if (failure != null) {
      emit(
        GetMapsError(message: failure.message!),
      );
      return;
    }

    emit(GetMapsSuccess(
      data: result!,
    ));
  }
}
