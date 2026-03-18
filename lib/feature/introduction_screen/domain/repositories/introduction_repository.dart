import '../entities/introduction_page_entity.dart';

abstract class IntroductionRepository {
  List<IntroductionPageEntity> getIntroductionPages();
  
  Future<void> setIntroductionCompleted();
  
  Future<bool> isIntroductionCompleted();
}
