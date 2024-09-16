import 'package:riverpod/riverpod.dart';
import '../services/contact_service.dart';

final contactServiceProvider = Provider<ContactService>((ref) {
  return ContactService();
});
