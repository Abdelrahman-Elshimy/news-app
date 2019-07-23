
import 'package:news_app/models/twitter_feed_model.dart';

class TwitterFeedsData {
  List<TwitterFeedsModel> _twitterFeeds = [
    TwitterFeedsModel('Christina Meyers', 'ch_meyers', 'We also talk about the future of work as the robots advance, and we ask whether a retro phone', 'assets/images/1.jpg', 'Fri, 12 May 2017 • 14.30', 19),
    TwitterFeedsModel('Abdelrahman Lotfy', 'Abd_lotfy', 'We also talk about the future of work as the robots advance, and we ask whether a retro phone', 'assets/images/2.jpg', 'Fri, 12 May 2017 • 14.30', 57),
    TwitterFeedsModel('Mohammed Ahmed', 'mo_shabh', 'We also talk about the future of work as the robots advance, and we ask whether a retro phone', 'assets/images/3.jpg', 'Fri, 12 May 2017 • 14.30', 120),
    TwitterFeedsModel('Sayed Abdallah', 'Sa_abdallah', 'We also talk about the future of work as the robots advance, and we ask whether a retro phone', 'assets/images/4.jpg', 'Fri, 12 May 2017 • 14.30', 94),
    TwitterFeedsModel('Hesham Ahmed', 'he_maged', 'We also talk about the future of work as the robots advance, and we ask whether a retro phone', 'assets/images/5.jpg', 'Fri, 12 May 2017 • 14.30', 20),
  ];

  List<TwitterFeedsModel> getTwitterData() {
    return _twitterFeeds;
  }
}