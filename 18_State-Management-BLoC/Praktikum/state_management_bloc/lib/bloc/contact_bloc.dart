

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:state_management_bloc/models/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactState()) {
    on<GetContacts>((event, emit) {
      emit(ContactState(
        contacts: [
          ContactModel(
            name: 'Ahmad',
            phone: '08123456789',
            date: '2022-10-10',
            color: 'blue',
            image: 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg',
          )
        ],
      ));
      
    });

    on<AddContact>((event, emit) {
      final List<ContactModel> newcontacts = List.from(state.contacts)
      ..add(event.contact);
      emit(state.copyWith(contacts: newcontacts));

    });

    on<DeleteContact>((event, emit) {
      final List<ContactModel> newcontacts = List.from(state.contacts)
      ..remove(event.contact);
      emit(state.copyWith(contacts: newcontacts));
    });

  }
}