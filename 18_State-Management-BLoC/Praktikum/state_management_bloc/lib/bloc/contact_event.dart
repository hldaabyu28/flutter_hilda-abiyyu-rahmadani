part of 'contact_bloc.dart';

sealed class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class GetContacts extends ContactEvent {}

class AddContact extends ContactEvent {
  final ContactModel contact;

  const AddContact(this.contact);

  @override
  List<Object> get props => [contact];
}

class DeleteContact extends ContactEvent {
  final ContactModel contact;

  const DeleteContact(this.contact);

  @override
  List<Object> get props => [contact];
}

class EditContact extends ContactEvent {
  final ContactModel oldContact;
  final ContactModel newContact;

  const EditContact(this.oldContact, this.newContact);

  @override
  List<Object> get props => [oldContact, newContact];
}