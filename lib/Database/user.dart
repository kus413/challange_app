import 'package:floor/floor.dart';
import 'package:floor_generator/misc/constants.dart';
import 'package:sqflite/sqflite.dart';

@entity
class User {
  @primaryKey
  final int id;
  String name;
  String username;
  String email;
  String phone;
  String website;

  User(this.id, this.name, this.username, this.email, this.phone, this.website);
}

@Entity(tableName: 'User', foreignKeys: [
  ForeignKey(
      childColumns: ['id'], parentColumns: ['address_id'], entity: Address),
  ForeignKey(
      childColumns: ['id'], parentColumns: ['company_id'], entity: Company),
])
class extends Geo {
  final int address_id;
  String street;
  String suite;
  String city;
  String zipcode;

  @ColumnInfo(name: 'id')
  final int id;
  Address(this.street, this.suite, this.city, this.zipcode, this.address_id,
      this.id, String lat, String lng)
      : super(lat, lng);
}

class Geo {
  String lat;
  String lng;

  Geo(this.lat, this.lng);
}

class Company {
  final int company_id;
  String name;
  String catchPhrase;
  String bs;

  @ColumnInfo(name: 'id')
  final int id;

  Company(this.company_id, this.name, this.catchPhrase, this.bs, this.id);
}
