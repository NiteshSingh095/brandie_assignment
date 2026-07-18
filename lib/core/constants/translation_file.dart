import 'package:brandie/core/constants/translation_utils.dart';
import 'package:get/get.dart';

class TranslationFile extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          // Sequential loader
          TranslationUtils.sequetialLoaderTitle:
              'Building personalised Smart Posts for you!',
          TranslationUtils.sequentialLoaderStepPreparing:
              'Preparing popular content for you',
          TranslationUtils.sequentialLoaderStepCaption:
              'Crafting a caption to boost engagement',
          TranslationUtils.sequentialLoaderStepReferral:
              'Adding your personal referral link and code',
          TranslationUtils.sequentialLoaderStepSongs:
              'Finding trending songs on other social media',
          TranslationUtils.sequentialLoaderCompletion:
              'All set! Get ready to share...',

          // Ori home tabs
          TranslationUtils.smartPost: 'Smart Post',
          TranslationUtils.library: 'Library',
          TranslationUtils.communities: 'Communities',
          TranslationUtils.shareAndWin: 'Share & Win',

          // Bottom navigation screens
          TranslationUtils.notification: 'Notification',
          TranslationUtils.search: 'Search',
          TranslationUtils.messages: 'Messages',
          TranslationUtils.profile: 'Profile',

          // Smart post feed chrome
          TranslationUtils.seeMore: 'see more',
          TranslationUtils.seeLess: 'see less',
          TranslationUtils.editCaption: 'Edit Caption',
          TranslationUtils.save: 'Save',
          TranslationUtils.quickShareTo: 'Quick share to:',
          TranslationUtils.recommendedPrefix: 'RECOMMENDED:',
          TranslationUtils.ofLabel: 'of',

          // Share loader
          TranslationUtils.generatingSalesLink: 'Generating your sales link...',
          TranslationUtils.copyingCaption:
              'Copying the caption to clipboard',
          TranslationUtils.savingContent:
              'Saving the content to your profile',
          TranslationUtils.preparingSocialContent:
              'Preparing the content for social media',
        },
      };
}
