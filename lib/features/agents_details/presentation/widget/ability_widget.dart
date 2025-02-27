import 'package:flutter/material.dart';
import 'package:valorant/features/agents/domain/entities/ability_entity.dart';

class AbilitiesListTile extends StatelessWidget {
  final AbilityEntity ability;

  const AbilitiesListTile({super.key, required this.ability});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      /*leading: CachedNetworkImage(
        imageUrl: ability.displayIcon,
        width: 50,
        height: 50,
        progressIndicatorBuilder: (context, url, progress) =>
            CircularProgressIndicator(value: progress.progress),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),*/
      title: Text(
        ability.displayName,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          letterSpacing: 2.0,
        ),
      ),
      subtitle: Text(
        ability.description,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
    );
  }
}
