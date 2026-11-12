// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bd.dart';

// ignore_for_file: type=lint
class $TodoItemsTable extends TodoItems
    with TableInfo<$TodoItemsTable, TodoItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 6,
      maxTextLength: 32,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, content, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<TodoItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['body']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TodoItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      ),
    );
  }

  @override
  $TodoItemsTable createAlias(String alias) {
    return $TodoItemsTable(attachedDatabase, alias);
  }
}

class TodoItem extends DataClass implements Insertable<TodoItem> {
  final int id;
  final String title;
  final String content;
  final DateTime? createdAt;
  const TodoItem({
    required this.id,
    required this.title,
    required this.content,
    this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['body'] = Variable<String>(content);
    if (!nullToAbsent || createdAt != null) {
      map['created_at'] = Variable<DateTime>(createdAt);
    }
    return map;
  }

  TodoItemsCompanion toCompanion(bool nullToAbsent) {
    return TodoItemsCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      createdAt: createdAt == null && nullToAbsent
          ? const Value.absent()
          : Value(createdAt),
    );
  }

  factory TodoItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoItem(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<DateTime?>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<DateTime?>(createdAt),
    };
  }

  TodoItem copyWith({
    int? id,
    String? title,
    String? content,
    Value<DateTime?> createdAt = const Value.absent(),
  }) => TodoItem(
    id: id ?? this.id,
    title: title ?? this.title,
    content: content ?? this.content,
    createdAt: createdAt.present ? createdAt.value : this.createdAt,
  );
  TodoItem copyWithCompanion(TodoItemsCompanion data) {
    return TodoItem(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoItem(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoItem &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class TodoItemsCompanion extends UpdateCompanion<TodoItem> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> content;
  final Value<DateTime?> createdAt;
  const TodoItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  TodoItemsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String content,
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       content = Value(content);
  static Insertable<TodoItem> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (content != null) 'body': content,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  TodoItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? content,
    Value<DateTime?>? createdAt,
  }) {
    return TodoItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['body'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $ServiceTable extends Service with TableInfo<$ServiceTable, ServiceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<int> cost = GeneratedColumn<int>(
    'cost',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amDeviationMeta = const VerificationMeta(
    'amDeviation',
  );
  @override
  late final GeneratedColumn<int> amDeviation = GeneratedColumn<int>(
    'am_deviation',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [code, name, cost, amDeviation];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service';
  @override
  VerificationContext validateIntegrity(
    Insertable<ServiceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    } else if (isInserting) {
      context.missing(_costMeta);
    }
    if (data.containsKey('am_deviation')) {
      context.handle(
        _amDeviationMeta,
        amDeviation.isAcceptableOrUnknown(
          data['am_deviation']!,
          _amDeviationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_amDeviationMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {code};
  @override
  ServiceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceData(
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cost'],
      )!,
      amDeviation: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}am_deviation'],
      )!,
    );
  }

  @override
  $ServiceTable createAlias(String alias) {
    return $ServiceTable(attachedDatabase, alias);
  }
}

class ServiceData extends DataClass implements Insertable<ServiceData> {
  final String code;
  final String name;
  final int cost;
  final int amDeviation;
  const ServiceData({
    required this.code,
    required this.name,
    required this.cost,
    required this.amDeviation,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['code'] = Variable<String>(code);
    map['name'] = Variable<String>(name);
    map['cost'] = Variable<int>(cost);
    map['am_deviation'] = Variable<int>(amDeviation);
    return map;
  }

  ServiceCompanion toCompanion(bool nullToAbsent) {
    return ServiceCompanion(
      code: Value(code),
      name: Value(name),
      cost: Value(cost),
      amDeviation: Value(amDeviation),
    );
  }

  factory ServiceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceData(
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      cost: serializer.fromJson<int>(json['cost']),
      amDeviation: serializer.fromJson<int>(json['amDeviation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'cost': serializer.toJson<int>(cost),
      'amDeviation': serializer.toJson<int>(amDeviation),
    };
  }

  ServiceData copyWith({
    String? code,
    String? name,
    int? cost,
    int? amDeviation,
  }) => ServiceData(
    code: code ?? this.code,
    name: name ?? this.name,
    cost: cost ?? this.cost,
    amDeviation: amDeviation ?? this.amDeviation,
  );
  ServiceData copyWithCompanion(ServiceCompanion data) {
    return ServiceData(
      code: data.code.present ? data.code.value : this.code,
      name: data.name.present ? data.name.value : this.name,
      cost: data.cost.present ? data.cost.value : this.cost,
      amDeviation: data.amDeviation.present
          ? data.amDeviation.value
          : this.amDeviation,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceData(')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('cost: $cost, ')
          ..write('amDeviation: $amDeviation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(code, name, cost, amDeviation);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceData &&
          other.code == this.code &&
          other.name == this.name &&
          other.cost == this.cost &&
          other.amDeviation == this.amDeviation);
}

class ServiceCompanion extends UpdateCompanion<ServiceData> {
  final Value<String> code;
  final Value<String> name;
  final Value<int> cost;
  final Value<int> amDeviation;
  final Value<int> rowid;
  const ServiceCompanion({
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.cost = const Value.absent(),
    this.amDeviation = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ServiceCompanion.insert({
    required String code,
    required String name,
    required int cost,
    required int amDeviation,
    this.rowid = const Value.absent(),
  }) : code = Value(code),
       name = Value(name),
       cost = Value(cost),
       amDeviation = Value(amDeviation);
  static Insertable<ServiceData> custom({
    Expression<String>? code,
    Expression<String>? name,
    Expression<int>? cost,
    Expression<int>? amDeviation,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (cost != null) 'cost': cost,
      if (amDeviation != null) 'am_deviation': amDeviation,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ServiceCompanion copyWith({
    Value<String>? code,
    Value<String>? name,
    Value<int>? cost,
    Value<int>? amDeviation,
    Value<int>? rowid,
  }) {
    return ServiceCompanion(
      code: code ?? this.code,
      name: name ?? this.name,
      cost: cost ?? this.cost,
      amDeviation: amDeviation ?? this.amDeviation,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (cost.present) {
      map['cost'] = Variable<int>(cost.value);
    }
    if (amDeviation.present) {
      map['am_deviation'] = Variable<int>(amDeviation.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceCompanion(')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('cost: $cost, ')
          ..write('amDeviation: $amDeviation, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $EnterpriseTable extends Enterprise
    with TableInfo<$EnterpriseTable, EnterpriseData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EnterpriseTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _innMeta = const VerificationMeta('inn');
  @override
  late final GeneratedColumn<String> inn = GeneratedColumn<String>(
    'inn',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 10,
      maxTextLength: 12,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bicMeta = const VerificationMeta('bic');
  @override
  late final GeneratedColumn<String> bic = GeneratedColumn<String>(
    'bic',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 9,
      maxTextLength: 9,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [inn, name, address, bic];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'enterprise';
  @override
  VerificationContext validateIntegrity(
    Insertable<EnterpriseData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('inn')) {
      context.handle(
        _innMeta,
        inn.isAcceptableOrUnknown(data['inn']!, _innMeta),
      );
    } else if (isInserting) {
      context.missing(_innMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('bic')) {
      context.handle(
        _bicMeta,
        bic.isAcceptableOrUnknown(data['bic']!, _bicMeta),
      );
    } else if (isInserting) {
      context.missing(_bicMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {inn};
  @override
  EnterpriseData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EnterpriseData(
      inn: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inn'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      bic: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bic'],
      )!,
    );
  }

  @override
  $EnterpriseTable createAlias(String alias) {
    return $EnterpriseTable(attachedDatabase, alias);
  }
}

class EnterpriseData extends DataClass implements Insertable<EnterpriseData> {
  final String inn;
  final String name;
  final String address;
  final String bic;
  const EnterpriseData({
    required this.inn,
    required this.name,
    required this.address,
    required this.bic,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['inn'] = Variable<String>(inn);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['bic'] = Variable<String>(bic);
    return map;
  }

  EnterpriseCompanion toCompanion(bool nullToAbsent) {
    return EnterpriseCompanion(
      inn: Value(inn),
      name: Value(name),
      address: Value(address),
      bic: Value(bic),
    );
  }

  factory EnterpriseData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EnterpriseData(
      inn: serializer.fromJson<String>(json['inn']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      bic: serializer.fromJson<String>(json['bic']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'inn': serializer.toJson<String>(inn),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'bic': serializer.toJson<String>(bic),
    };
  }

  EnterpriseData copyWith({
    String? inn,
    String? name,
    String? address,
    String? bic,
  }) => EnterpriseData(
    inn: inn ?? this.inn,
    name: name ?? this.name,
    address: address ?? this.address,
    bic: bic ?? this.bic,
  );
  EnterpriseData copyWithCompanion(EnterpriseCompanion data) {
    return EnterpriseData(
      inn: data.inn.present ? data.inn.value : this.inn,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      bic: data.bic.present ? data.bic.value : this.bic,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EnterpriseData(')
          ..write('inn: $inn, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('bic: $bic')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(inn, name, address, bic);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EnterpriseData &&
          other.inn == this.inn &&
          other.name == this.name &&
          other.address == this.address &&
          other.bic == this.bic);
}

class EnterpriseCompanion extends UpdateCompanion<EnterpriseData> {
  final Value<String> inn;
  final Value<String> name;
  final Value<String> address;
  final Value<String> bic;
  final Value<int> rowid;
  const EnterpriseCompanion({
    this.inn = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.bic = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EnterpriseCompanion.insert({
    required String inn,
    required String name,
    required String address,
    required String bic,
    this.rowid = const Value.absent(),
  }) : inn = Value(inn),
       name = Value(name),
       address = Value(address),
       bic = Value(bic);
  static Insertable<EnterpriseData> custom({
    Expression<String>? inn,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? bic,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (inn != null) 'inn': inn,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (bic != null) 'bic': bic,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EnterpriseCompanion copyWith({
    Value<String>? inn,
    Value<String>? name,
    Value<String>? address,
    Value<String>? bic,
    Value<int>? rowid,
  }) {
    return EnterpriseCompanion(
      inn: inn ?? this.inn,
      name: name ?? this.name,
      address: address ?? this.address,
      bic: bic ?? this.bic,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (inn.present) {
      map['inn'] = Variable<String>(inn.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (bic.present) {
      map['bic'] = Variable<String>(bic.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EnterpriseCompanion(')
          ..write('inn: $inn, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('bic: $bic, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ClientTable extends Client with TableInfo<$ClientTable, ClientData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 8,
      maxTextLength: 20,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
    'login',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _birthdayMeta = const VerificationMeta(
    'birthday',
  );
  @override
  late final GeneratedColumn<String> birthday = GeneratedColumn<String>(
    'birthday',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _innEnterpriseMeta = const VerificationMeta(
    'innEnterprise',
  );
  @override
  late final GeneratedColumn<String> innEnterprise = GeneratedColumn<String>(
    'inn_enterprise',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES enterprise (inn) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    password,
    name,
    login,
    birthday,
    email,
    phone,
    innEnterprise,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'client';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClientData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('login')) {
      context.handle(
        _loginMeta,
        login.isAcceptableOrUnknown(data['login']!, _loginMeta),
      );
    } else if (isInserting) {
      context.missing(_loginMeta);
    }
    if (data.containsKey('birthday')) {
      context.handle(
        _birthdayMeta,
        birthday.isAcceptableOrUnknown(data['birthday']!, _birthdayMeta),
      );
    } else if (isInserting) {
      context.missing(_birthdayMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('inn_enterprise')) {
      context.handle(
        _innEnterpriseMeta,
        innEnterprise.isAcceptableOrUnknown(
          data['inn_enterprise']!,
          _innEnterpriseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_innEnterpriseMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {login};
  @override
  ClientData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClientData(
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      login: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}login'],
      )!,
      birthday: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}birthday'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      innEnterprise: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inn_enterprise'],
      )!,
    );
  }

  @override
  $ClientTable createAlias(String alias) {
    return $ClientTable(attachedDatabase, alias);
  }
}

class ClientData extends DataClass implements Insertable<ClientData> {
  final String password;
  final String name;
  final String login;
  final String birthday;
  final String email;
  final String phone;
  final String innEnterprise;
  const ClientData({
    required this.password,
    required this.name,
    required this.login,
    required this.birthday,
    required this.email,
    required this.phone,
    required this.innEnterprise,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['password'] = Variable<String>(password);
    map['name'] = Variable<String>(name);
    map['login'] = Variable<String>(login);
    map['birthday'] = Variable<String>(birthday);
    map['email'] = Variable<String>(email);
    map['phone'] = Variable<String>(phone);
    map['inn_enterprise'] = Variable<String>(innEnterprise);
    return map;
  }

  ClientCompanion toCompanion(bool nullToAbsent) {
    return ClientCompanion(
      password: Value(password),
      name: Value(name),
      login: Value(login),
      birthday: Value(birthday),
      email: Value(email),
      phone: Value(phone),
      innEnterprise: Value(innEnterprise),
    );
  }

  factory ClientData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClientData(
      password: serializer.fromJson<String>(json['password']),
      name: serializer.fromJson<String>(json['name']),
      login: serializer.fromJson<String>(json['login']),
      birthday: serializer.fromJson<String>(json['birthday']),
      email: serializer.fromJson<String>(json['email']),
      phone: serializer.fromJson<String>(json['phone']),
      innEnterprise: serializer.fromJson<String>(json['innEnterprise']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'password': serializer.toJson<String>(password),
      'name': serializer.toJson<String>(name),
      'login': serializer.toJson<String>(login),
      'birthday': serializer.toJson<String>(birthday),
      'email': serializer.toJson<String>(email),
      'phone': serializer.toJson<String>(phone),
      'innEnterprise': serializer.toJson<String>(innEnterprise),
    };
  }

  ClientData copyWith({
    String? password,
    String? name,
    String? login,
    String? birthday,
    String? email,
    String? phone,
    String? innEnterprise,
  }) => ClientData(
    password: password ?? this.password,
    name: name ?? this.name,
    login: login ?? this.login,
    birthday: birthday ?? this.birthday,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    innEnterprise: innEnterprise ?? this.innEnterprise,
  );
  ClientData copyWithCompanion(ClientCompanion data) {
    return ClientData(
      password: data.password.present ? data.password.value : this.password,
      name: data.name.present ? data.name.value : this.name,
      login: data.login.present ? data.login.value : this.login,
      birthday: data.birthday.present ? data.birthday.value : this.birthday,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      innEnterprise: data.innEnterprise.present
          ? data.innEnterprise.value
          : this.innEnterprise,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClientData(')
          ..write('password: $password, ')
          ..write('name: $name, ')
          ..write('login: $login, ')
          ..write('birthday: $birthday, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('innEnterprise: $innEnterprise')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(password, name, login, birthday, email, phone, innEnterprise);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClientData &&
          other.password == this.password &&
          other.name == this.name &&
          other.login == this.login &&
          other.birthday == this.birthday &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.innEnterprise == this.innEnterprise);
}

class ClientCompanion extends UpdateCompanion<ClientData> {
  final Value<String> password;
  final Value<String> name;
  final Value<String> login;
  final Value<String> birthday;
  final Value<String> email;
  final Value<String> phone;
  final Value<String> innEnterprise;
  final Value<int> rowid;
  const ClientCompanion({
    this.password = const Value.absent(),
    this.name = const Value.absent(),
    this.login = const Value.absent(),
    this.birthday = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.innEnterprise = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClientCompanion.insert({
    required String password,
    required String name,
    required String login,
    required String birthday,
    required String email,
    required String phone,
    required String innEnterprise,
    this.rowid = const Value.absent(),
  }) : password = Value(password),
       name = Value(name),
       login = Value(login),
       birthday = Value(birthday),
       email = Value(email),
       phone = Value(phone),
       innEnterprise = Value(innEnterprise);
  static Insertable<ClientData> custom({
    Expression<String>? password,
    Expression<String>? name,
    Expression<String>? login,
    Expression<String>? birthday,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? innEnterprise,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (password != null) 'password': password,
      if (name != null) 'name': name,
      if (login != null) 'login': login,
      if (birthday != null) 'birthday': birthday,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (innEnterprise != null) 'inn_enterprise': innEnterprise,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClientCompanion copyWith({
    Value<String>? password,
    Value<String>? name,
    Value<String>? login,
    Value<String>? birthday,
    Value<String>? email,
    Value<String>? phone,
    Value<String>? innEnterprise,
    Value<int>? rowid,
  }) {
    return ClientCompanion(
      password: password ?? this.password,
      name: name ?? this.name,
      login: login ?? this.login,
      birthday: birthday ?? this.birthday,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      innEnterprise: innEnterprise ?? this.innEnterprise,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (birthday.present) {
      map['birthday'] = Variable<String>(birthday.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (innEnterprise.present) {
      map['inn_enterprise'] = Variable<String>(innEnterprise.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientCompanion(')
          ..write('password: $password, ')
          ..write('name: $name, ')
          ..write('login: $login, ')
          ..write('birthday: $birthday, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('innEnterprise: $innEnterprise, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LaborantTable extends Laborant
    with TableInfo<$LaborantTable, LaborantData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LaborantTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _fioMeta = const VerificationMeta('fio');
  @override
  late final GeneratedColumn<String> fio = GeneratedColumn<String>(
    'fio',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loginMeta = const VerificationMeta('login');
  @override
  late final GeneratedColumn<String> login = GeneratedColumn<String>(
    'login',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [fio, login, password];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'laborant';
  @override
  VerificationContext validateIntegrity(
    Insertable<LaborantData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('fio')) {
      context.handle(
        _fioMeta,
        fio.isAcceptableOrUnknown(data['fio']!, _fioMeta),
      );
    } else if (isInserting) {
      context.missing(_fioMeta);
    }
    if (data.containsKey('login')) {
      context.handle(
        _loginMeta,
        login.isAcceptableOrUnknown(data['login']!, _loginMeta),
      );
    } else if (isInserting) {
      context.missing(_loginMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {login};
  @override
  LaborantData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LaborantData(
      fio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fio'],
      )!,
      login: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}login'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
    );
  }

  @override
  $LaborantTable createAlias(String alias) {
    return $LaborantTable(attachedDatabase, alias);
  }
}

class LaborantData extends DataClass implements Insertable<LaborantData> {
  final String fio;
  final String login;
  final String password;
  const LaborantData({
    required this.fio,
    required this.login,
    required this.password,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['fio'] = Variable<String>(fio);
    map['login'] = Variable<String>(login);
    map['password'] = Variable<String>(password);
    return map;
  }

  LaborantCompanion toCompanion(bool nullToAbsent) {
    return LaborantCompanion(
      fio: Value(fio),
      login: Value(login),
      password: Value(password),
    );
  }

  factory LaborantData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LaborantData(
      fio: serializer.fromJson<String>(json['fio']),
      login: serializer.fromJson<String>(json['login']),
      password: serializer.fromJson<String>(json['password']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'fio': serializer.toJson<String>(fio),
      'login': serializer.toJson<String>(login),
      'password': serializer.toJson<String>(password),
    };
  }

  LaborantData copyWith({String? fio, String? login, String? password}) =>
      LaborantData(
        fio: fio ?? this.fio,
        login: login ?? this.login,
        password: password ?? this.password,
      );
  LaborantData copyWithCompanion(LaborantCompanion data) {
    return LaborantData(
      fio: data.fio.present ? data.fio.value : this.fio,
      login: data.login.present ? data.login.value : this.login,
      password: data.password.present ? data.password.value : this.password,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LaborantData(')
          ..write('fio: $fio, ')
          ..write('login: $login, ')
          ..write('password: $password')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(fio, login, password);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LaborantData &&
          other.fio == this.fio &&
          other.login == this.login &&
          other.password == this.password);
}

class LaborantCompanion extends UpdateCompanion<LaborantData> {
  final Value<String> fio;
  final Value<String> login;
  final Value<String> password;
  final Value<int> rowid;
  const LaborantCompanion({
    this.fio = const Value.absent(),
    this.login = const Value.absent(),
    this.password = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LaborantCompanion.insert({
    required String fio,
    required String login,
    required String password,
    this.rowid = const Value.absent(),
  }) : fio = Value(fio),
       login = Value(login),
       password = Value(password);
  static Insertable<LaborantData> custom({
    Expression<String>? fio,
    Expression<String>? login,
    Expression<String>? password,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (fio != null) 'fio': fio,
      if (login != null) 'login': login,
      if (password != null) 'password': password,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LaborantCompanion copyWith({
    Value<String>? fio,
    Value<String>? login,
    Value<String>? password,
    Value<int>? rowid,
  }) {
    return LaborantCompanion(
      fio: fio ?? this.fio,
      login: login ?? this.login,
      password: password ?? this.password,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (fio.present) {
      map['fio'] = Variable<String>(fio.value);
    }
    if (login.present) {
      map['login'] = Variable<String>(login.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LaborantCompanion(')
          ..write('fio: $fio, ')
          ..write('login: $login, ')
          ..write('password: $password, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrderTable extends Order with TableInfo<$OrderTable, OrderData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enddateMeta = const VerificationMeta(
    'enddate',
  );
  @override
  late final GeneratedColumn<String> enddate = GeneratedColumn<String>(
    'enddate',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startdateMeta = const VerificationMeta(
    'startdate',
  );
  @override
  late final GeneratedColumn<String> startdate = GeneratedColumn<String>(
    'startdate',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _loginClientMeta = const VerificationMeta(
    'loginClient',
  );
  @override
  late final GeneratedColumn<String> loginClient = GeneratedColumn<String>(
    'login_client',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES client (login) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _loginLaborantMeta = const VerificationMeta(
    'loginLaborant',
  );
  @override
  late final GeneratedColumn<String> loginLaborant = GeneratedColumn<String>(
    'login_laborant',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES laborant (login) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    number,
    code,
    status,
    enddate,
    startdate,
    loginClient,
    loginLaborant,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrderData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('enddate')) {
      context.handle(
        _enddateMeta,
        enddate.isAcceptableOrUnknown(data['enddate']!, _enddateMeta),
      );
    } else if (isInserting) {
      context.missing(_enddateMeta);
    }
    if (data.containsKey('startdate')) {
      context.handle(
        _startdateMeta,
        startdate.isAcceptableOrUnknown(data['startdate']!, _startdateMeta),
      );
    } else if (isInserting) {
      context.missing(_startdateMeta);
    }
    if (data.containsKey('login_client')) {
      context.handle(
        _loginClientMeta,
        loginClient.isAcceptableOrUnknown(
          data['login_client']!,
          _loginClientMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_loginClientMeta);
    }
    if (data.containsKey('login_laborant')) {
      context.handle(
        _loginLaborantMeta,
        loginLaborant.isAcceptableOrUnknown(
          data['login_laborant']!,
          _loginLaborantMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_loginLaborantMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {number};
  @override
  OrderData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderData(
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      enddate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}enddate'],
      )!,
      startdate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}startdate'],
      )!,
      loginClient: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}login_client'],
      )!,
      loginLaborant: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}login_laborant'],
      )!,
    );
  }

  @override
  $OrderTable createAlias(String alias) {
    return $OrderTable(attachedDatabase, alias);
  }
}

class OrderData extends DataClass implements Insertable<OrderData> {
  final int number;
  final String code;
  final String status;
  final String enddate;
  final String startdate;
  final String loginClient;
  final String loginLaborant;
  const OrderData({
    required this.number,
    required this.code,
    required this.status,
    required this.enddate,
    required this.startdate,
    required this.loginClient,
    required this.loginLaborant,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['number'] = Variable<int>(number);
    map['code'] = Variable<String>(code);
    map['status'] = Variable<String>(status);
    map['enddate'] = Variable<String>(enddate);
    map['startdate'] = Variable<String>(startdate);
    map['login_client'] = Variable<String>(loginClient);
    map['login_laborant'] = Variable<String>(loginLaborant);
    return map;
  }

  OrderCompanion toCompanion(bool nullToAbsent) {
    return OrderCompanion(
      number: Value(number),
      code: Value(code),
      status: Value(status),
      enddate: Value(enddate),
      startdate: Value(startdate),
      loginClient: Value(loginClient),
      loginLaborant: Value(loginLaborant),
    );
  }

  factory OrderData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderData(
      number: serializer.fromJson<int>(json['number']),
      code: serializer.fromJson<String>(json['code']),
      status: serializer.fromJson<String>(json['status']),
      enddate: serializer.fromJson<String>(json['enddate']),
      startdate: serializer.fromJson<String>(json['startdate']),
      loginClient: serializer.fromJson<String>(json['loginClient']),
      loginLaborant: serializer.fromJson<String>(json['loginLaborant']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'number': serializer.toJson<int>(number),
      'code': serializer.toJson<String>(code),
      'status': serializer.toJson<String>(status),
      'enddate': serializer.toJson<String>(enddate),
      'startdate': serializer.toJson<String>(startdate),
      'loginClient': serializer.toJson<String>(loginClient),
      'loginLaborant': serializer.toJson<String>(loginLaborant),
    };
  }

  OrderData copyWith({
    int? number,
    String? code,
    String? status,
    String? enddate,
    String? startdate,
    String? loginClient,
    String? loginLaborant,
  }) => OrderData(
    number: number ?? this.number,
    code: code ?? this.code,
    status: status ?? this.status,
    enddate: enddate ?? this.enddate,
    startdate: startdate ?? this.startdate,
    loginClient: loginClient ?? this.loginClient,
    loginLaborant: loginLaborant ?? this.loginLaborant,
  );
  OrderData copyWithCompanion(OrderCompanion data) {
    return OrderData(
      number: data.number.present ? data.number.value : this.number,
      code: data.code.present ? data.code.value : this.code,
      status: data.status.present ? data.status.value : this.status,
      enddate: data.enddate.present ? data.enddate.value : this.enddate,
      startdate: data.startdate.present ? data.startdate.value : this.startdate,
      loginClient: data.loginClient.present
          ? data.loginClient.value
          : this.loginClient,
      loginLaborant: data.loginLaborant.present
          ? data.loginLaborant.value
          : this.loginLaborant,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderData(')
          ..write('number: $number, ')
          ..write('code: $code, ')
          ..write('status: $status, ')
          ..write('enddate: $enddate, ')
          ..write('startdate: $startdate, ')
          ..write('loginClient: $loginClient, ')
          ..write('loginLaborant: $loginLaborant')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    number,
    code,
    status,
    enddate,
    startdate,
    loginClient,
    loginLaborant,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderData &&
          other.number == this.number &&
          other.code == this.code &&
          other.status == this.status &&
          other.enddate == this.enddate &&
          other.startdate == this.startdate &&
          other.loginClient == this.loginClient &&
          other.loginLaborant == this.loginLaborant);
}

class OrderCompanion extends UpdateCompanion<OrderData> {
  final Value<int> number;
  final Value<String> code;
  final Value<String> status;
  final Value<String> enddate;
  final Value<String> startdate;
  final Value<String> loginClient;
  final Value<String> loginLaborant;
  const OrderCompanion({
    this.number = const Value.absent(),
    this.code = const Value.absent(),
    this.status = const Value.absent(),
    this.enddate = const Value.absent(),
    this.startdate = const Value.absent(),
    this.loginClient = const Value.absent(),
    this.loginLaborant = const Value.absent(),
  });
  OrderCompanion.insert({
    this.number = const Value.absent(),
    required String code,
    required String status,
    required String enddate,
    required String startdate,
    required String loginClient,
    required String loginLaborant,
  }) : code = Value(code),
       status = Value(status),
       enddate = Value(enddate),
       startdate = Value(startdate),
       loginClient = Value(loginClient),
       loginLaborant = Value(loginLaborant);
  static Insertable<OrderData> custom({
    Expression<int>? number,
    Expression<String>? code,
    Expression<String>? status,
    Expression<String>? enddate,
    Expression<String>? startdate,
    Expression<String>? loginClient,
    Expression<String>? loginLaborant,
  }) {
    return RawValuesInsertable({
      if (number != null) 'number': number,
      if (code != null) 'code': code,
      if (status != null) 'status': status,
      if (enddate != null) 'enddate': enddate,
      if (startdate != null) 'startdate': startdate,
      if (loginClient != null) 'login_client': loginClient,
      if (loginLaborant != null) 'login_laborant': loginLaborant,
    });
  }

  OrderCompanion copyWith({
    Value<int>? number,
    Value<String>? code,
    Value<String>? status,
    Value<String>? enddate,
    Value<String>? startdate,
    Value<String>? loginClient,
    Value<String>? loginLaborant,
  }) {
    return OrderCompanion(
      number: number ?? this.number,
      code: code ?? this.code,
      status: status ?? this.status,
      enddate: enddate ?? this.enddate,
      startdate: startdate ?? this.startdate,
      loginClient: loginClient ?? this.loginClient,
      loginLaborant: loginLaborant ?? this.loginLaborant,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (enddate.present) {
      map['enddate'] = Variable<String>(enddate.value);
    }
    if (startdate.present) {
      map['startdate'] = Variable<String>(startdate.value);
    }
    if (loginClient.present) {
      map['login_client'] = Variable<String>(loginClient.value);
    }
    if (loginLaborant.present) {
      map['login_laborant'] = Variable<String>(loginLaborant.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderCompanion(')
          ..write('number: $number, ')
          ..write('code: $code, ')
          ..write('status: $status, ')
          ..write('enddate: $enddate, ')
          ..write('startdate: $startdate, ')
          ..write('loginClient: $loginClient, ')
          ..write('loginLaborant: $loginLaborant')
          ..write(')'))
        .toString();
  }
}

class $ServiceProvidedTable extends ServiceProvided
    with TableInfo<$ServiceProvidedTable, ServiceProvidedData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceProvidedTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<PgDate> date = GeneratedColumn<PgDate>(
    'date',
    aliasedName,
    false,
    type: PgTypes.date,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idOrderMeta = const VerificationMeta(
    'idOrder',
  );
  @override
  late final GeneratedColumn<int> idOrder = GeneratedColumn<int>(
    'id_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES "order" (number) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, idOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_provided';
  @override
  VerificationContext validateIntegrity(
    Insertable<ServiceProvidedData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('id_order')) {
      context.handle(
        _idOrderMeta,
        idOrder.isAcceptableOrUnknown(data['id_order']!, _idOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_idOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceProvidedData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceProvidedData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        PgTypes.date,
        data['${effectivePrefix}date'],
      )!,
      idOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_order'],
      )!,
    );
  }

  @override
  $ServiceProvidedTable createAlias(String alias) {
    return $ServiceProvidedTable(attachedDatabase, alias);
  }
}

class ServiceProvidedData extends DataClass
    implements Insertable<ServiceProvidedData> {
  final int id;
  final PgDate date;
  final int idOrder;
  const ServiceProvidedData({
    required this.id,
    required this.date,
    required this.idOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date'] = Variable<PgDate>(date, PgTypes.date);
    map['id_order'] = Variable<int>(idOrder);
    return map;
  }

  ServiceProvidedCompanion toCompanion(bool nullToAbsent) {
    return ServiceProvidedCompanion(
      id: Value(id),
      date: Value(date),
      idOrder: Value(idOrder),
    );
  }

  factory ServiceProvidedData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceProvidedData(
      id: serializer.fromJson<int>(json['id']),
      date: serializer.fromJson<PgDate>(json['date']),
      idOrder: serializer.fromJson<int>(json['idOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'date': serializer.toJson<PgDate>(date),
      'idOrder': serializer.toJson<int>(idOrder),
    };
  }

  ServiceProvidedData copyWith({int? id, PgDate? date, int? idOrder}) =>
      ServiceProvidedData(
        id: id ?? this.id,
        date: date ?? this.date,
        idOrder: idOrder ?? this.idOrder,
      );
  ServiceProvidedData copyWithCompanion(ServiceProvidedCompanion data) {
    return ServiceProvidedData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      idOrder: data.idOrder.present ? data.idOrder.value : this.idOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceProvidedData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('idOrder: $idOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, idOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceProvidedData &&
          other.id == this.id &&
          other.date == this.date &&
          other.idOrder == this.idOrder);
}

class ServiceProvidedCompanion extends UpdateCompanion<ServiceProvidedData> {
  final Value<int> id;
  final Value<PgDate> date;
  final Value<int> idOrder;
  const ServiceProvidedCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.idOrder = const Value.absent(),
  });
  ServiceProvidedCompanion.insert({
    this.id = const Value.absent(),
    required PgDate date,
    required int idOrder,
  }) : date = Value(date),
       idOrder = Value(idOrder);
  static Insertable<ServiceProvidedData> custom({
    Expression<int>? id,
    Expression<PgDate>? date,
    Expression<int>? idOrder,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (idOrder != null) 'id_order': idOrder,
    });
  }

  ServiceProvidedCompanion copyWith({
    Value<int>? id,
    Value<PgDate>? date,
    Value<int>? idOrder,
  }) {
    return ServiceProvidedCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      idOrder: idOrder ?? this.idOrder,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<PgDate>(date.value, PgTypes.date);
    }
    if (idOrder.present) {
      map['id_order'] = Variable<int>(idOrder.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceProvidedCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('idOrder: $idOrder')
          ..write(')'))
        .toString();
  }
}

class $EmployeeServiceTable extends EmployeeService
    with TableInfo<$EmployeeServiceTable, EmployeeServiceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EmployeeServiceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _employeeLoginMeta = const VerificationMeta(
    'employeeLogin',
  );
  @override
  late final GeneratedColumn<String> employeeLogin = GeneratedColumn<String>(
    'employee_login',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES laborant (login) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES service (code) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [employeeLogin, code];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'employee_service';
  @override
  VerificationContext validateIntegrity(
    Insertable<EmployeeServiceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('employee_login')) {
      context.handle(
        _employeeLoginMeta,
        employeeLogin.isAcceptableOrUnknown(
          data['employee_login']!,
          _employeeLoginMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_employeeLoginMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  EmployeeServiceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EmployeeServiceData(
      employeeLogin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}employee_login'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      )!,
    );
  }

  @override
  $EmployeeServiceTable createAlias(String alias) {
    return $EmployeeServiceTable(attachedDatabase, alias);
  }
}

class EmployeeServiceData extends DataClass
    implements Insertable<EmployeeServiceData> {
  final String employeeLogin;
  final String code;
  const EmployeeServiceData({required this.employeeLogin, required this.code});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['employee_login'] = Variable<String>(employeeLogin);
    map['code'] = Variable<String>(code);
    return map;
  }

  EmployeeServiceCompanion toCompanion(bool nullToAbsent) {
    return EmployeeServiceCompanion(
      employeeLogin: Value(employeeLogin),
      code: Value(code),
    );
  }

  factory EmployeeServiceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EmployeeServiceData(
      employeeLogin: serializer.fromJson<String>(json['employeeLogin']),
      code: serializer.fromJson<String>(json['code']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'employeeLogin': serializer.toJson<String>(employeeLogin),
      'code': serializer.toJson<String>(code),
    };
  }

  EmployeeServiceData copyWith({String? employeeLogin, String? code}) =>
      EmployeeServiceData(
        employeeLogin: employeeLogin ?? this.employeeLogin,
        code: code ?? this.code,
      );
  EmployeeServiceData copyWithCompanion(EmployeeServiceCompanion data) {
    return EmployeeServiceData(
      employeeLogin: data.employeeLogin.present
          ? data.employeeLogin.value
          : this.employeeLogin,
      code: data.code.present ? data.code.value : this.code,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeServiceData(')
          ..write('employeeLogin: $employeeLogin, ')
          ..write('code: $code')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(employeeLogin, code);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EmployeeServiceData &&
          other.employeeLogin == this.employeeLogin &&
          other.code == this.code);
}

class EmployeeServiceCompanion extends UpdateCompanion<EmployeeServiceData> {
  final Value<String> employeeLogin;
  final Value<String> code;
  final Value<int> rowid;
  const EmployeeServiceCompanion({
    this.employeeLogin = const Value.absent(),
    this.code = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  EmployeeServiceCompanion.insert({
    required String employeeLogin,
    required String code,
    this.rowid = const Value.absent(),
  }) : employeeLogin = Value(employeeLogin),
       code = Value(code);
  static Insertable<EmployeeServiceData> custom({
    Expression<String>? employeeLogin,
    Expression<String>? code,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (employeeLogin != null) 'employee_login': employeeLogin,
      if (code != null) 'code': code,
      if (rowid != null) 'rowid': rowid,
    });
  }

  EmployeeServiceCompanion copyWith({
    Value<String>? employeeLogin,
    Value<String>? code,
    Value<int>? rowid,
  }) {
    return EmployeeServiceCompanion(
      employeeLogin: employeeLogin ?? this.employeeLogin,
      code: code ?? this.code,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (employeeLogin.present) {
      map['employee_login'] = Variable<String>(employeeLogin.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EmployeeServiceCompanion(')
          ..write('employeeLogin: $employeeLogin, ')
          ..write('code: $code, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $TodoItemsTable todoItems = $TodoItemsTable(this);
  late final $ServiceTable service = $ServiceTable(this);
  late final $EnterpriseTable enterprise = $EnterpriseTable(this);
  late final $ClientTable client = $ClientTable(this);
  late final $LaborantTable laborant = $LaborantTable(this);
  late final $OrderTable order = $OrderTable(this);
  late final $ServiceProvidedTable serviceProvided = $ServiceProvidedTable(
    this,
  );
  late final $EmployeeServiceTable employeeService = $EmployeeServiceTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    todoItems,
    service,
    enterprise,
    client,
    laborant,
    order,
    serviceProvided,
    employeeService,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'enterprise',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('client', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'client',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('order', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'laborant',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('order', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'order',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('service_provided', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'laborant',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('employee_service', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'service',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('employee_service', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$TodoItemsTableCreateCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  required String title,
  required String content,
  Value<DateTime?> createdAt,
});
typedef $$TodoItemsTableUpdateCompanionBuilder = TodoItemsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> content,
  Value<DateTime?> createdAt,
});

class $$TodoItemsTableFilterComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$TodoItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$TodoItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodoItemsTable> {
  $$TodoItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$TodoItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TodoItemsTable,
          TodoItem,
          $$TodoItemsTableFilterComposer,
          $$TodoItemsTableOrderingComposer,
          $$TodoItemsTableAnnotationComposer,
          $$TodoItemsTableCreateCompanionBuilder,
          $$TodoItemsTableUpdateCompanionBuilder,
          (TodoItem, BaseReferences<_$AppDatabase, $TodoItemsTable, TodoItem>),
          TodoItem,
          PrefetchHooks Function()
        > {
  $$TodoItemsTableTableManager(_$AppDatabase db, $TodoItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodoItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodoItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodoItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<DateTime?> createdAt = const Value.absent(),
              }) => TodoItemsCompanion(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String content,
                Value<DateTime?> createdAt = const Value.absent(),
              }) => TodoItemsCompanion.insert(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$TodoItemsTable, TodoItem>(table),
                  BaseReferences<_$AppDatabase, $TodoItemsTable, TodoItem>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$TodoItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TodoItemsTable,
      TodoItem,
      $$TodoItemsTableFilterComposer,
      $$TodoItemsTableOrderingComposer,
      $$TodoItemsTableAnnotationComposer,
      $$TodoItemsTableCreateCompanionBuilder,
      $$TodoItemsTableUpdateCompanionBuilder,
      (TodoItem, BaseReferences<_$AppDatabase, $TodoItemsTable, TodoItem>),
      TodoItem,
      PrefetchHooks Function()
    >;
typedef $$ServiceTableCreateCompanionBuilder = ServiceCompanion Function({
  required String code,
  required String name,
  required int cost,
  required int amDeviation,
  Value<int> rowid,
});
typedef $$ServiceTableUpdateCompanionBuilder = ServiceCompanion Function({
  Value<String> code,
  Value<String> name,
  Value<int> cost,
  Value<int> amDeviation,
  Value<int> rowid,
});

final class $$ServiceTableReferences
    extends BaseReferences<_$AppDatabase, $ServiceTable, ServiceData> {
  $$ServiceTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$EmployeeServiceTable, List<EmployeeServiceData>>
  _employeeServiceRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.employeeService,
    aliasName: 'service__code__employee_service__code',
  );

  $$EmployeeServiceTableProcessedTableManager get employeeServiceRefs {
    final manager = $$EmployeeServiceTableTableManager(
      $_db,
      $_db.employeeService,
    ).filter((f) => f.code.code.sqlEquals($_itemColumn<String>('code')!));

    final cache = $_typedResult.readTableOrNull(
      _employeeServiceRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ServiceTableFilterComposer
    extends Composer<_$AppDatabase, $ServiceTable> {
  $$ServiceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get amDeviation => $composableBuilder(
    column: $table.amDeviation,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> employeeServiceRefs(
    Expression<bool> Function($$EmployeeServiceTableFilterComposer f) f,
  ) {
    final $$EmployeeServiceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.code,
      referencedTable: $db.employeeService,
      getReferencedColumn: (t) => t.code,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeServiceTableFilterComposer(
            $db: $db,
            $table: $db.employeeService,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ServiceTableOrderingComposer
    extends Composer<_$AppDatabase, $ServiceTable> {
  $$ServiceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get amDeviation => $composableBuilder(
    column: $table.amDeviation,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ServiceTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServiceTable> {
  $$ServiceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<int> get amDeviation => $composableBuilder(
    column: $table.amDeviation,
    builder: (column) => column,
  );

  Expression<T> employeeServiceRefs<T extends Object>(
    Expression<T> Function($$EmployeeServiceTableAnnotationComposer a) f,
  ) {
    final $$EmployeeServiceTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.code,
      referencedTable: $db.employeeService,
      getReferencedColumn: (t) => t.code,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeServiceTableAnnotationComposer(
            $db: $db,
            $table: $db.employeeService,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ServiceTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ServiceTable,
          ServiceData,
          $$ServiceTableFilterComposer,
          $$ServiceTableOrderingComposer,
          $$ServiceTableAnnotationComposer,
          $$ServiceTableCreateCompanionBuilder,
          $$ServiceTableUpdateCompanionBuilder,
          (ServiceData, $$ServiceTableReferences),
          ServiceData,
          PrefetchHooks Function({bool employeeServiceRefs})
        > {
  $$ServiceTableTableManager(_$AppDatabase db, $ServiceTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> code = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> cost = const Value.absent(),
                Value<int> amDeviation = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ServiceCompanion(
                code: code,
                name: name,
                cost: cost,
                amDeviation: amDeviation,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String code,
                required String name,
                required int cost,
                required int amDeviation,
                Value<int> rowid = const Value.absent(),
              }) => ServiceCompanion.insert(
                code: code,
                name: name,
                cost: cost,
                amDeviation: amDeviation,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ServiceTable, ServiceData>(table),
                  $$ServiceTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({employeeServiceRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (employeeServiceRefs) db.employeeService,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (employeeServiceRefs)
                    await $_getPrefetchedDataByColumns<
                      ServiceData,
                      $ServiceTable,
                      EmployeeServiceData,
                      $EmployeeServiceTable
                    >(
                      currentTable: table,
                      referencedTable: $$ServiceTableReferences
                          ._employeeServiceRefsTable(db),
                      managerFromTypedResult: (p0) => $$ServiceTableReferences(
                        db,
                        table,
                        p0,
                      ).employeeServiceRefs,
                      currentColumn: 'code',
                      referencedColumn: 'code',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ServiceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ServiceTable,
      ServiceData,
      $$ServiceTableFilterComposer,
      $$ServiceTableOrderingComposer,
      $$ServiceTableAnnotationComposer,
      $$ServiceTableCreateCompanionBuilder,
      $$ServiceTableUpdateCompanionBuilder,
      (ServiceData, $$ServiceTableReferences),
      ServiceData,
      PrefetchHooks Function({bool employeeServiceRefs})
    >;
typedef $$EnterpriseTableCreateCompanionBuilder = EnterpriseCompanion Function({
  required String inn,
  required String name,
  required String address,
  required String bic,
  Value<int> rowid,
});
typedef $$EnterpriseTableUpdateCompanionBuilder = EnterpriseCompanion Function({
  Value<String> inn,
  Value<String> name,
  Value<String> address,
  Value<String> bic,
  Value<int> rowid,
});

final class $$EnterpriseTableReferences
    extends BaseReferences<_$AppDatabase, $EnterpriseTable, EnterpriseData> {
  $$EnterpriseTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ClientTable, List<ClientData>> _clientRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.client,
    aliasName: 'enterprise__inn__client__inn_enterprise',
  );

  $$ClientTableProcessedTableManager get clientRefs {
    final manager = $$ClientTableTableManager($_db, $_db.client).filter(
      (f) => f.innEnterprise.inn.sqlEquals($_itemColumn<String>('inn')!),
    );

    final cache = $_typedResult.readTableOrNull(_clientRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EnterpriseTableFilterComposer
    extends Composer<_$AppDatabase, $EnterpriseTable> {
  $$EnterpriseTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get inn => $composableBuilder(
    column: $table.inn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bic => $composableBuilder(
    column: $table.bic,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> clientRefs(
    Expression<bool> Function($$ClientTableFilterComposer f) f,
  ) {
    final $$ClientTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inn,
      referencedTable: $db.client,
      getReferencedColumn: (t) => t.innEnterprise,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientTableFilterComposer(
            $db: $db,
            $table: $db.client,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EnterpriseTableOrderingComposer
    extends Composer<_$AppDatabase, $EnterpriseTable> {
  $$EnterpriseTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get inn => $composableBuilder(
    column: $table.inn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bic => $composableBuilder(
    column: $table.bic,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$EnterpriseTableAnnotationComposer
    extends Composer<_$AppDatabase, $EnterpriseTable> {
  $$EnterpriseTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get inn =>
      $composableBuilder(column: $table.inn, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get bic =>
      $composableBuilder(column: $table.bic, builder: (column) => column);

  Expression<T> clientRefs<T extends Object>(
    Expression<T> Function($$ClientTableAnnotationComposer a) f,
  ) {
    final $$ClientTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inn,
      referencedTable: $db.client,
      getReferencedColumn: (t) => t.innEnterprise,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientTableAnnotationComposer(
            $db: $db,
            $table: $db.client,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EnterpriseTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EnterpriseTable,
          EnterpriseData,
          $$EnterpriseTableFilterComposer,
          $$EnterpriseTableOrderingComposer,
          $$EnterpriseTableAnnotationComposer,
          $$EnterpriseTableCreateCompanionBuilder,
          $$EnterpriseTableUpdateCompanionBuilder,
          (EnterpriseData, $$EnterpriseTableReferences),
          EnterpriseData,
          PrefetchHooks Function({bool clientRefs})
        > {
  $$EnterpriseTableTableManager(_$AppDatabase db, $EnterpriseTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EnterpriseTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EnterpriseTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EnterpriseTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> inn = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> bic = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EnterpriseCompanion(
                inn: inn,
                name: name,
                address: address,
                bic: bic,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String inn,
                required String name,
                required String address,
                required String bic,
                Value<int> rowid = const Value.absent(),
              }) => EnterpriseCompanion.insert(
                inn: inn,
                name: name,
                address: address,
                bic: bic,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$EnterpriseTable, EnterpriseData>(table),
                  $$EnterpriseTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({clientRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (clientRefs) db.client],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (clientRefs)
                    await $_getPrefetchedDataByColumns<
                      EnterpriseData,
                      $EnterpriseTable,
                      ClientData,
                      $ClientTable
                    >(
                      currentTable: table,
                      referencedTable: $$EnterpriseTableReferences
                          ._clientRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$EnterpriseTableReferences(db, table, p0).clientRefs,
                      currentColumn: 'inn',
                      referencedColumn: 'inn_enterprise',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$EnterpriseTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EnterpriseTable,
      EnterpriseData,
      $$EnterpriseTableFilterComposer,
      $$EnterpriseTableOrderingComposer,
      $$EnterpriseTableAnnotationComposer,
      $$EnterpriseTableCreateCompanionBuilder,
      $$EnterpriseTableUpdateCompanionBuilder,
      (EnterpriseData, $$EnterpriseTableReferences),
      EnterpriseData,
      PrefetchHooks Function({bool clientRefs})
    >;
typedef $$ClientTableCreateCompanionBuilder = ClientCompanion Function({
  required String password,
  required String name,
  required String login,
  required String birthday,
  required String email,
  required String phone,
  required String innEnterprise,
  Value<int> rowid,
});
typedef $$ClientTableUpdateCompanionBuilder = ClientCompanion Function({
  Value<String> password,
  Value<String> name,
  Value<String> login,
  Value<String> birthday,
  Value<String> email,
  Value<String> phone,
  Value<String> innEnterprise,
  Value<int> rowid,
});

final class $$ClientTableReferences
    extends BaseReferences<_$AppDatabase, $ClientTable, ClientData> {
  $$ClientTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $EnterpriseTable _innEnterpriseTable(_$AppDatabase db) =>
      db.enterprise.createAlias('client__inn_enterprise__enterprise__inn');

  $$EnterpriseTableProcessedTableManager get innEnterprise {
    final $_column = $_itemColumn<String>('inn_enterprise')!;

    final manager = $$EnterpriseTableTableManager(
      $_db,
      $_db.enterprise,
    ).filter((f) => f.inn.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_innEnterpriseTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$OrderTable, List<OrderData>> _orderRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.order,
    aliasName: 'client__login__order__login_client',
  );

  $$OrderTableProcessedTableManager get orderRefs {
    final manager = $$OrderTableTableManager($_db, $_db.order).filter(
      (f) => f.loginClient.login.sqlEquals($_itemColumn<String>('login')!),
    );

    final cache = $_typedResult.readTableOrNull(_orderRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ClientTableFilterComposer
    extends Composer<_$AppDatabase, $ClientTable> {
  $$ClientTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get birthday => $composableBuilder(
    column: $table.birthday,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  $$EnterpriseTableFilterComposer get innEnterprise {
    final $$EnterpriseTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.innEnterprise,
      referencedTable: $db.enterprise,
      getReferencedColumn: (t) => t.inn,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnterpriseTableFilterComposer(
            $db: $db,
            $table: $db.enterprise,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> orderRefs(
    Expression<bool> Function($$OrderTableFilterComposer f) f,
  ) {
    final $$OrderTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.login,
      referencedTable: $db.order,
      getReferencedColumn: (t) => t.loginClient,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderTableFilterComposer(
            $db: $db,
            $table: $db.order,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientTable> {
  $$ClientTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get birthday => $composableBuilder(
    column: $table.birthday,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  $$EnterpriseTableOrderingComposer get innEnterprise {
    final $$EnterpriseTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.innEnterprise,
      referencedTable: $db.enterprise,
      getReferencedColumn: (t) => t.inn,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnterpriseTableOrderingComposer(
            $db: $db,
            $table: $db.enterprise,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ClientTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientTable> {
  $$ClientTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get login =>
      $composableBuilder(column: $table.login, builder: (column) => column);

  GeneratedColumn<String> get birthday =>
      $composableBuilder(column: $table.birthday, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  $$EnterpriseTableAnnotationComposer get innEnterprise {
    final $$EnterpriseTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.innEnterprise,
      referencedTable: $db.enterprise,
      getReferencedColumn: (t) => t.inn,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EnterpriseTableAnnotationComposer(
            $db: $db,
            $table: $db.enterprise,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> orderRefs<T extends Object>(
    Expression<T> Function($$OrderTableAnnotationComposer a) f,
  ) {
    final $$OrderTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.login,
      referencedTable: $db.order,
      getReferencedColumn: (t) => t.loginClient,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderTableAnnotationComposer(
            $db: $db,
            $table: $db.order,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ClientTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientTable,
          ClientData,
          $$ClientTableFilterComposer,
          $$ClientTableOrderingComposer,
          $$ClientTableAnnotationComposer,
          $$ClientTableCreateCompanionBuilder,
          $$ClientTableUpdateCompanionBuilder,
          (ClientData, $$ClientTableReferences),
          ClientData,
          PrefetchHooks Function({bool innEnterprise, bool orderRefs})
        > {
  $$ClientTableTableManager(_$AppDatabase db, $ClientTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> password = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> login = const Value.absent(),
                Value<String> birthday = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> innEnterprise = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientCompanion(
                password: password,
                name: name,
                login: login,
                birthday: birthday,
                email: email,
                phone: phone,
                innEnterprise: innEnterprise,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String password,
                required String name,
                required String login,
                required String birthday,
                required String email,
                required String phone,
                required String innEnterprise,
                Value<int> rowid = const Value.absent(),
              }) => ClientCompanion.insert(
                password: password,
                name: name,
                login: login,
                birthday: birthday,
                email: email,
                phone: phone,
                innEnterprise: innEnterprise,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ClientTable, ClientData>(table),
                  $$ClientTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({innEnterprise = false, orderRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (orderRefs) db.order],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (innEnterprise) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.innEnterprise,
                        referencedTable: $$ClientTableReferences
                            ._innEnterpriseTable(db),
                        referencedColumn: $$ClientTableReferences
                            ._innEnterpriseTable(db)
                            .inn,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (orderRefs)
                    await $_getPrefetchedDataByColumns<
                      ClientData,
                      $ClientTable,
                      OrderData,
                      $OrderTable
                    >(
                      currentTable: table,
                      referencedTable: $$ClientTableReferences._orderRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$ClientTableReferences(db, table, p0).orderRefs,
                      currentColumn: 'login',
                      referencedColumn: 'login_client',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ClientTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientTable,
      ClientData,
      $$ClientTableFilterComposer,
      $$ClientTableOrderingComposer,
      $$ClientTableAnnotationComposer,
      $$ClientTableCreateCompanionBuilder,
      $$ClientTableUpdateCompanionBuilder,
      (ClientData, $$ClientTableReferences),
      ClientData,
      PrefetchHooks Function({bool innEnterprise, bool orderRefs})
    >;
typedef $$LaborantTableCreateCompanionBuilder = LaborantCompanion Function({
  required String fio,
  required String login,
  required String password,
  Value<int> rowid,
});
typedef $$LaborantTableUpdateCompanionBuilder = LaborantCompanion Function({
  Value<String> fio,
  Value<String> login,
  Value<String> password,
  Value<int> rowid,
});

final class $$LaborantTableReferences
    extends BaseReferences<_$AppDatabase, $LaborantTable, LaborantData> {
  $$LaborantTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$OrderTable, List<OrderData>> _orderRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.order,
    aliasName: 'laborant__login__order__login_laborant',
  );

  $$OrderTableProcessedTableManager get orderRefs {
    final manager = $$OrderTableTableManager($_db, $_db.order).filter(
      (f) => f.loginLaborant.login.sqlEquals($_itemColumn<String>('login')!),
    );

    final cache = $_typedResult.readTableOrNull(_orderRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EmployeeServiceTable, List<EmployeeServiceData>>
  _employeeServiceRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.employeeService,
    aliasName: 'laborant__login__employee_service__employee_login',
  );

  $$EmployeeServiceTableProcessedTableManager get employeeServiceRefs {
    final manager =
        $$EmployeeServiceTableTableManager($_db, $_db.employeeService).filter(
          (f) =>
              f.employeeLogin.login.sqlEquals($_itemColumn<String>('login')!),
        );

    final cache = $_typedResult.readTableOrNull(
      _employeeServiceRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LaborantTableFilterComposer
    extends Composer<_$AppDatabase, $LaborantTable> {
  $$LaborantTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get fio => $composableBuilder(
    column: $table.fio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> orderRefs(
    Expression<bool> Function($$OrderTableFilterComposer f) f,
  ) {
    final $$OrderTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.login,
      referencedTable: $db.order,
      getReferencedColumn: (t) => t.loginLaborant,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderTableFilterComposer(
            $db: $db,
            $table: $db.order,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> employeeServiceRefs(
    Expression<bool> Function($$EmployeeServiceTableFilterComposer f) f,
  ) {
    final $$EmployeeServiceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.login,
      referencedTable: $db.employeeService,
      getReferencedColumn: (t) => t.employeeLogin,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeServiceTableFilterComposer(
            $db: $db,
            $table: $db.employeeService,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LaborantTableOrderingComposer
    extends Composer<_$AppDatabase, $LaborantTable> {
  $$LaborantTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get fio => $composableBuilder(
    column: $table.fio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get login => $composableBuilder(
    column: $table.login,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LaborantTableAnnotationComposer
    extends Composer<_$AppDatabase, $LaborantTable> {
  $$LaborantTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get fio =>
      $composableBuilder(column: $table.fio, builder: (column) => column);

  GeneratedColumn<String> get login =>
      $composableBuilder(column: $table.login, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  Expression<T> orderRefs<T extends Object>(
    Expression<T> Function($$OrderTableAnnotationComposer a) f,
  ) {
    final $$OrderTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.login,
      referencedTable: $db.order,
      getReferencedColumn: (t) => t.loginLaborant,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderTableAnnotationComposer(
            $db: $db,
            $table: $db.order,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> employeeServiceRefs<T extends Object>(
    Expression<T> Function($$EmployeeServiceTableAnnotationComposer a) f,
  ) {
    final $$EmployeeServiceTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.login,
      referencedTable: $db.employeeService,
      getReferencedColumn: (t) => t.employeeLogin,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EmployeeServiceTableAnnotationComposer(
            $db: $db,
            $table: $db.employeeService,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LaborantTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LaborantTable,
          LaborantData,
          $$LaborantTableFilterComposer,
          $$LaborantTableOrderingComposer,
          $$LaborantTableAnnotationComposer,
          $$LaborantTableCreateCompanionBuilder,
          $$LaborantTableUpdateCompanionBuilder,
          (LaborantData, $$LaborantTableReferences),
          LaborantData,
          PrefetchHooks Function({bool orderRefs, bool employeeServiceRefs})
        > {
  $$LaborantTableTableManager(_$AppDatabase db, $LaborantTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LaborantTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LaborantTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LaborantTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> fio = const Value.absent(),
                Value<String> login = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LaborantCompanion(
                fio: fio,
                login: login,
                password: password,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String fio,
                required String login,
                required String password,
                Value<int> rowid = const Value.absent(),
              }) => LaborantCompanion.insert(
                fio: fio,
                login: login,
                password: password,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LaborantTable, LaborantData>(table),
                  $$LaborantTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({orderRefs = false, employeeServiceRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (orderRefs) db.order,
                    if (employeeServiceRefs) db.employeeService,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (orderRefs)
                        await $_getPrefetchedDataByColumns<
                          LaborantData,
                          $LaborantTable,
                          OrderData,
                          $OrderTable
                        >(
                          currentTable: table,
                          referencedTable: $$LaborantTableReferences
                              ._orderRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LaborantTableReferences(
                                db,
                                table,
                                p0,
                              ).orderRefs,
                          currentColumn: 'login',
                          referencedColumn: 'login_laborant',
                          typedResults: items,
                        ),
                      if (employeeServiceRefs)
                        await $_getPrefetchedDataByColumns<
                          LaborantData,
                          $LaborantTable,
                          EmployeeServiceData,
                          $EmployeeServiceTable
                        >(
                          currentTable: table,
                          referencedTable: $$LaborantTableReferences
                              ._employeeServiceRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LaborantTableReferences(
                                db,
                                table,
                                p0,
                              ).employeeServiceRefs,
                          currentColumn: 'login',
                          referencedColumn: 'employee_login',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LaborantTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LaborantTable,
      LaborantData,
      $$LaborantTableFilterComposer,
      $$LaborantTableOrderingComposer,
      $$LaborantTableAnnotationComposer,
      $$LaborantTableCreateCompanionBuilder,
      $$LaborantTableUpdateCompanionBuilder,
      (LaborantData, $$LaborantTableReferences),
      LaborantData,
      PrefetchHooks Function({bool orderRefs, bool employeeServiceRefs})
    >;
typedef $$OrderTableCreateCompanionBuilder = OrderCompanion Function({
  Value<int> number,
  required String code,
  required String status,
  required String enddate,
  required String startdate,
  required String loginClient,
  required String loginLaborant,
});
typedef $$OrderTableUpdateCompanionBuilder = OrderCompanion Function({
  Value<int> number,
  Value<String> code,
  Value<String> status,
  Value<String> enddate,
  Value<String> startdate,
  Value<String> loginClient,
  Value<String> loginLaborant,
});

final class $$OrderTableReferences
    extends BaseReferences<_$AppDatabase, $OrderTable, OrderData> {
  $$OrderTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ClientTable _loginClientTable(_$AppDatabase db) =>
      db.client.createAlias('order__login_client__client__login');

  $$ClientTableProcessedTableManager get loginClient {
    final $_column = $_itemColumn<String>('login_client')!;

    final manager = $$ClientTableTableManager(
      $_db,
      $_db.client,
    ).filter((f) => f.login.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_loginClientTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LaborantTable _loginLaborantTable(_$AppDatabase db) =>
      db.laborant.createAlias('order__login_laborant__laborant__login');

  $$LaborantTableProcessedTableManager get loginLaborant {
    final $_column = $_itemColumn<String>('login_laborant')!;

    final manager = $$LaborantTableTableManager(
      $_db,
      $_db.laborant,
    ).filter((f) => f.login.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_loginLaborantTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ServiceProvidedTable, List<ServiceProvidedData>>
  _serviceProvidedRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.serviceProvided,
    aliasName: 'order__number__service_provided__id_order',
  );

  $$ServiceProvidedTableProcessedTableManager get serviceProvidedRefs {
    final manager = $$ServiceProvidedTableTableManager(
      $_db,
      $_db.serviceProvided,
    ).filter((f) => f.idOrder.number.sqlEquals($_itemColumn<int>('number')!));

    final cache = $_typedResult.readTableOrNull(
      _serviceProvidedRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$OrderTableFilterComposer extends Composer<_$AppDatabase, $OrderTable> {
  $$OrderTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get enddate => $composableBuilder(
    column: $table.enddate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startdate => $composableBuilder(
    column: $table.startdate,
    builder: (column) => ColumnFilters(column),
  );

  $$ClientTableFilterComposer get loginClient {
    final $$ClientTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.loginClient,
      referencedTable: $db.client,
      getReferencedColumn: (t) => t.login,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientTableFilterComposer(
            $db: $db,
            $table: $db.client,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LaborantTableFilterComposer get loginLaborant {
    final $$LaborantTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.loginLaborant,
      referencedTable: $db.laborant,
      getReferencedColumn: (t) => t.login,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LaborantTableFilterComposer(
            $db: $db,
            $table: $db.laborant,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> serviceProvidedRefs(
    Expression<bool> Function($$ServiceProvidedTableFilterComposer f) f,
  ) {
    final $$ServiceProvidedTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.number,
      referencedTable: $db.serviceProvided,
      getReferencedColumn: (t) => t.idOrder,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceProvidedTableFilterComposer(
            $db: $db,
            $table: $db.serviceProvided,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrderTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderTable> {
  $$OrderTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get enddate => $composableBuilder(
    column: $table.enddate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startdate => $composableBuilder(
    column: $table.startdate,
    builder: (column) => ColumnOrderings(column),
  );

  $$ClientTableOrderingComposer get loginClient {
    final $$ClientTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.loginClient,
      referencedTable: $db.client,
      getReferencedColumn: (t) => t.login,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientTableOrderingComposer(
            $db: $db,
            $table: $db.client,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LaborantTableOrderingComposer get loginLaborant {
    final $$LaborantTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.loginLaborant,
      referencedTable: $db.laborant,
      getReferencedColumn: (t) => t.login,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LaborantTableOrderingComposer(
            $db: $db,
            $table: $db.laborant,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrderTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderTable> {
  $$OrderTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get enddate =>
      $composableBuilder(column: $table.enddate, builder: (column) => column);

  GeneratedColumn<String> get startdate =>
      $composableBuilder(column: $table.startdate, builder: (column) => column);

  $$ClientTableAnnotationComposer get loginClient {
    final $$ClientTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.loginClient,
      referencedTable: $db.client,
      getReferencedColumn: (t) => t.login,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ClientTableAnnotationComposer(
            $db: $db,
            $table: $db.client,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LaborantTableAnnotationComposer get loginLaborant {
    final $$LaborantTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.loginLaborant,
      referencedTable: $db.laborant,
      getReferencedColumn: (t) => t.login,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LaborantTableAnnotationComposer(
            $db: $db,
            $table: $db.laborant,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> serviceProvidedRefs<T extends Object>(
    Expression<T> Function($$ServiceProvidedTableAnnotationComposer a) f,
  ) {
    final $$ServiceProvidedTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.number,
      referencedTable: $db.serviceProvided,
      getReferencedColumn: (t) => t.idOrder,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceProvidedTableAnnotationComposer(
            $db: $db,
            $table: $db.serviceProvided,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$OrderTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrderTable,
          OrderData,
          $$OrderTableFilterComposer,
          $$OrderTableOrderingComposer,
          $$OrderTableAnnotationComposer,
          $$OrderTableCreateCompanionBuilder,
          $$OrderTableUpdateCompanionBuilder,
          (OrderData, $$OrderTableReferences),
          OrderData,
          PrefetchHooks Function({
            bool loginClient,
            bool loginLaborant,
            bool serviceProvidedRefs,
          })
        > {
  $$OrderTableTableManager(_$AppDatabase db, $OrderTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> number = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> enddate = const Value.absent(),
                Value<String> startdate = const Value.absent(),
                Value<String> loginClient = const Value.absent(),
                Value<String> loginLaborant = const Value.absent(),
              }) => OrderCompanion(
                number: number,
                code: code,
                status: status,
                enddate: enddate,
                startdate: startdate,
                loginClient: loginClient,
                loginLaborant: loginLaborant,
              ),
          createCompanionCallback:
              ({
                Value<int> number = const Value.absent(),
                required String code,
                required String status,
                required String enddate,
                required String startdate,
                required String loginClient,
                required String loginLaborant,
              }) => OrderCompanion.insert(
                number: number,
                code: code,
                status: status,
                enddate: enddate,
                startdate: startdate,
                loginClient: loginClient,
                loginLaborant: loginLaborant,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$OrderTable, OrderData>(table),
                  $$OrderTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                loginClient = false,
                loginLaborant = false,
                serviceProvidedRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (serviceProvidedRefs) db.serviceProvided,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (loginClient) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.loginClient,
                            referencedTable: $$OrderTableReferences
                                ._loginClientTable(db),
                            referencedColumn: $$OrderTableReferences
                                ._loginClientTable(db)
                                .login,
                          ) as T;
                        }
                        if (loginLaborant) {
                          state = state.withJoin(
                            currentTable: table,
                            currentColumn: table.loginLaborant,
                            referencedTable: $$OrderTableReferences
                                ._loginLaborantTable(db),
                            referencedColumn: $$OrderTableReferences
                                ._loginLaborantTable(db)
                                .login,
                          ) as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (serviceProvidedRefs)
                        await $_getPrefetchedDataByColumns<
                          OrderData,
                          $OrderTable,
                          ServiceProvidedData,
                          $ServiceProvidedTable
                        >(
                          currentTable: table,
                          referencedTable: $$OrderTableReferences
                              ._serviceProvidedRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$OrderTableReferences(
                                db,
                                table,
                                p0,
                              ).serviceProvidedRefs,
                          currentColumn: 'number',
                          referencedColumn: 'id_order',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$OrderTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrderTable,
      OrderData,
      $$OrderTableFilterComposer,
      $$OrderTableOrderingComposer,
      $$OrderTableAnnotationComposer,
      $$OrderTableCreateCompanionBuilder,
      $$OrderTableUpdateCompanionBuilder,
      (OrderData, $$OrderTableReferences),
      OrderData,
      PrefetchHooks Function({
        bool loginClient,
        bool loginLaborant,
        bool serviceProvidedRefs,
      })
    >;
typedef $$ServiceProvidedTableCreateCompanionBuilder =
    ServiceProvidedCompanion Function({
      Value<int> id,
      required PgDate date,
      required int idOrder,
    });
typedef $$ServiceProvidedTableUpdateCompanionBuilder =
    ServiceProvidedCompanion Function({
      Value<int> id,
      Value<PgDate> date,
      Value<int> idOrder,
    });

final class $$ServiceProvidedTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ServiceProvidedTable,
          ServiceProvidedData
        > {
  $$ServiceProvidedTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $OrderTable _idOrderTable(_$AppDatabase db) =>
      db.order.createAlias('service_provided__id_order__order__number');

  $$OrderTableProcessedTableManager get idOrder {
    final $_column = $_itemColumn<int>('id_order')!;

    final manager = $$OrderTableTableManager(
      $_db,
      $_db.order,
    ).filter((f) => f.number.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idOrderTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ServiceProvidedTableFilterComposer
    extends Composer<_$AppDatabase, $ServiceProvidedTable> {
  $$ServiceProvidedTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<PgDate> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  $$OrderTableFilterComposer get idOrder {
    final $$OrderTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrder,
      referencedTable: $db.order,
      getReferencedColumn: (t) => t.number,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderTableFilterComposer(
            $db: $db,
            $table: $db.order,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServiceProvidedTableOrderingComposer
    extends Composer<_$AppDatabase, $ServiceProvidedTable> {
  $$ServiceProvidedTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<PgDate> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  $$OrderTableOrderingComposer get idOrder {
    final $$OrderTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrder,
      referencedTable: $db.order,
      getReferencedColumn: (t) => t.number,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderTableOrderingComposer(
            $db: $db,
            $table: $db.order,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServiceProvidedTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServiceProvidedTable> {
  $$ServiceProvidedTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<PgDate> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$OrderTableAnnotationComposer get idOrder {
    final $$OrderTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idOrder,
      referencedTable: $db.order,
      getReferencedColumn: (t) => t.number,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrderTableAnnotationComposer(
            $db: $db,
            $table: $db.order,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServiceProvidedTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ServiceProvidedTable,
          ServiceProvidedData,
          $$ServiceProvidedTableFilterComposer,
          $$ServiceProvidedTableOrderingComposer,
          $$ServiceProvidedTableAnnotationComposer,
          $$ServiceProvidedTableCreateCompanionBuilder,
          $$ServiceProvidedTableUpdateCompanionBuilder,
          (ServiceProvidedData, $$ServiceProvidedTableReferences),
          ServiceProvidedData,
          PrefetchHooks Function({bool idOrder})
        > {
  $$ServiceProvidedTableTableManager(
    _$AppDatabase db,
    $ServiceProvidedTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceProvidedTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceProvidedTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceProvidedTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<PgDate> date = const Value.absent(),
            Value<int> idOrder = const Value.absent(),
          }) => ServiceProvidedCompanion(id: id, date: date, idOrder: idOrder),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required PgDate date,
                required int idOrder,
              }) => ServiceProvidedCompanion.insert(
                id: id,
                date: date,
                idOrder: idOrder,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ServiceProvidedTable, ServiceProvidedData>(
                    table,
                  ),
                  $$ServiceProvidedTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idOrder = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idOrder) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.idOrder,
                        referencedTable: $$ServiceProvidedTableReferences
                            ._idOrderTable(db),
                        referencedColumn: $$ServiceProvidedTableReferences
                            ._idOrderTable(db)
                            .number,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ServiceProvidedTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ServiceProvidedTable,
      ServiceProvidedData,
      $$ServiceProvidedTableFilterComposer,
      $$ServiceProvidedTableOrderingComposer,
      $$ServiceProvidedTableAnnotationComposer,
      $$ServiceProvidedTableCreateCompanionBuilder,
      $$ServiceProvidedTableUpdateCompanionBuilder,
      (ServiceProvidedData, $$ServiceProvidedTableReferences),
      ServiceProvidedData,
      PrefetchHooks Function({bool idOrder})
    >;
typedef $$EmployeeServiceTableCreateCompanionBuilder =
    EmployeeServiceCompanion Function({
      required String employeeLogin,
      required String code,
      Value<int> rowid,
    });
typedef $$EmployeeServiceTableUpdateCompanionBuilder =
    EmployeeServiceCompanion Function({
      Value<String> employeeLogin,
      Value<String> code,
      Value<int> rowid,
    });

final class $$EmployeeServiceTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $EmployeeServiceTable,
          EmployeeServiceData
        > {
  $$EmployeeServiceTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LaborantTable _employeeLoginTable(_$AppDatabase db) => db.laborant
      .createAlias('employee_service__employee_login__laborant__login');

  $$LaborantTableProcessedTableManager get employeeLogin {
    final $_column = $_itemColumn<String>('employee_login')!;

    final manager = $$LaborantTableTableManager(
      $_db,
      $_db.laborant,
    ).filter((f) => f.login.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_employeeLoginTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ServiceTable _codeTable(_$AppDatabase db) =>
      db.service.createAlias('employee_service__code__service__code');

  $$ServiceTableProcessedTableManager get code {
    final $_column = $_itemColumn<String>('code')!;

    final manager = $$ServiceTableTableManager(
      $_db,
      $_db.service,
    ).filter((f) => f.code.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_codeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$EmployeeServiceTableFilterComposer
    extends Composer<_$AppDatabase, $EmployeeServiceTable> {
  $$EmployeeServiceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LaborantTableFilterComposer get employeeLogin {
    final $$LaborantTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeLogin,
      referencedTable: $db.laborant,
      getReferencedColumn: (t) => t.login,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LaborantTableFilterComposer(
            $db: $db,
            $table: $db.laborant,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ServiceTableFilterComposer get code {
    final $$ServiceTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.code,
      referencedTable: $db.service,
      getReferencedColumn: (t) => t.code,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceTableFilterComposer(
            $db: $db,
            $table: $db.service,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EmployeeServiceTableOrderingComposer
    extends Composer<_$AppDatabase, $EmployeeServiceTable> {
  $$EmployeeServiceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LaborantTableOrderingComposer get employeeLogin {
    final $$LaborantTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeLogin,
      referencedTable: $db.laborant,
      getReferencedColumn: (t) => t.login,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LaborantTableOrderingComposer(
            $db: $db,
            $table: $db.laborant,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ServiceTableOrderingComposer get code {
    final $$ServiceTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.code,
      referencedTable: $db.service,
      getReferencedColumn: (t) => t.code,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceTableOrderingComposer(
            $db: $db,
            $table: $db.service,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EmployeeServiceTableAnnotationComposer
    extends Composer<_$AppDatabase, $EmployeeServiceTable> {
  $$EmployeeServiceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LaborantTableAnnotationComposer get employeeLogin {
    final $$LaborantTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.employeeLogin,
      referencedTable: $db.laborant,
      getReferencedColumn: (t) => t.login,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LaborantTableAnnotationComposer(
            $db: $db,
            $table: $db.laborant,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ServiceTableAnnotationComposer get code {
    final $$ServiceTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.code,
      referencedTable: $db.service,
      getReferencedColumn: (t) => t.code,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceTableAnnotationComposer(
            $db: $db,
            $table: $db.service,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EmployeeServiceTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EmployeeServiceTable,
          EmployeeServiceData,
          $$EmployeeServiceTableFilterComposer,
          $$EmployeeServiceTableOrderingComposer,
          $$EmployeeServiceTableAnnotationComposer,
          $$EmployeeServiceTableCreateCompanionBuilder,
          $$EmployeeServiceTableUpdateCompanionBuilder,
          (EmployeeServiceData, $$EmployeeServiceTableReferences),
          EmployeeServiceData,
          PrefetchHooks Function({bool employeeLogin, bool code})
        > {
  $$EmployeeServiceTableTableManager(
    _$AppDatabase db,
    $EmployeeServiceTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EmployeeServiceTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EmployeeServiceTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EmployeeServiceTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> employeeLogin = const Value.absent(),
                Value<String> code = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => EmployeeServiceCompanion(
                employeeLogin: employeeLogin,
                code: code,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String employeeLogin,
                required String code,
                Value<int> rowid = const Value.absent(),
              }) => EmployeeServiceCompanion.insert(
                employeeLogin: employeeLogin,
                code: code,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$EmployeeServiceTable, EmployeeServiceData>(
                    table,
                  ),
                  $$EmployeeServiceTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({employeeLogin = false, code = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (employeeLogin) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.employeeLogin,
                        referencedTable: $$EmployeeServiceTableReferences
                            ._employeeLoginTable(db),
                        referencedColumn: $$EmployeeServiceTableReferences
                            ._employeeLoginTable(db)
                            .login,
                      ) as T;
                    }
                    if (code) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.code,
                        referencedTable: $$EmployeeServiceTableReferences
                            ._codeTable(db),
                        referencedColumn: $$EmployeeServiceTableReferences
                            ._codeTable(db)
                            .code,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$EmployeeServiceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EmployeeServiceTable,
      EmployeeServiceData,
      $$EmployeeServiceTableFilterComposer,
      $$EmployeeServiceTableOrderingComposer,
      $$EmployeeServiceTableAnnotationComposer,
      $$EmployeeServiceTableCreateCompanionBuilder,
      $$EmployeeServiceTableUpdateCompanionBuilder,
      (EmployeeServiceData, $$EmployeeServiceTableReferences),
      EmployeeServiceData,
      PrefetchHooks Function({bool employeeLogin, bool code})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$TodoItemsTableTableManager get todoItems =>
      $$TodoItemsTableTableManager(_db, _db.todoItems);
  $$ServiceTableTableManager get service =>
      $$ServiceTableTableManager(_db, _db.service);
  $$EnterpriseTableTableManager get enterprise =>
      $$EnterpriseTableTableManager(_db, _db.enterprise);
  $$ClientTableTableManager get client =>
      $$ClientTableTableManager(_db, _db.client);
  $$LaborantTableTableManager get laborant =>
      $$LaborantTableTableManager(_db, _db.laborant);
  $$OrderTableTableManager get order =>
      $$OrderTableTableManager(_db, _db.order);
  $$ServiceProvidedTableTableManager get serviceProvided =>
      $$ServiceProvidedTableTableManager(_db, _db.serviceProvided);
  $$EmployeeServiceTableTableManager get employeeService =>
      $$EmployeeServiceTableTableManager(_db, _db.employeeService);
}
