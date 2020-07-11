abstract class BedHeroState {
  const BedHeroState();
}

class BedHeroInitial extends BedHeroState {
  const BedHeroInitial();
}

class BedHeroLoading extends BedHeroState {
  const BedHeroLoading();
}

class BedHeroDisplay extends BedHeroState {
  final String image;
  final String tag;
  final String title;
  final String price;
  final String description;
  const BedHeroDisplay(
      {this.image, this.tag, this.title, this.price, this.description});
}
