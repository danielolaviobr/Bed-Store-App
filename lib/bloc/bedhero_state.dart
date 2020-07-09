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
  const BedHeroDisplay(this.image, this.tag);
}
