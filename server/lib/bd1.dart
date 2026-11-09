import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:postgres/postgres.dart' as pg;

part 'bd.g.dart';

class TodoItems extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 6, max: 32)();
  TextColumn get content => text().named('body')();
  DateTimeColumn get createdAt => dateTime().nullable()();
}

class Service extends Table {
  IntColumn get code => integer()();
  TextColumn get name => text()();
  IntColumn get cost => integer()();
  IntColumn get amDeviation => integer()();
  @override
  Set<Column<Object>> get primaryKey => {code};
}

class Enterprise extends Table {
  TextColumn get inn => text().withLength(min: 10, max: 12)();
  TextColumn get name => text()();
  TextColumn get address => text()();
  TextColumn get bic => text().withLength(min: 9, max: 9)();
  @override
  Set<Column<Object>> get primaryKey => {inn};
}

class Client extends Table {
  TextColumn get password => text().withLength(min: 8, max: 20)();
  TextColumn get name => text()();
  TextColumn get login => text()();
  TextColumn get birthday => text()();
  TextColumn get email => text()();
  TextColumn get phone => text()();
  TextColumn get innEnterprise => text().references(Enterprise, #inn, onDelete: KeyAction.cascade)();
  @override
  Set<Column<Object>> get primaryKey => {login};
}

class Order extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get status => text()();
  TextColumn get enddate => text()();
  TextColumn get startdate => text()();
  TextColumn get loginClient => text().references(Client, #login,onDelete: KeyAction.cascade)();
}

class ServiceProvided extends Table {
  IntColumn get id => integer().autoIncrement()();
  Column<PgDate> get date => customType(PgTypes.date)();
  IntColumn get idOrder => integer().references(Order, #id,onDelete: KeyAction.cascade)();
}

@DriftDatabase(
  tables: [TodoItems, Service, Enterprise, Client, Order, ServiceProvided],
)
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 9;

  static QueryExecutor _openConnection() {
    return PgDatabase(
      endpoint: pg.Endpoint(
        host: 'localhost',
        database: 'postgres',
        username: 'masha',
        password: '',
      ),
      settings: pg.ConnectionSettings(sslMode: pg.SslMode.disable),
    );
  }

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onUpgrade: (m, old, n) async {
        await customStatement('DROP schema public cascade');
        await customStatement('CREATE schema public');
        await customStatement('GRANT ALL ON SCHEMA public TO postgres');
        await customStatement('GRANT ALL ON SCHEMA public TO public');
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
          await m.createTable(table);
        }

        print('Migration ended');
      },
    );
  }
}
