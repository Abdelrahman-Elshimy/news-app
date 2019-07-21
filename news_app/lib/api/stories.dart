import '../models/stories.dart';
class StoriesApi {

    List<Stories> _stories = [
    Stories('The World Global Warming Annual Summit', 'Michael Adams', '15 min',
        'assets/images/1.jpg', 'sports', 'We also talk about the future of work as the robots advance, and we ask whether a retro phone'),
    Stories('US President Inaugurations held in Washington', 'Roy Montgomery',
        '1 hours ago', 'assets/images/2.jpg', 'sports', 'We also talk about the future of work as the robots advance, and we ask whether a retro phone'),
    Stories('Spotlight on Medtech Outsourcing and Innovation', 'Roy Montgomery',
        '2 hours ago', 'assets/images/3.jpg', 'sports', 'We also talk about the future of work as the robots advance, and we ask whether a retro phone'),
    Stories('The City in Pakistan that Loves a British Hairstyles',
        'Michael Adams', '15 min', 'assets/images/4.jpg', 'sports', 'We also talk about the future of work as the robots advance, and we ask whether a retro phone'),
    Stories('Vettel is Ferrari Number One - Hamilton', 'Michael Adams',
        '15 min', 'assets/images/5.jpg', 'life', 'We also talk about the future of work as the robots advance, and we ask whether a retro phone'),
  ];

  List<Stories> listStories (){ 
    return _stories;
  }
  
}