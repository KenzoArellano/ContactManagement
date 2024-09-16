import 'package:collection/collection.dart';
import 'package:uuid/uuid.dart';
import '../models/contact_model.dart';

class ContactService {
  final List<Contact> _contacts = [];

  void addContact(String name, String phoneNumber, String email) {
    final contact = Contact(
      id: Uuid().v4(),
      name: name,
      phoneNumber: phoneNumber,
      email: email,
    );
    _contacts.add(contact);
  }

  List<Contact> getContacts() => _contacts;

  bool removeContact(String id) {
    final index = _contacts.indexWhere((contact) => contact.id == id);
    if (index == -1) {
      return false;
    }
    _contacts.removeAt(index);
    return true;
  }

  void updateContact(String id,
      {String? name, String? phoneNumber, String? email}) {
    final contact = _contacts.firstWhereOrNull((contact) => contact.id == id);
    if (contact == null) {
      print('Contact with ID $id not found.');
      return;
    }

    if (name != null && name.isNotEmpty) contact.name = name;
    if (phoneNumber != null && phoneNumber.isNotEmpty)
      contact.phoneNumber = phoneNumber;
    if (email != null && email.isNotEmpty) contact.email = email;
  }
}
