import 'package:collection/collection.dart';
import 'package:uuid/uuid.dart'; // Import the uuid package
import '../models/contact_model.dart'; // Adjust the import path as necessary

class ContactService {
  final List<Contact> _contacts = [];

  void addContact(String name, String phoneNumber, String email) {
    final contact = Contact(
      id: Uuid().v4(), // Generates a unique ID for the contact
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
      return false; // Contact not found
    }
    _contacts.removeAt(index);
    return true; // Contact removed successfully
  }

  void updateContact(String id, {String? name, String? phoneNumber, String? email}) {
    final contact = _contacts.firstWhereOrNull((contact) => contact.id == id);
    if (contact == null) {
      print('Contact with ID $id not found.');
      return;
    }

    if (name != null && name.isNotEmpty) contact.name = name;
    if (phoneNumber != null && phoneNumber.isNotEmpty) contact.phoneNumber = phoneNumber;
    if (email != null && email.isNotEmpty) contact.email = email;
  }
}
