import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant/features/maps/presentation/cubit/get_maps_cubit.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});
  static const String routeName = '/maps';

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage>
    with SingleTickerProviderStateMixin {
  late final GetMapsCubit _getMapsCubit;

  @override
  void initState() {
    super.initState();
    _getMapsCubit = context.read<GetMapsCubit>()..getMaps();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMapsCubit, GetMapsState>(
      bloc: _getMapsCubit,
      builder: (context, maps) {
        if (maps is GetMapsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (maps is GetMapsError) {
          return Center(
            child: Text(maps.message!),
          );
        }
        if (maps is GetMapsSuccess) {
          if (maps.data.isEmpty) {
            return const Center(
              child: Text('Nenhum mapa encontrado.'),
            );
          }
          return ListView.builder(
            itemCount: maps.data.length,
            itemBuilder: (context, index) {
              final map = maps.data[index];
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
                                  imageUrl: map.displayIcon,
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
                        imageUrl: map.splash,
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
