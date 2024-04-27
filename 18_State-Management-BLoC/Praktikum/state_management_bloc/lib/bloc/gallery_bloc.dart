import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:state_management_bloc/models/gallery_model.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
 GalleryBloc() : super(GalleryState()) {
    on<GetGallery>((event, emit) {
      emit(GalleryState(
        nameImage: [
          GalleryModel(url: 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
          GalleryModel(url: 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
          GalleryModel(url: 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
          GalleryModel(url: 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
        ]
      ));
    });
 }
}
