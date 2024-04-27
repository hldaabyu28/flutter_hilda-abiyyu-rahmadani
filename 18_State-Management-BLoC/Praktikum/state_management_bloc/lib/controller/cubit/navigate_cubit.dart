import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'navigate_state.dart';


class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationState.initial);

  void navigateToContacts() {
    emit(NavigationState.ContactScreen);
  }

  void navigateToGallery() {
    emit(NavigationState.GalleryScreen);
  }

  void navigateToHome() {
    emit(NavigationState.HomePage);
  }
}
