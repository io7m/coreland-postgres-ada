-- auto generated - do not edit

package PGAda.Errors is

  Pragma Preelaborate;

  type Error_Value_t is (
    SUCCESSFUL_COMPLETION,
    WARNING,
    WARN_DYNAMIC_RESULT_SETS_RETURNED,
    WARN_IMPLICIT_ZERO_BIT_PADDING,
    WARN_NULL_VALUE_ELIMINATED_IN_SET_FUNCTION,
    WARN_PRIVILEGE_NOT_GRANTED,
    WARN_PRIVILEGE_NOT_REVOKED,
    WARN_STRING_DATA_RIGHT_TRUNCATION,
    DEPRECATED_FEATURE,
    NO_DATA,
    NO_ADDITIONAL_DYNAMIC_RESULT_SETS_RETURNED,
    SQL_STATEMENT_NOT_YET_COMPLETE,
    CONNECTION_EXCEPTION,
    CONNECTION_DOES_NOT_EXIST,
    CONNECTION_FAILURE,
    SQLCLIENT_UNABLE_TO_ESTABLISH_SQLCONNECTION,
    SQLSERVER_REJECTED_ESTABLISHMENT_OF_SQLCONNECTION,
    TRANSACTION_RESOLUTION_UNKNOWN,
    PROTOCOL_VIOLATION,
    TRIGGERED_ACTION_EXCEPTION,
    FEATURE_NOT_SUPPORTED,
    INVALID_TRANSACTION_INITIATION,
    LOCATOR_EXCEPTION,
    INVALID_LOCATOR_SPECIFICATION,
    INVALID_GRANTOR,
    INVALID_GRANT_OPERATION,
    INVALID_ROLE_SPECIFICATION,
    CARDINALITY_VIOLATION,
    DATA_EXCEPTION,
    ARRAY_SUBSCRIPT_ERROR,
    CHARACTER_NOT_IN_REPERTOIRE,
    DATETIME_FIELD_OVERFLOW,
    DIVISION_BY_ZERO,
    ERROR_IN_ASSIGNMENT,
    ESCAPE_CHARACTER_CONFLICT,
    INDICATOR_OVERFLOW,
    INTERVAL_FIELD_OVERFLOW,
    INVALID_ARGUMENT_FOR_LOGARITHM,
    INVALID_ARGUMENT_FOR_POWER_FUNCTION,
    INVALID_ARGUMENT_FOR_WIDTH_BUCKET_FUNCTION,
    INVALID_CHARACTER_VALUE_FOR_CAST,
    INVALID_DATETIME_FORMAT,
    INVALID_ESCAPE_CHARACTER,
    INVALID_ESCAPE_OCTET,
    INVALID_ESCAPE_SEQUENCE,
    NONSTANDARD_USE_OF_ESCAPE_CHARACTER,
    INVALID_INDICATOR_PARAMETER_VALUE,
    INVALID_LIMIT_VALUE,
    INVALID_PARAMETER_VALUE,
    INVALID_REGULAR_EXPRESSION,
    INVALID_TIME_ZONE_DISPLACEMENT_VALUE,
    INVALID_USE_OF_ESCAPE_CHARACTER,
    MOST_SPECIFIC_TYPE_MISMATCH,
    NULL_VALUE_NOT_ALLOWED,
    NULL_VALUE_NO_INDICATOR_PARAMETER,
    NUMERIC_VALUE_OUT_OF_RANGE,
    STRING_DATA_LENGTH_MISMATCH,
    STRING_DATA_RIGHT_TRUNCATION,
    SUBSTRING_ERROR,
    TRIM_ERROR,
    UNTERMINATED_C_STRING,
    ZERO_LENGTH_CHARACTER_STRING,
    FLOATING_POINT_EXCEPTION,
    INVALID_TEXT_REPRESENTATION,
    INVALID_BINARY_REPRESENTATION,
    BAD_COPY_FILE_FORMAT,
    UNTRANSLATABLE_CHARACTER,
    NOT_AN_XML_DOCUMENT,
    INVALID_XML_DOCUMENT,
    INVALID_XML_CONTENT,
    INVALID_XML_COMMENT,
    INVALID_XML_PROCESSING_INSTRUCTION,
    INTEGRITY_CONSTRAINT_VIOLATION,
    RESTRICT_VIOLATION,
    NOT_NULL_VIOLATION,
    FOREIGN_KEY_VIOLATION,
    UNIQUE_VIOLATION,
    CHECK_VIOLATION,
    INVALID_CURSOR_STATE,
    INVALID_TRANSACTION_STATE,
    ACTIVE_SQL_TRANSACTION,
    BRANCH_TRANSACTION_ALREADY_ACTIVE,
    HELD_CURSOR_REQUIRES_SAME_ISOLATION_LEVEL,
    INAPPROPRIATE_ACCESS_MODE_FOR_BRANCH_TRANSACTION,
    INAPPROPRIATE_ISOLATION_LEVEL_FOR_BRANCH_TRANSACTION,
    NO_ACTIVE_SQL_TRANSACTION_FOR_BRANCH_TRANSACTION,
    READ_ONLY_SQL_TRANSACTION,
    SCHEMA_AND_DATA_STATEMENT_MIXING_NOT_SUPPORTED,
    NO_ACTIVE_SQL_TRANSACTION,
    IN_FAILED_SQL_TRANSACTION,
    INVALID_SQL_STATEMENT_NAME,
    TRIGGERED_DATA_CHANGE_VIOLATION,
    INVALID_AUTHORIZATION_SPECIFICATION,
    DEPENDENT_PRIVILEGE_DESCRIPTORS_STILL_EXIST,
    DEPENDENT_OBJECTS_STILL_EXIST,
    INVALID_TRANSACTION_TERMINATION,
    SRE_SQL_ROUTINE_EXCEPTION,
    SRE_FUNCTION_EXECUTED_NO_RETURN_STATEMENT,
    SRE_MODIFYING_SQL_DATA_NOT_PERMITTED,
    SRE_PROHIBITED_SQL_STATEMENT_ATTEMPTED,
    SRE_READING_SQL_DATA_NOT_PERMITTED,
    INVALID_CURSOR_NAME,
    ERE_EXTERNAL_ROUTINE_EXCEPTION,
    ERE_CONTAINING_SQL_NOT_PERMITTED,
    ERE_MODIFYING_SQL_DATA_NOT_PERMITTED,
    ERE_PROHIBITED_SQL_STATEMENT_ATTEMPTED,
    ERE_READING_SQL_DATA_NOT_PERMITTED,
    ERI_EXTERNAL_ROUTINE_INVOCATION_EXCEPTION,
    ERI_INVALID_SQLSTATE_RETURNED,
    ERI_NULL_VALUE_NOT_ALLOWED,
    ERI_TRIGGER_PROTOCOL_VIOLATED,
    ERI_SRF_PROTOCOL_VIOLATED,
    SAVEPOINT_EXCEPTION,
    INVALID_SAVEPOINT_SPECIFICATION,
    INVALID_CATALOG_NAME,
    INVALID_SCHEMA_NAME,
    TRANSACTION_ROLLBACK,
    TRANSACTION_INTEGRITY_CONSTRAINT_VIOLATION,
    SERIALIZATION_FAILURE,
    STATEMENT_COMPLETION_UNKNOWN,
    DEADLOCK_DETECTED,
    SYNTAX_ERROR_OR_ACCESS_RULE_VIOLATION,
    SYNTAX_ERROR,
    INSUFFICIENT_PRIVILEGE,
    CANNOT_COERCE,
    GROUPING_ERROR,
    INVALID_FOREIGN_KEY,
    INVALID_NAME,
    NAME_TOO_LONG,
    RESERVED_NAME,
    DATATYPE_MISMATCH,
    INDETERMINATE_DATATYPE,
    WRONG_OBJECT_TYPE,
    UNDEFINED_COLUMN,
    UNDEFINED_FUNCTION,
    UNDEFINED_TABLE,
    UNDEFINED_PARAMETER,
    UNDEFINED_OBJECT,
    DUPLICATE_COLUMN,
    DUPLICATE_CURSOR,
    DUPLICATE_DATABASE,
    DUPLICATE_FUNCTION,
    DUPLICATE_PREPARED_STATEMENT,
    DUPLICATE_SCHEMA,
    DUPLICATE_TABLE,
    DUPLICATE_ALIAS,
    DUPLICATE_OBJECT,
    AMBIGUOUS_COLUMN,
    AMBIGUOUS_FUNCTION,
    AMBIGUOUS_PARAMETER,
    AMBIGUOUS_ALIAS,
    INVALID_COLUMN_REFERENCE,
    INVALID_COLUMN_DEFINITION,
    INVALID_CURSOR_DEFINITION,
    INVALID_DATABASE_DEFINITION,
    INVALID_FUNCTION_DEFINITION,
    INVALID_PREPARED_STATEMENT_DEFINITION,
    INVALID_SCHEMA_DEFINITION,
    INVALID_TABLE_DEFINITION,
    INVALID_OBJECT_DEFINITION,
    WITH_CHECK_OPTION_VIOLATION,
    INSUFFICIENT_RESOURCES,
    DISK_FULL,
    OUT_OF_MEMORY,
    TOO_MANY_CONNECTIONS,
    PROGRAM_LIMIT_EXCEEDED,
    STATEMENT_TOO_COMPLEX,
    TOO_MANY_COLUMNS,
    TOO_MANY_ARGUMENTS,
    OBJECT_NOT_IN_PREREQUISITE_STATE,
    OBJECT_IN_USE,
    CANT_CHANGE_RUNTIME_PARAM,
    LOCK_NOT_AVAILABLE,
    OPERATOR_INTERVENTION,
    QUERY_CANCELED,
    ADMIN_SHUTDOWN,
    CRASH_SHUTDOWN,
    CANNOT_CONNECT_NOW,
    IO_ERROR,
    UNDEFINED_FILE,
    DUPLICATE_FILE,
    CONFIG_FILE_ERROR,
    LOCK_FILE_EXISTS,
    PLPGSQL_ERROR,
    RAISE_EXCEPTION,
    NO_DATA_FOUND,
    TOO_MANY_ROWS,
    INTERNAL_ERROR,
    DATA_CORRUPTED,
    INDEX_CORRUPTED,
    UNKNOWN_ERROR
  );

  function Error_Value (code : string) return Error_Value_t;

end PGAda.Errors;