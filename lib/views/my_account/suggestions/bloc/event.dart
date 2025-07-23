class SuggestionEvents {}

class GetSuggestionEvents extends SuggestionEvents {
  final String name, phone, title;
  GetSuggestionEvents({
    required this.name,
    required this.phone,
    required this.title,
  });
}
