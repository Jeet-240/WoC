class PopularModels{
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  bool boxIsSelected;

  PopularModels({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxIsSelected,
  });

  static List<PopularModels> getPopularDiets(){
    List<PopularModels> popularDiets = [];
    popularDiets.add(
        PopularModels(
          name: 'Blueberry Pancake',
          iconPath: 'assets/icons/blueberry-pancake.svg',
          level: 'Medium',
          duration: '30mins',
          calorie: '230kCal',
          boxIsSelected: true,
        )
    );

    popularDiets.add(
        PopularModels(
          name: 'Salmon Nigiri',
          iconPath: 'assets/icons/salmon-nigiri.svg',
          level: 'Easy',
          duration: '20mins',
          calorie: '120kCal',
          boxIsSelected: false,
        )
    );

    popularDiets.add(
        PopularModels(
          name: 'Omlette',
          iconPath: 'assets/icons/egg-svgrepo-com.svg',
          level: 'Easy',
          duration: '15mins',
          calorie: '100kCal',
          boxIsSelected: false,
        )
    );
    return popularDiets;
  }

}
