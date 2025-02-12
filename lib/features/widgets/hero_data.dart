class HeroData {
  final String quote;
  final String author;
  final String iconPath;

  HeroData({
    required this.quote,
    required this.author,
    required this.iconPath,
  });

  static List<HeroData> getData() {
    return [
      HeroData(
        quote: "Good food is the foundation of genuine happiness",
        author: 'John Anderson',
        iconPath: 'assets/img/serving.png',
      ),
      HeroData(
        quote: "First we eat, then we do everything else",
        author: 'Emily Carter',
        iconPath: 'assets/img/eat.png',
      ),
      HeroData(
        quote:
            "One cannot think well, love well, sleep well, if one has not dined well",
        author: 'Michael Thompson',
        iconPath: 'assets/img/pizza.png',
      ),
      HeroData(
        quote: "Tell me what you eat, and I will tell you what you are",
        author: 'Sarah Bennett',
        iconPath: 'assets/img/burger.png',
      ),
      HeroData(
        quote: "Food is our common ground, a universal experience.",
        author: 'David Mitchell',
        iconPath: 'assets/img/buyfood.png',
      ),
    ];
  }
}
