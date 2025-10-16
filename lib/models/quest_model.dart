import 'package:glow_quest/core/enums/quests.dart';

class QuestModel {
  final int id;
  final String name;
  final QuestStatus status;

  QuestModel({
    required this.id,
    required this.name,
    this.status = QuestStatus.locked,
  });
}