import 'package:flutter/material.dart';
import 'package:glow_quest/core/enums/quests.dart';
import 'package:glow_quest/models/quest_model.dart';

class QuestNodeWidget extends StatelessWidget {
  final QuestModel quest;
  final VoidCallback onTap;

  const QuestNodeWidget({
    super.key,
    required this.quest,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isLocked = quest.status == QuestStatus.locked;
    final nodeColor = isLocked ? Colors.grey.shade700 : Colors.deepPurple;
    final icon = isLocked ? Icons.lock : Icons.star;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: nodeColor,
          border: Border.all(color: Colors.white, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(icon, color: Colors.white, size: 40),
              if (!isLocked)
                Text(
                  quest.id.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    shadows: [Shadow(blurRadius: 2, color: Colors.black87)],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}