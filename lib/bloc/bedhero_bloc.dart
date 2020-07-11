import 'package:bed_store_app/bloc/bedhero_event.dart';
import 'package:bed_store_app/bloc/bedhero_state.dart';
import 'package:bloc/bloc.dart';

class BedHeroBloc extends Bloc<BedHeroEvent, BedHeroState> {
  BedHeroBloc() : super(BedHeroInitial());

  @override
  Stream<BedHeroState> mapEventToState(BedHeroEvent event) async* {
    yield BedHeroLoading();
    if (event is UpdateHero) {
      yield BedHeroDisplay(
        image: event.bed.image,
        tag: event.bed.tag,
        price: event.bed.price,
        description: event.bed.description,
        title: event.bed.title,
      );
    }
  }
}
