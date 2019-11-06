import 'dart:io';
import 'Talk.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBase {
  static final DataBase _instance = new DataBase.internal();

  factory DataBase() => _instance;

  DataBase.internal();

  final String talkTable = "TalkTable";
  final String id = "id";
  final String name = "name";
  final String speaker = "speaker";
  final String roomNumber = "roomNumber";

 static Database _db;

  Future<Database> get db async {
    // if exists a database, return it
    if(_db != null){
      return _db;
    }

    _db = await initDB();
    return _db;
  }

  initDB() async {
    // Get a location using getDatabasesPath
   /* var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, "database.db");
    var db = await openDatabase(path);*/
    // Directory faz parte do plugin dart:io e o getApplicationDocumentsDirectory() faz parte do path_provider
    // aqui nós estamos acessando o diretório nativo do android
    Directory documentoDiretorio = await getApplicationDocumentsDirectory();

    // o join() junta duas coisas, no caso iremos juntar o diretorio juntamente com o nosso banco de dados
    String caminho = join(
      documentoDiretorio.path, "database.db"
    );

    // após ter acesso ao local do nosso BD, iremos abri-lo
    var db = await openDatabase(caminho, version: 1, onCreate: _onCreate);
    return db;
 
  }

  //criando o método _onCreate que irá criar o nosso BD
  void _onCreate(Database db, int version) async {
    // aqui iremos colocar o SQL que é outra linguagem, por isso, colocaremos
    // dentro de aspas, pois é string
    await db.execute("CREATE TABLE $talkTable($id INTEGER PRIMARY KEY,"
      "$name TEXT,"
      "$speaker TEXT,"
      "$roomNumber INTEGER)");
  }


  Future<int> inserirTalk(Talk talk) async {
    var clientDB = await db;

    int res = await clientDB.insert("$talkTable", talk.toMap());
    
    // retorn a number
    return res;
  }

  Future<List> getTalks() async {
    var clientDB = await db;

    var res = await clientDB.rawQuery("SELECT * FROM $talkTable");
    //resturn list
    return res.toList();
 }

  Future<int> getCount() async {
    var clientDB = await db;
    return Sqflite.firstIntValue(await clientDB.rawQuery("SELECT COUNT(*) FROM $talkTable"));
  }

  // iremos mostrar somente um usuário
  Future<Talk> getTalk(int id) async {
    var clientDB = await db;
    var res = await clientDB.rawQuery("SELECT * FROM $talkTable"
              " WHERE $id = $id"); 

    // verificando se a lista retorna nada
    if (res.length == 0) return null;

    // iremos retornar um mapa dos dados, pega só o primeiro 
    return new Talk.fromMap(res.first);
 }

 Future<int> deleteTalk(int id) async {
    var bdCliente = await db;

    // where é o local de onde iremos deletar os dados
    return await bdCliente.delete(talkTable,
      where: "$id = ?", whereArgs: [id]);
  } 

   Future<int> editTalk(Talk talk) async {
    var bdCliente = await db;
    return await bdCliente.update(talkTable,
      talk.toMap(), where: "$id = ?", whereArgs: [talk.id]
    );
  }

  Future closeDB() async {
    var bdCliente = await db;
    return bdCliente.close();
  } 

}