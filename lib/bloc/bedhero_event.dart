import 'package:bed_store_app/bed.dart';

abstract class BedHeroEvent {}

class UpdateHero extends BedHeroEvent {
  final Bed bed;
  UpdateHero(this.bed);
}
