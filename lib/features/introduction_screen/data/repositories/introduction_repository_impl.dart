import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/introduction_page_entity.dart';
import '../../domain/repositories/introduction_repository.dart';
import '../models/introduction_page_model.dart';

class IntroductionRepositoryImpl implements IntroductionRepository {
  final SharedPreferences _prefs;
  static const String _keyIntroductionCompleted = 'introduction_completed';

  IntroductionRepositoryImpl(this._prefs);

  @override
  List<IntroductionPageEntity> getIntroductionPages() {
    final List<IntroductionPageModel> pages = [
      IntroductionPageModel(
        title: "Save Food,",
        highlight: "Save Money",
        description: "Authentic Nepali flavors at up to decent Discounts.\n Follow your Favourite Places to stay updated",
        imagePath: "assets/images/momo.webp",
        badge: "NEPAL'S #1 FOOD RESCUE",
        showLogo: true,
      ),
      IntroductionPageModel(
        title: "Support Local Vendors",
        highlight: "",
        description: "Help your favorite bakeries and restaurants reduce waste while enjoying fresh treats at amazing prices.",
        imagePath: "assets/images/vendor.jpg",
        badge: "",
        stepIndicator: "STEP 2 OF 3",
      ),
      IntroductionPageModel(
        title: "Protect Our Peaks",
        highlight: "",
        description: "Reducing food waste means a cleaner, greener Nepal. Your first rescue starts today.",
        imagePath: "assets/images/mountains.jpg",
        badge: "",
        stepIndicatorTop: "3 OF 3",
      ),
    ];
    return pages.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> setIntroductionCompleted() async {
    await _prefs.setBool(_keyIntroductionCompleted, true);
  }

  @override
  Future<bool> isIntroductionCompleted() async {
    return _prefs.getBool(_keyIntroductionCompleted) ?? false;
  }
}
