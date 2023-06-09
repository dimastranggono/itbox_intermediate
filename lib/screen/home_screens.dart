import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intermediate_flutter_itbox/models/Note.dart';
import 'package:intermediate_flutter_itbox/screen/add_notes_screen.dart';
import 'package:intermediate_flutter_itbox/widgets/notes_grid.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> _listNotes = [
    Note(
      id: 'N1',
      title: 'Catatan Materi Flutter',
      note:
          'Flutter merupakan Software Development Kit (SDK) yang bisa membantu developer dalam membuat aplikasi mobile cross platform. Kelas ini akan mempelajari pengembangan aplikasi mobile yang dapat dijalankan baik di IOS maupun di Android',
      updated_at: DateTime.parse('2021-05-19 20:33:33'),
      created_at: DateTime.parse('2021-05-19 20:33:33'),
    ),
    Note(
      id: 'N2',
      title: 'Target Pembelajaran Flutter',
      note:
          'Peserta dapat mengembangkan aplikasi mobile (IOS dan Android) menggunakan flutter,\nPeserta memahami konsep pengembangan aplikasi menggunakan flutter,\nPeserta dapat menjalankan aplikasi mobile di IOS dan Android ataupun Emulator,\nPeserta memahami bahasa pemrograman Dart,\nPeserta dapat mendevelop aplikasi mobile menggunakan flutter dan dart dari dasar secara berurutan.',
      updated_at: DateTime.parse('2021-05-20 20:53:33'),
      created_at: DateTime.parse('2021-05-20 20:53:33'),
    ),
    Note(
      id: 'N3',
      title: 'Belajar Flutter di ITBOX',
      note: 'Jangan lupa belajar flutter dengan video interactive di ITBOX.',
      updated_at: DateTime.parse('2021-05-20 21:22:33'),
      created_at: DateTime.parse('2021-05-20 21:22:33'),
    ),
    Note(
      id: 'N4',
      title: 'Resep nasi goreng',
      note:
          'Nasi putih 1 piring\nBawang putih 2 siung, cincang halus\nKecap manis atau kecap asin sesuai selera\nSaus sambal sesuai selera\nSaus tiram sesuai selera\nGaram secukupnya\nKaldu bubuk rasa ayam atau sapi sesuai selera\nDaun bawang 1 batang, cincang halus\nTelur ayam 1 butir\nSosis ayam 1 buah, iris tipis\nMargarin atau minyak goreng 3 sdm.',
      updated_at: DateTime.parse('2021-05-20 21:51:33'),
      created_at: DateTime.parse('2021-05-20 21:51:33'),
    ),
  ];

  //function untuk menge pinned note yang di pilih sesuai id
  void toggleIsPinned(String id) {
    //variabel index, mengecek apakah id dari note model sama dengan id parameter function ini
    int index = _listNotes.indexWhere((note) => note.id == id);
    //mengecek karena menggunakan indexwhere pasti akan return -1 untuk id, maka diperlukan pengecekan menggunakan if index >= 0
    if (index >= 0) {
      setState(() {
        _listNotes[index].isPinned = !_listNotes[index].isPinned;
      });
    }
  }

  void addNote(Note note) {
    setState(() {
      _listNotes.add(note);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Notes'),
      ),
      body: NotesGrid(_listNotes, toggleIsPinned),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddNotesScreen(addNote),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
