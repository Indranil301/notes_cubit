import 'package:hive/hive.dart';

//Remeber use the dart file name to generate type adaptor
part 'NoteModel.g.dart';

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

  Note({required this.name, required this.description});
}

Note j = Note(name: 'sdfhshfh', description: 'dhfkshkfskj');

List<Note> array = [
  Note(name: 'Bingo', description: 'dhfkshkfskj'),
  Note(name: 'Duolingo', description: 'dhfkshkfskj'),
  Note(name: 'Foo', description: 'dhfkshkfskj'),
  Note(name: 'Bazz', description: 'dhfkshkfskj'),
  Note(name: 'Foobar', description: 'dhfkshkfskj'),
  Note(name: 'Cameron', description: 'dhfkshkfskj'),
];
