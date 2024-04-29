// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_collection.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStockCollection on Isar {
  IsarCollection<Stock> get stocks => this.collection();
}

const StockSchema = CollectionSchema(
  name: r'Stock',
  id: 6740185341894042082,
  properties: {
    r'clientReferenceId': PropertySchema(
      id: 0,
      name: r'clientReferenceId',
      type: IsarType.string,
    ),
    r'createdBy': PropertySchema(
      id: 1,
      name: r'createdBy',
      type: IsarType.string,
    ),
    r'facilityId': PropertySchema(
      id: 2,
      name: r'facilityId',
      type: IsarType.string,
    ),
    r'productVariantId': PropertySchema(
      id: 3,
      name: r'productVariantId',
      type: IsarType.string,
    ),
    r'quantity': PropertySchema(
      id: 4,
      name: r'quantity',
      type: IsarType.string,
    ),
    r'receiverId': PropertySchema(
      id: 5,
      name: r'receiverId',
      type: IsarType.string,
    ),
    r'receiverType': PropertySchema(
      id: 6,
      name: r'receiverType',
      type: IsarType.string,
    ),
    r'referenceId': PropertySchema(
      id: 7,
      name: r'referenceId',
      type: IsarType.string,
    ),
    r'referenceIdType': PropertySchema(
      id: 8,
      name: r'referenceIdType',
      type: IsarType.string,
    ),
    r'rowVersion': PropertySchema(
      id: 9,
      name: r'rowVersion',
      type: IsarType.long,
    ),
    r'senderId': PropertySchema(
      id: 10,
      name: r'senderId',
      type: IsarType.string,
    ),
    r'senderType': PropertySchema(
      id: 11,
      name: r'senderType',
      type: IsarType.string,
    ),
    r'tenantId': PropertySchema(
      id: 12,
      name: r'tenantId',
      type: IsarType.string,
    ),
    r'transactingPartyId': PropertySchema(
      id: 13,
      name: r'transactingPartyId',
      type: IsarType.string,
    ),
    r'transactingPartyType': PropertySchema(
      id: 14,
      name: r'transactingPartyType',
      type: IsarType.string,
    ),
    r'transactionReason': PropertySchema(
      id: 15,
      name: r'transactionReason',
      type: IsarType.byte,
      enumMap: _StocktransactionReasonEnumValueMap,
    ),
    r'transactionType': PropertySchema(
      id: 16,
      name: r'transactionType',
      type: IsarType.byte,
      enumMap: _StocktransactionTypeEnumValueMap,
    ),
    r'waybillNumber': PropertySchema(
      id: 17,
      name: r'waybillNumber',
      type: IsarType.string,
    )
  },
  estimateSize: _stockEstimateSize,
  serialize: _stockSerialize,
  deserialize: _stockDeserialize,
  deserializeProp: _stockDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _stockGetId,
  getLinks: _stockGetLinks,
  attach: _stockAttach,
  version: '3.1.0+1',
);

int _stockEstimateSize(
  Stock object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.clientReferenceId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.createdBy;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.facilityId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.productVariantId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.quantity;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.receiverId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.receiverType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.referenceId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.referenceIdType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.senderId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.senderType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tenantId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.transactingPartyId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.transactingPartyType;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.waybillNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _stockSerialize(
  Stock object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.clientReferenceId);
  writer.writeString(offsets[1], object.createdBy);
  writer.writeString(offsets[2], object.facilityId);
  writer.writeString(offsets[3], object.productVariantId);
  writer.writeString(offsets[4], object.quantity);
  writer.writeString(offsets[5], object.receiverId);
  writer.writeString(offsets[6], object.receiverType);
  writer.writeString(offsets[7], object.referenceId);
  writer.writeString(offsets[8], object.referenceIdType);
  writer.writeLong(offsets[9], object.rowVersion);
  writer.writeString(offsets[10], object.senderId);
  writer.writeString(offsets[11], object.senderType);
  writer.writeString(offsets[12], object.tenantId);
  writer.writeString(offsets[13], object.transactingPartyId);
  writer.writeString(offsets[14], object.transactingPartyType);
  writer.writeByte(offsets[15], object.transactionReason.index);
  writer.writeByte(offsets[16], object.transactionType.index);
  writer.writeString(offsets[17], object.waybillNumber);
}

Stock _stockDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Stock();
  object.clientReferenceId = reader.readStringOrNull(offsets[0]);
  object.createdBy = reader.readStringOrNull(offsets[1]);
  object.facilityId = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.productVariantId = reader.readStringOrNull(offsets[3]);
  object.quantity = reader.readStringOrNull(offsets[4]);
  object.receiverId = reader.readStringOrNull(offsets[5]);
  object.receiverType = reader.readStringOrNull(offsets[6]);
  object.referenceId = reader.readStringOrNull(offsets[7]);
  object.referenceIdType = reader.readStringOrNull(offsets[8]);
  object.rowVersion = reader.readLongOrNull(offsets[9]);
  object.senderId = reader.readStringOrNull(offsets[10]);
  object.senderType = reader.readStringOrNull(offsets[11]);
  object.tenantId = reader.readStringOrNull(offsets[12]);
  object.transactingPartyId = reader.readStringOrNull(offsets[13]);
  object.transactingPartyType = reader.readStringOrNull(offsets[14]);
  object.transactionReason =
      _StocktransactionReasonValueEnumMap[reader.readByteOrNull(offsets[15])] ??
          TransactionReason.received;
  object.transactionType =
      _StocktransactionTypeValueEnumMap[reader.readByteOrNull(offsets[16])] ??
          TransactionType.received;
  object.waybillNumber = reader.readStringOrNull(offsets[17]);
  return object;
}

P _stockDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readStringOrNull(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readStringOrNull(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (_StocktransactionReasonValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TransactionReason.received) as P;
    case 16:
      return (_StocktransactionTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          TransactionType.received) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _StocktransactionReasonEnumValueMap = {
  'received': 0,
  'returned': 1,
  'lostInStorage': 2,
  'lostInTransit': 3,
  'damagedInStorage': 4,
  'damagedInTransit': 5,
};
const _StocktransactionReasonValueEnumMap = {
  0: TransactionReason.received,
  1: TransactionReason.returned,
  2: TransactionReason.lostInStorage,
  3: TransactionReason.lostInTransit,
  4: TransactionReason.damagedInStorage,
  5: TransactionReason.damagedInTransit,
};
const _StocktransactionTypeEnumValueMap = {
  'received': 0,
  'dispatched': 1,
};
const _StocktransactionTypeValueEnumMap = {
  0: TransactionType.received,
  1: TransactionType.dispatched,
};

Id _stockGetId(Stock object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _stockGetLinks(Stock object) {
  return [];
}

void _stockAttach(IsarCollection<dynamic> col, Id id, Stock object) {
  object.id = id;
}

extension StockQueryWhereSort on QueryBuilder<Stock, Stock, QWhere> {
  QueryBuilder<Stock, Stock, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StockQueryWhere on QueryBuilder<Stock, Stock, QWhereClause> {
  QueryBuilder<Stock, Stock, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Stock, Stock, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Stock, Stock, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Stock, Stock, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StockQueryFilter on QueryBuilder<Stock, Stock, QFilterCondition> {
  QueryBuilder<Stock, Stock, QAfterFilterCondition> clientReferenceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'clientReferenceId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      clientReferenceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'clientReferenceId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> clientReferenceIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      clientReferenceIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clientReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> clientReferenceIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clientReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> clientReferenceIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clientReferenceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> clientReferenceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'clientReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> clientReferenceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'clientReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> clientReferenceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'clientReferenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> clientReferenceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'clientReferenceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> clientReferenceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clientReferenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      clientReferenceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'clientReferenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> createdByIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'createdBy',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> createdByIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'createdBy',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> createdByEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> createdByGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> createdByLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> createdByBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> createdByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> createdByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> createdByContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'createdBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> createdByMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'createdBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> createdByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> createdByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'createdBy',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> facilityIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'facilityId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> facilityIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'facilityId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> facilityIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'facilityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> facilityIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'facilityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> facilityIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'facilityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> facilityIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'facilityId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> facilityIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'facilityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> facilityIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'facilityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> facilityIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'facilityId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> facilityIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'facilityId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> facilityIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'facilityId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> facilityIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'facilityId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> idGreaterThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> idLessThan(
    Id? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> productVariantIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productVariantId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      productVariantIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productVariantId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> productVariantIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productVariantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> productVariantIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productVariantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> productVariantIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productVariantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> productVariantIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productVariantId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> productVariantIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productVariantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> productVariantIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productVariantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> productVariantIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productVariantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> productVariantIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productVariantId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> productVariantIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productVariantId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      productVariantIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productVariantId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> quantityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> quantityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'quantity',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> quantityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> quantityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> quantityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> quantityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> quantityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> quantityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> quantityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'quantity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> quantityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'quantity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> quantityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantity',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> quantityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'quantity',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'receiverId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'receiverId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receiverId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiverId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiverId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiverId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'receiverType',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'receiverType',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receiverType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receiverType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receiverType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'receiverType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'receiverType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiverType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiverType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiverType',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> receiverTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiverType',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'referenceId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'referenceId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenceId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referenceId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referenceId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenceId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'referenceIdType',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'referenceIdType',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceIdType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'referenceIdType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'referenceIdType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'referenceIdType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'referenceIdType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'referenceIdType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'referenceIdType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'referenceIdType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> referenceIdTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'referenceIdType',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      referenceIdTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'referenceIdType',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> rowVersionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rowVersion',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> rowVersionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rowVersion',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> rowVersionEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rowVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> rowVersionGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rowVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> rowVersionLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rowVersion',
        value: value,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> rowVersionBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rowVersion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'senderId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'senderId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senderId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senderId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senderId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senderId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'senderType',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'senderType',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'senderType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'senderType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'senderType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'senderType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'senderType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderTypeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'senderType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'senderType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'senderType',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> senderTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'senderType',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> tenantIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tenantId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> tenantIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tenantId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> tenantIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> tenantIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> tenantIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> tenantIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tenantId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> tenantIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> tenantIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> tenantIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tenantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> tenantIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tenantId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> tenantIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tenantId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> tenantIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tenantId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactingPartyIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactingPartyId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactingPartyId',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactingPartyIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactingPartyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactingPartyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactingPartyIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactingPartyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactingPartyIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactingPartyId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactingPartyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactingPartyIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactingPartyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactingPartyIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactingPartyId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactingPartyIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactingPartyId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactingPartyId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactingPartyId',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'transactingPartyType',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'transactingPartyType',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactingPartyTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactingPartyType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyTypeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactingPartyType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyTypeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactingPartyType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactingPartyTypeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactingPartyType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'transactingPartyType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'transactingPartyType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'transactingPartyType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactingPartyTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'transactingPartyType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactingPartyType',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactingPartyTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'transactingPartyType',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactionReasonEqualTo(
      TransactionReason value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionReason',
        value: value,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition>
      transactionReasonGreaterThan(
    TransactionReason value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionReason',
        value: value,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactionReasonLessThan(
    TransactionReason value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionReason',
        value: value,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactionReasonBetween(
    TransactionReason lower,
    TransactionReason upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionReason',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactionTypeEqualTo(
      TransactionType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'transactionType',
        value: value,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactionTypeGreaterThan(
    TransactionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'transactionType',
        value: value,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactionTypeLessThan(
    TransactionType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'transactionType',
        value: value,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> transactionTypeBetween(
    TransactionType lower,
    TransactionType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'transactionType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> waybillNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'waybillNumber',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> waybillNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'waybillNumber',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> waybillNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waybillNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> waybillNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waybillNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> waybillNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waybillNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> waybillNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waybillNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> waybillNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'waybillNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> waybillNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'waybillNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> waybillNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'waybillNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> waybillNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'waybillNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> waybillNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waybillNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Stock, Stock, QAfterFilterCondition> waybillNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'waybillNumber',
        value: '',
      ));
    });
  }
}

extension StockQueryObject on QueryBuilder<Stock, Stock, QFilterCondition> {}

extension StockQueryLinks on QueryBuilder<Stock, Stock, QFilterCondition> {}

extension StockQuerySortBy on QueryBuilder<Stock, Stock, QSortBy> {
  QueryBuilder<Stock, Stock, QAfterSortBy> sortByClientReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientReferenceId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByClientReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientReferenceId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByFacilityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facilityId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByFacilityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facilityId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByProductVariantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productVariantId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByProductVariantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productVariantId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByReceiverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByReceiverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByReceiverType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverType', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByReceiverTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverType', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByReferenceIdType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceIdType', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByReferenceIdTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceIdType', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByRowVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rowVersion', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByRowVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rowVersion', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortBySenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortBySenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortBySenderType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderType', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortBySenderTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderType', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByTenantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByTenantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByTransactingPartyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactingPartyId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByTransactingPartyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactingPartyId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByTransactingPartyType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactingPartyType', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByTransactingPartyTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactingPartyType', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByTransactionReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionReason', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByTransactionReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionReason', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByTransactionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionType', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByTransactionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionType', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByWaybillNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waybillNumber', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> sortByWaybillNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waybillNumber', Sort.desc);
    });
  }
}

extension StockQuerySortThenBy on QueryBuilder<Stock, Stock, QSortThenBy> {
  QueryBuilder<Stock, Stock, QAfterSortBy> thenByClientReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientReferenceId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByClientReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clientReferenceId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByCreatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByCreatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdBy', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByFacilityId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facilityId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByFacilityIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'facilityId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByProductVariantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productVariantId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByProductVariantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productVariantId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quantity', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByReceiverId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByReceiverIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByReceiverType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverType', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByReceiverTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiverType', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByReferenceId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByReferenceIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByReferenceIdType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceIdType', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByReferenceIdTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'referenceIdType', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByRowVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rowVersion', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByRowVersionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rowVersion', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenBySenderId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenBySenderIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenBySenderType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderType', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenBySenderTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'senderType', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByTenantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByTenantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tenantId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByTransactingPartyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactingPartyId', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByTransactingPartyIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactingPartyId', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByTransactingPartyType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactingPartyType', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByTransactingPartyTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactingPartyType', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByTransactionReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionReason', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByTransactionReasonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionReason', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByTransactionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionType', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByTransactionTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'transactionType', Sort.desc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByWaybillNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waybillNumber', Sort.asc);
    });
  }

  QueryBuilder<Stock, Stock, QAfterSortBy> thenByWaybillNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waybillNumber', Sort.desc);
    });
  }
}

extension StockQueryWhereDistinct on QueryBuilder<Stock, Stock, QDistinct> {
  QueryBuilder<Stock, Stock, QDistinct> distinctByClientReferenceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clientReferenceId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByCreatedBy(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByFacilityId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'facilityId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByProductVariantId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productVariantId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByQuantity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quantity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByReceiverId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiverId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByReceiverType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiverType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByReferenceId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByReferenceIdType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'referenceIdType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByRowVersion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rowVersion');
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctBySenderId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senderId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctBySenderType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'senderType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByTenantId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tenantId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByTransactingPartyId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactingPartyId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByTransactingPartyType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactingPartyType',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByTransactionReason() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionReason');
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByTransactionType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'transactionType');
    });
  }

  QueryBuilder<Stock, Stock, QDistinct> distinctByWaybillNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waybillNumber',
          caseSensitive: caseSensitive);
    });
  }
}

extension StockQueryProperty on QueryBuilder<Stock, Stock, QQueryProperty> {
  QueryBuilder<Stock, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> clientReferenceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clientReferenceId');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> createdByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdBy');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> facilityIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'facilityId');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> productVariantIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productVariantId');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> quantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quantity');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> receiverIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiverId');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> receiverTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiverType');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> referenceIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceId');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> referenceIdTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'referenceIdType');
    });
  }

  QueryBuilder<Stock, int?, QQueryOperations> rowVersionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rowVersion');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> senderIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senderId');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> senderTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'senderType');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> tenantIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tenantId');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> transactingPartyIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactingPartyId');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations>
      transactingPartyTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactingPartyType');
    });
  }

  QueryBuilder<Stock, TransactionReason, QQueryOperations>
      transactionReasonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionReason');
    });
  }

  QueryBuilder<Stock, TransactionType, QQueryOperations>
      transactionTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'transactionType');
    });
  }

  QueryBuilder<Stock, String?, QQueryOperations> waybillNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waybillNumber');
    });
  }
}
