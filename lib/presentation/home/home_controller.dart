import 'package:get/get.dart';
import 'package:glow_quest/core/enums/quests.dart';
import 'package:glow_quest/models/quest_model.dart';
import 'package:glow_quest/presentation/sub_quest_selection/sub_quest_selection_view.dart';

class HomeController extends GetxController {
  // A reactive list of quests. The UI will update automatically when this changes.
  final RxList<QuestModel> quests = <QuestModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadQuests();
  }

  void _loadQuests() {
    // In a real game, you would load this from player progress (e.g., SharedPreferences)
    // For this demo, we'll use mock data.
    quests.assignAll([
      QuestModel(id: 1, name: 'Quest 1', status: QuestStatus.unlocked),
      QuestModel(id: 2, name: 'Quest 2', status: QuestStatus.locked),
      QuestModel(id: 3, name: 'Quest 3', status: QuestStatus.locked),
      QuestModel(id: 4, name: 'Quest 4', status: QuestStatus.locked),
      // Add more quests as needed
    ]);
  }

  void selectQuest(QuestModel quest) {
    if (quest.status != QuestStatus.locked) {
      // Navigate to the sub-quest selection screen for the chosen quest
      Get.to(() => SubQuestSelectionView(questId: quest.id));
    } else {
      // Optionally, show a "Level Locked" message
      Get.snackbar(
        'Quest Locked',
        'You must complete the previous quests to unlock this one.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}