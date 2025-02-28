import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant/features/weapons/presentation/cubit/get_weapons_cubit.dart';

class WeaponsPage extends StatefulWidget {
  const WeaponsPage({super.key});
  static const String routeName = '/weapons';

  @override
  State<WeaponsPage> createState() => _WeaponsPageState();
}

class _WeaponsPageState extends State<WeaponsPage>
    with SingleTickerProviderStateMixin {
  late final GetWeaponsCubit _getWeaponsCubit;

  @override
  void initState() {
    super.initState();
    _getWeaponsCubit = context.read<GetWeaponsCubit>()..getWeapons();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeaponsCubit, GetWeaponsState>(
      bloc: _getWeaponsCubit,
      builder: (context, weapons) {
        if (weapons is GetWeaponsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (weapons is GetWeaponsError) {
          return Center(
            child: Text(weapons.message!),
          );
        }
        if (weapons is GetWeaponsSuccess) {
          if (weapons.data.isEmpty) {
            return const Center(
              child: Text('Nenhuma arma encontrado.'),
            );
          }
          return ListView.builder(
            itemCount: weapons.data.length,
            itemBuilder: (context, index) {
              final weapon = weapons.data[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: CachedNetworkImage(
                                  imageUrl: weapon.displayIcon,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) =>
                                          CircularProgressIndicator(
                                              value: downloadProgress.progress),
                                  errorWidget: (context, error, stackTrace) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Expanded(
                      child: CachedNetworkImage(
                        imageUrl: weapon.displayIcon,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                                    value: downloadProgress.progress),
                        errorWidget: (context, error, stackTrace) =>
                            Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
