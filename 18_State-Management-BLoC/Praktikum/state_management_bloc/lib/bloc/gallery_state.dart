part of 'gallery_bloc.dart';


class GalleryState extends Equatable {
  final List<GalleryModel>  nameImage;
  const GalleryState({this.nameImage = const <GalleryModel>[]});
  
  @override
  List<Object> get props => [nameImage];

  GalleryState copyWith({List<GalleryModel>? nameImage}) {
    return GalleryState(nameImage: nameImage ?? this.nameImage);
  }
}