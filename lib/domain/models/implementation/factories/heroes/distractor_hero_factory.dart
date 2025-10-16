import 'package:glow_quest/core/enums/enum.dart';
import 'package:glow_quest/domain/heroes/distractors/distractor_hero.dart';
import 'package:glow_quest/domain/models/interface/factories/hero_factory/i_distractor_hero_factory.dart';
import 'package:glow_quest/domain/models/interface/heroes/i_game_hero.dart';

class DistractorHeroFactory implements IDistractorHeroFactory{
  @override
  IGameHero createHero(Distractors distractorType) {
    switch(distractorType){
      
      case Distractors.general:
      case Distractors.junkFood:
      case Distractors.sugaryDrink:
      case Distractors.processedFood:
         return DistractorHero();
    }
  }
}