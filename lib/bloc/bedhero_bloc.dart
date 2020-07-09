import 'package:bed_store_app/bloc/bedhero_event.dart';
import 'package:bed_store_app/bloc/bedhero_state.dart';
import 'package:bloc/bloc.dart';

class BedHeroBloc extends Bloc<BedHeroEvent, BedHeroState> {
  BedHeroBloc() : super(BedHeroInitial());

  @override
  Stream<BedHeroState> mapEventToState(BedHeroEvent event) async* {
    yield BedHeroLoading();
    if (event is UpdateHero) {
      yield BedHeroDisplay(event.bed.image, event.bed.tag);
    }
  }
}
