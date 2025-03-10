import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:valorant/features/agents/domain/entities/ability_entity.dart';

class AbilitiesListTile extends StatelessWidget {
  final AbilityEntity ability;

  const AbilitiesListTile({super.key, required this.ability});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        image: CachedNetworkImageProvider(ability.displayIcon),
        width: 50,
        height: 50,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return CircularProgressIndicator();
        },
        errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
      ),
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
