// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_cache.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CurrentUserData extends DataClass implements Insertable<CurrentUserData> {
  final String requestToken;
  final String accessToken;
  final String fullName;
  final String emailAddress;
  final String phoneNumber;
  final String lock;
  const CurrentUserData(
      {required this.requestToken,
      required this.accessToken,
      required this.fullName,
      required this.emailAddress,
      required this.phoneNumber,
      required this.lock});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['requestToken'] = Variable<String>(requestToken);
    map['accessToken'] = Variable<String>(accessToken);
    map['fullName'] = Variable<String>(fullName);
    map['emailAddress'] = Variable<String>(emailAddress);
    map['phoneNumber'] = Variable<String>(phoneNumber);
    map['Lock'] = Variable<String>(lock);
    return map;
  }

  CurrentUserCompanion toCompanion(bool nullToAbsent) {
    return CurrentUserCompanion(
      requestToken: Value(requestToken),
      accessToken: Value(accessToken),
      fullName: Value(fullName),
      emailAddress: Value(emailAddress),
      phoneNumber: Value(phoneNumber),
      lock: Value(lock),
    );
  }

  factory CurrentUserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CurrentUserData(
      requestToken: serializer.fromJson<String>(json['requestToken']),
      accessToken: serializer.fromJson<String>(json['accessToken']),
      fullName: serializer.fromJson<String>(json['fullName']),
      emailAddress: serializer.fromJson<String>(json['emailAddress']),
      phoneNumber: serializer.fromJson<String>(json['phoneNumber']),
      lock: serializer.fromJson<String>(json['Lock']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'requestToken': serializer.toJson<String>(requestToken),
      'accessToken': serializer.toJson<String>(accessToken),
      'fullName': serializer.toJson<String>(fullName),
      'emailAddress': serializer.toJson<String>(emailAddress),
      'phoneNumber': serializer.toJson<String>(phoneNumber),
      'Lock': serializer.toJson<String>(lock),
    };
  }

  CurrentUserData copyWith(
          {String? requestToken,
          String? accessToken,
          String? fullName,
          String? emailAddress,
          String? phoneNumber,
          String? lock}) =>
      CurrentUserData(
        requestToken: requestToken ?? this.requestToken,
        accessToken: accessToken ?? this.accessToken,
        fullName: fullName ?? this.fullName,
        emailAddress: emailAddress ?? this.emailAddress,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        lock: lock ?? this.lock,
      );
  @override
  String toString() {
    return (StringBuffer('CurrentUserData(')
          ..write('requestToken: $requestToken, ')
          ..write('accessToken: $accessToken, ')
          ..write('fullName: $fullName, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('lock: $lock')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      requestToken, accessToken, fullName, emailAddress, phoneNumber, lock);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CurrentUserData &&
          other.requestToken == this.requestToken &&
          other.accessToken == this.accessToken &&
          other.fullName == this.fullName &&
          other.emailAddress == this.emailAddress &&
          other.phoneNumber == this.phoneNumber &&
          other.lock == this.lock);
}

class CurrentUserCompanion extends UpdateCompanion<CurrentUserData> {
  final Value<String> requestToken;
  final Value<String> accessToken;
  final Value<String> fullName;
  final Value<String> emailAddress;
  final Value<String> phoneNumber;
  final Value<String> lock;
  const CurrentUserCompanion({
    this.requestToken = const Value.absent(),
    this.accessToken = const Value.absent(),
    this.fullName = const Value.absent(),
    this.emailAddress = const Value.absent(),
    this.phoneNumber = const Value.absent(),
    this.lock = const Value.absent(),
  });
  CurrentUserCompanion.insert({
    required String requestToken,
    required String accessToken,
    required String fullName,
    required String emailAddress,
    required String phoneNumber,
    this.lock = const Value.absent(),
  })  : requestToken = Value(requestToken),
        accessToken = Value(accessToken),
        fullName = Value(fullName),
        emailAddress = Value(emailAddress),
        phoneNumber = Value(phoneNumber);
  static Insertable<CurrentUserData> custom({
    Expression<String>? requestToken,
    Expression<String>? accessToken,
    Expression<String>? fullName,
    Expression<String>? emailAddress,
    Expression<String>? phoneNumber,
    Expression<String>? lock,
  }) {
    return RawValuesInsertable({
      if (requestToken != null) 'requestToken': requestToken,
      if (accessToken != null) 'accessToken': accessToken,
      if (fullName != null) 'fullName': fullName,
      if (emailAddress != null) 'emailAddress': emailAddress,
      if (phoneNumber != null) 'phoneNumber': phoneNumber,
      if (lock != null) 'Lock': lock,
    });
  }

  CurrentUserCompanion copyWith(
      {Value<String>? requestToken,
      Value<String>? accessToken,
      Value<String>? fullName,
      Value<String>? emailAddress,
      Value<String>? phoneNumber,
      Value<String>? lock}) {
    return CurrentUserCompanion(
      requestToken: requestToken ?? this.requestToken,
      accessToken: accessToken ?? this.accessToken,
      fullName: fullName ?? this.fullName,
      emailAddress: emailAddress ?? this.emailAddress,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      lock: lock ?? this.lock,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (requestToken.present) {
      map['requestToken'] = Variable<String>(requestToken.value);
    }
    if (accessToken.present) {
      map['accessToken'] = Variable<String>(accessToken.value);
    }
    if (fullName.present) {
      map['fullName'] = Variable<String>(fullName.value);
    }
    if (emailAddress.present) {
      map['emailAddress'] = Variable<String>(emailAddress.value);
    }
    if (phoneNumber.present) {
      map['phoneNumber'] = Variable<String>(phoneNumber.value);
    }
    if (lock.present) {
      map['Lock'] = Variable<String>(lock.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrentUserCompanion(')
          ..write('requestToken: $requestToken, ')
          ..write('accessToken: $accessToken, ')
          ..write('fullName: $fullName, ')
          ..write('emailAddress: $emailAddress, ')
          ..write('phoneNumber: $phoneNumber, ')
          ..write('lock: $lock')
          ..write(')'))
        .toString();
  }
}

class CurrentUser extends Table with TableInfo<CurrentUser, CurrentUserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CurrentUser(this.attachedDatabase, [this._alias]);
  final VerificationMeta _requestTokenMeta =
      const VerificationMeta('requestToken');
  late final GeneratedColumn<String> requestToken = GeneratedColumn<String>(
      'requestToken', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _accessTokenMeta =
      const VerificationMeta('accessToken');
  late final GeneratedColumn<String> accessToken = GeneratedColumn<String>(
      'accessToken', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _fullNameMeta = const VerificationMeta('fullName');
  late final GeneratedColumn<String> fullName = GeneratedColumn<String>(
      'fullName', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _emailAddressMeta =
      const VerificationMeta('emailAddress');
  late final GeneratedColumn<String> emailAddress = GeneratedColumn<String>(
      'emailAddress', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _phoneNumberMeta =
      const VerificationMeta('phoneNumber');
  late final GeneratedColumn<String> phoneNumber = GeneratedColumn<String>(
      'phoneNumber', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _lockMeta = const VerificationMeta('lock');
  late final GeneratedColumn<String> lock = GeneratedColumn<String>(
      'Lock', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL DEFAULT \'X\'',
      defaultValue: const CustomExpression<String>('\'X\''));
  @override
  List<GeneratedColumn> get $columns =>
      [requestToken, accessToken, fullName, emailAddress, phoneNumber, lock];
  @override
  String get aliasedName => _alias ?? 'currentUser';
  @override
  String get actualTableName => 'currentUser';
  @override
  VerificationContext validateIntegrity(Insertable<CurrentUserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('requestToken')) {
      context.handle(
          _requestTokenMeta,
          requestToken.isAcceptableOrUnknown(
              data['requestToken']!, _requestTokenMeta));
    } else if (isInserting) {
      context.missing(_requestTokenMeta);
    }
    if (data.containsKey('accessToken')) {
      context.handle(
          _accessTokenMeta,
          accessToken.isAcceptableOrUnknown(
              data['accessToken']!, _accessTokenMeta));
    } else if (isInserting) {
      context.missing(_accessTokenMeta);
    }
    if (data.containsKey('fullName')) {
      context.handle(_fullNameMeta,
          fullName.isAcceptableOrUnknown(data['fullName']!, _fullNameMeta));
    } else if (isInserting) {
      context.missing(_fullNameMeta);
    }
    if (data.containsKey('emailAddress')) {
      context.handle(
          _emailAddressMeta,
          emailAddress.isAcceptableOrUnknown(
              data['emailAddress']!, _emailAddressMeta));
    } else if (isInserting) {
      context.missing(_emailAddressMeta);
    }
    if (data.containsKey('phoneNumber')) {
      context.handle(
          _phoneNumberMeta,
          phoneNumber.isAcceptableOrUnknown(
              data['phoneNumber']!, _phoneNumberMeta));
    } else if (isInserting) {
      context.missing(_phoneNumberMeta);
    }
    if (data.containsKey('Lock')) {
      context.handle(
          _lockMeta, lock.isAcceptableOrUnknown(data['Lock']!, _lockMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lock};
  @override
  CurrentUserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CurrentUserData(
      requestToken: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}requestToken'])!,
      accessToken: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}accessToken'])!,
      fullName: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}fullName'])!,
      emailAddress: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}emailAddress'])!,
      phoneNumber: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}phoneNumber'])!,
      lock: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}Lock'])!,
    );
  }

  @override
  CurrentUser createAlias(String alias) {
    return CurrentUser(attachedDatabase, alias);
  }

  @override
  List<String> get customConstraints => const [
        'CONSTRAINT PK_T1 PRIMARY KEY(Lock)',
        'CONSTRAINT CK_T1_Locked CHECK (Lock=\'X\')'
      ];
  @override
  bool get dontWriteConstraints => true;
}

abstract class _$Cache extends GeneratedDatabase {
  _$Cache(QueryExecutor e) : super(e);
  late final CurrentUser currentUser = CurrentUser(this);
  Selectable<CurrentUserData> getCurrentUser() {
    return customSelect('SELECT * FROM currentUser', variables: [], readsFrom: {
      currentUser,
    }).asyncMap(currentUser.mapFromRow);
  }

  Future<int> deleteCurrentUser() {
    return customUpdate(
      'DELETE FROM currentUser',
      variables: [],
      updates: {currentUser},
      updateKind: UpdateKind.delete,
    );
  }

  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [currentUser];
}
