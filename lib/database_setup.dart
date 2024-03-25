import 'package:postgres/postgres.dart';



class Database_setup {
  final String host;
  final int port;
  final String databasename;
  final String username;
  final String password;

  Database_setup({
    required this.host,
    required this.port,
    required this.databasename,
    required this.username,
    required this.password,
  });

  Future<void> insertData(String name, String id, String email) async {
    final connection = PostgreSQLConnection(
      this.host, 
      this.port, 
      this.databasename,
      this.username,
      this.password, 
    );

    await connection.open();

    try{
      await connection.execute(
        'INSERT INTO users (name, id, email) VALUES (@name, @id, @email)',
        substitutionValues:{
          'name':name,
          'id':id,
          'email':email,
        },
      );

      print("Data Inserted SUCCESSFULLY");
    } catch(e){
      print("ERROR INSERTING DATA: $e");
    }
    await connection.close();
  }
}