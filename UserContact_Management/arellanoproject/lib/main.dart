import 'dart:io';
import 'package:riverpod/riverpod.dart';
import '../services/contact_service.dart';
import '../providers/providers.dart';

void main() {
  final container = ProviderContainer();
  final contactService = container.read(contactServiceProvider);

  while (true) {
    print('\nContact Management System');
    print('1. Add Contact');
    print('2. List Contacts');
    print('3. Remove Contact');
    print('4. Exit');
    print('Choose an option: ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        _addContact(contactService);
        break;
      case '2':
        _listContacts(contactService);
        break;
      case '3':
        _removeContact(contactService);
        break;
      case '4':
        container.dispose(); // Clean up the provider container
        exit(0);
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void _addContact(ContactService contactService) {
  print('Enter contact name: ');
  final name = stdin.readLineSync()!;
  print('Enter contact phone number: ');
  final phoneNumber = stdin.readLineSync()!;
  print('Enter contact email: ');
  final email = stdin.readLineSync()!;

  contactService.addContact(name, phoneNumber, email);
  print('Contact added successfully.');
}

void _listContacts(ContactService contactService) {
  final contacts = contactService.getContacts();
  if (contacts.isEmpty) {
    print('No contacts available.');
    return;
  }
  for (var contact in contacts) {
    print('ID: ${contact.id}');
    print('Name: ${contact.name}');
    print('Phone Number: ${contact.phoneNumber}');
    print('Email: ${contact.email}');
    print('---');
  }
}

void _removeContact(ContactService contactService) {
  // List contacts before asking for removal
  print('\nContacts List:');
  _listContacts(contactService);

  // Prompt for ID to remove
  print('Enter the ID of the contact to remove: ');
  final id = stdin.readLineSync()!;

  bool removed = contactService.removeContact(id);

  if (removed) {
    print('Contact removed successfully.');
  } else {
    print('Contact with ID $id not found.');
  }

  // Show updated list of contacts
  print('\nUpdated Contacts List:');
  _listContacts(contactService);
}
