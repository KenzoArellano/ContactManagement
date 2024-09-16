import 'package:riverpod/riverpod.dart';
import '../services/contact_service.dart';

// Define a provider for the ContactService
final contactServiceProvider = Provider<ContactService>((ref) {
  return ContactService();
});
