-- auto generated - do not edit

package body PGAda.Errors is

  type Error_t is record
    code  : access constant string;
    value : Error_Value_t;
  end record;

  str_successful_completion : aliased constant string := "00000";
  str_warning : aliased constant string := "01000";
  str_warn_dynamic_result_sets_returned : aliased constant string := "0100C";
  str_warn_implicit_zero_bit_padding : aliased constant string := "01008";
  str_warn_null_value_eliminated_in_set_function : aliased constant string := "01003";
  str_warn_privilege_not_granted : aliased constant string := "01007";
  str_warn_privilege_not_revoked : aliased constant string := "01006";
  str_warn_string_data_right_truncation : aliased constant string := "01004";
  str_deprecated_feature : aliased constant string := "01P01";
  str_no_data : aliased constant string := "02000";
  str_no_additional_dynamic_result_sets_returned : aliased constant string := "02001";
  str_sql_statement_not_yet_complete : aliased constant string := "03000";
  str_connection_exception : aliased constant string := "08000";
  str_connection_does_not_exist : aliased constant string := "08003";
  str_connection_failure : aliased constant string := "08006";
  str_sqlclient_unable_to_establish_sqlconnection : aliased constant string := "08001";
  str_sqlserver_rejected_establishment_of_sqlconnection : aliased constant string := "08004";
  str_transaction_resolution_unknown : aliased constant string := "08007";
  str_protocol_violation : aliased constant string := "08P01";
  str_triggered_action_exception : aliased constant string := "09000";
  str_feature_not_supported : aliased constant string := "0A000";
  str_invalid_transaction_initiation : aliased constant string := "0B000";
  str_locator_exception : aliased constant string := "0F000";
  str_invalid_locator_specification : aliased constant string := "0F001";
  str_invalid_grantor : aliased constant string := "0L000";
  str_invalid_grant_operation : aliased constant string := "0LP01";
  str_invalid_role_specification : aliased constant string := "0P000";
  str_cardinality_violation : aliased constant string := "21000";
  str_data_exception : aliased constant string := "22000";
  str_array_subscript_error : aliased constant string := "2202E";
  str_character_not_in_repertoire : aliased constant string := "22021";
  str_datetime_field_overflow : aliased constant string := "22008";
  str_division_by_zero : aliased constant string := "22012";
  str_error_in_assignment : aliased constant string := "22005";
  str_escape_character_conflict : aliased constant string := "2200B";
  str_indicator_overflow : aliased constant string := "22022";
  str_interval_field_overflow : aliased constant string := "22015";
  str_invalid_argument_for_logarithm : aliased constant string := "2201E";
  str_invalid_argument_for_power_function : aliased constant string := "2201F";
  str_invalid_argument_for_width_bucket_function : aliased constant string := "2201G";
  str_invalid_character_value_for_cast : aliased constant string := "22018";
  str_invalid_datetime_format : aliased constant string := "22007";
  str_invalid_escape_character : aliased constant string := "22019";
  str_invalid_escape_octet : aliased constant string := "2200D";
  str_invalid_escape_sequence : aliased constant string := "22025";
  str_nonstandard_use_of_escape_character : aliased constant string := "22P06";
  str_invalid_indicator_parameter_value : aliased constant string := "22010";
  str_invalid_limit_value : aliased constant string := "22020";
  str_invalid_parameter_value : aliased constant string := "22023";
  str_invalid_regular_expression : aliased constant string := "2201B";
  str_invalid_time_zone_displacement_value : aliased constant string := "22009";
  str_invalid_use_of_escape_character : aliased constant string := "2200C";
  str_most_specific_type_mismatch : aliased constant string := "2200G";
  str_null_value_not_allowed : aliased constant string := "22004";
  str_null_value_no_indicator_parameter : aliased constant string := "22002";
  str_numeric_value_out_of_range : aliased constant string := "22003";
  str_string_data_length_mismatch : aliased constant string := "22026";
  str_string_data_right_truncation : aliased constant string := "22001";
  str_substring_error : aliased constant string := "22011";
  str_trim_error : aliased constant string := "22027";
  str_unterminated_c_string : aliased constant string := "22024";
  str_zero_length_character_string : aliased constant string := "2200F";
  str_floating_point_exception : aliased constant string := "22P01";
  str_invalid_text_representation : aliased constant string := "22P02";
  str_invalid_binary_representation : aliased constant string := "22P03";
  str_bad_copy_file_format : aliased constant string := "22P04";
  str_untranslatable_character : aliased constant string := "22P05";
  str_not_an_xml_document : aliased constant string := "2200L";
  str_invalid_xml_document : aliased constant string := "2200M";
  str_invalid_xml_content : aliased constant string := "2200N";
  str_invalid_xml_comment : aliased constant string := "2200S";
  str_invalid_xml_processing_instruction : aliased constant string := "2200T";
  str_integrity_constraint_violation : aliased constant string := "23000";
  str_restrict_violation : aliased constant string := "23001";
  str_not_null_violation : aliased constant string := "23502";
  str_foreign_key_violation : aliased constant string := "23503";
  str_unique_violation : aliased constant string := "23505";
  str_check_violation : aliased constant string := "23514";
  str_invalid_cursor_state : aliased constant string := "24000";
  str_invalid_transaction_state : aliased constant string := "25000";
  str_active_sql_transaction : aliased constant string := "25001";
  str_branch_transaction_already_active : aliased constant string := "25002";
  str_held_cursor_requires_same_isolation_level : aliased constant string := "25008";
  str_inappropriate_access_mode_for_branch_transaction : aliased constant string := "25003";
  str_inappropriate_isolation_level_for_branch_transaction : aliased constant string := "25004";
  str_no_active_sql_transaction_for_branch_transaction : aliased constant string := "25005";
  str_read_only_sql_transaction : aliased constant string := "25006";
  str_schema_and_data_statement_mixing_not_supported : aliased constant string := "25007";
  str_no_active_sql_transaction : aliased constant string := "25P01";
  str_in_failed_sql_transaction : aliased constant string := "25P02";
  str_invalid_sql_statement_name : aliased constant string := "26000";
  str_triggered_data_change_violation : aliased constant string := "27000";
  str_invalid_authorization_specification : aliased constant string := "28000";
  str_dependent_privilege_descriptors_still_exist : aliased constant string := "2B000";
  str_dependent_objects_still_exist : aliased constant string := "2BP01";
  str_invalid_transaction_termination : aliased constant string := "2D000";
  str_sre_sql_routine_exception : aliased constant string := "2F000";
  str_sre_function_executed_no_return_statement : aliased constant string := "2F005";
  str_sre_modifying_sql_data_not_permitted : aliased constant string := "2F002";
  str_sre_prohibited_sql_statement_attempted : aliased constant string := "2F003";
  str_sre_reading_sql_data_not_permitted : aliased constant string := "2F004";
  str_invalid_cursor_name : aliased constant string := "34000";
  str_ere_external_routine_exception : aliased constant string := "38000";
  str_ere_containing_sql_not_permitted : aliased constant string := "38001";
  str_ere_modifying_sql_data_not_permitted : aliased constant string := "38002";
  str_ere_prohibited_sql_statement_attempted : aliased constant string := "38003";
  str_ere_reading_sql_data_not_permitted : aliased constant string := "38004";
  str_eri_external_routine_invocation_exception : aliased constant string := "39000";
  str_eri_invalid_sqlstate_returned : aliased constant string := "39001";
  str_eri_null_value_not_allowed : aliased constant string := "39004";
  str_eri_trigger_protocol_violated : aliased constant string := "39P01";
  str_eri_srf_protocol_violated : aliased constant string := "39P02";
  str_savepoint_exception : aliased constant string := "3B000";
  str_invalid_savepoint_specification : aliased constant string := "3B001";
  str_invalid_catalog_name : aliased constant string := "3D000";
  str_invalid_schema_name : aliased constant string := "3F000";
  str_transaction_rollback : aliased constant string := "40000";
  str_transaction_integrity_constraint_violation : aliased constant string := "40002";
  str_serialization_failure : aliased constant string := "40001";
  str_statement_completion_unknown : aliased constant string := "40003";
  str_deadlock_detected : aliased constant string := "40P01";
  str_syntax_error_or_access_rule_violation : aliased constant string := "42000";
  str_syntax_error : aliased constant string := "42601";
  str_insufficient_privilege : aliased constant string := "42501";
  str_cannot_coerce : aliased constant string := "42846";
  str_grouping_error : aliased constant string := "42803";
  str_invalid_foreign_key : aliased constant string := "42830";
  str_invalid_name : aliased constant string := "42602";
  str_name_too_long : aliased constant string := "42622";
  str_reserved_name : aliased constant string := "42939";
  str_datatype_mismatch : aliased constant string := "42804";
  str_indeterminate_datatype : aliased constant string := "42P18";
  str_wrong_object_type : aliased constant string := "42809";
  str_undefined_column : aliased constant string := "42703";
  str_undefined_function : aliased constant string := "42883";
  str_undefined_table : aliased constant string := "42P01";
  str_undefined_parameter : aliased constant string := "42P02";
  str_undefined_object : aliased constant string := "42704";
  str_duplicate_column : aliased constant string := "42701";
  str_duplicate_cursor : aliased constant string := "42P03";
  str_duplicate_database : aliased constant string := "42P04";
  str_duplicate_function : aliased constant string := "42723";
  str_duplicate_prepared_statement : aliased constant string := "42P05";
  str_duplicate_schema : aliased constant string := "42P06";
  str_duplicate_table : aliased constant string := "42P07";
  str_duplicate_alias : aliased constant string := "42712";
  str_duplicate_object : aliased constant string := "42710";
  str_ambiguous_column : aliased constant string := "42702";
  str_ambiguous_function : aliased constant string := "42725";
  str_ambiguous_parameter : aliased constant string := "42P08";
  str_ambiguous_alias : aliased constant string := "42P09";
  str_invalid_column_reference : aliased constant string := "42P10";
  str_invalid_column_definition : aliased constant string := "42611";
  str_invalid_cursor_definition : aliased constant string := "42P11";
  str_invalid_database_definition : aliased constant string := "42P12";
  str_invalid_function_definition : aliased constant string := "42P13";
  str_invalid_prepared_statement_definition : aliased constant string := "42P14";
  str_invalid_schema_definition : aliased constant string := "42P15";
  str_invalid_table_definition : aliased constant string := "42P16";
  str_invalid_object_definition : aliased constant string := "42P17";
  str_with_check_option_violation : aliased constant string := "44000";
  str_insufficient_resources : aliased constant string := "53000";
  str_disk_full : aliased constant string := "53100";
  str_out_of_memory : aliased constant string := "53200";
  str_too_many_connections : aliased constant string := "53300";
  str_program_limit_exceeded : aliased constant string := "54000";
  str_statement_too_complex : aliased constant string := "54001";
  str_too_many_columns : aliased constant string := "54011";
  str_too_many_arguments : aliased constant string := "54023";
  str_object_not_in_prerequisite_state : aliased constant string := "55000";
  str_object_in_use : aliased constant string := "55006";
  str_cant_change_runtime_param : aliased constant string := "55P02";
  str_lock_not_available : aliased constant string := "55P03";
  str_operator_intervention : aliased constant string := "57000";
  str_query_canceled : aliased constant string := "57014";
  str_admin_shutdown : aliased constant string := "57P01";
  str_crash_shutdown : aliased constant string := "57P02";
  str_cannot_connect_now : aliased constant string := "57P03";
  str_io_error : aliased constant string := "58030";
  str_undefined_file : aliased constant string := "58P01";
  str_duplicate_file : aliased constant string := "58P02";
  str_config_file_error : aliased constant string := "F0000";
  str_lock_file_exists : aliased constant string := "F0001";
  str_plpgsql_error : aliased constant string := "P0000";
  str_raise_exception : aliased constant string := "P0001";
  str_no_data_found : aliased constant string := "P0002";
  str_too_many_rows : aliased constant string := "P0003";
  str_internal_error : aliased constant string := "XX000";
  str_data_corrupted : aliased constant string := "XX001";
  str_index_corrupted : aliased constant string := "XX002";
  str_unknown_error : aliased constant string := "ZZZZZ";

  error_codes : constant array (natural range <>) of Error_t := (
    (code => str_successful_completion'access, value => SUCCESSFUL_COMPLETION),
    (code => str_warning'access, value => WARNING),
    (code => str_warn_dynamic_result_sets_returned'access, value => WARN_DYNAMIC_RESULT_SETS_RETURNED),
    (code => str_warn_implicit_zero_bit_padding'access, value => WARN_IMPLICIT_ZERO_BIT_PADDING),
    (code => str_warn_null_value_eliminated_in_set_function'access, value => WARN_NULL_VALUE_ELIMINATED_IN_SET_FUNCTION),
    (code => str_warn_privilege_not_granted'access, value => WARN_PRIVILEGE_NOT_GRANTED),
    (code => str_warn_privilege_not_revoked'access, value => WARN_PRIVILEGE_NOT_REVOKED),
    (code => str_warn_string_data_right_truncation'access, value => WARN_STRING_DATA_RIGHT_TRUNCATION),
    (code => str_deprecated_feature'access, value => DEPRECATED_FEATURE),
    (code => str_no_data'access, value => NO_DATA),
    (code => str_no_additional_dynamic_result_sets_returned'access, value => NO_ADDITIONAL_DYNAMIC_RESULT_SETS_RETURNED),
    (code => str_sql_statement_not_yet_complete'access, value => SQL_STATEMENT_NOT_YET_COMPLETE),
    (code => str_connection_exception'access, value => CONNECTION_EXCEPTION),
    (code => str_connection_does_not_exist'access, value => CONNECTION_DOES_NOT_EXIST),
    (code => str_connection_failure'access, value => CONNECTION_FAILURE),
    (code => str_sqlclient_unable_to_establish_sqlconnection'access, value => SQLCLIENT_UNABLE_TO_ESTABLISH_SQLCONNECTION),
    (code => str_sqlserver_rejected_establishment_of_sqlconnection'access, value => SQLSERVER_REJECTED_ESTABLISHMENT_OF_SQLCONNECTION),
    (code => str_transaction_resolution_unknown'access, value => TRANSACTION_RESOLUTION_UNKNOWN),
    (code => str_protocol_violation'access, value => PROTOCOL_VIOLATION),
    (code => str_triggered_action_exception'access, value => TRIGGERED_ACTION_EXCEPTION),
    (code => str_feature_not_supported'access, value => FEATURE_NOT_SUPPORTED),
    (code => str_invalid_transaction_initiation'access, value => INVALID_TRANSACTION_INITIATION),
    (code => str_locator_exception'access, value => LOCATOR_EXCEPTION),
    (code => str_invalid_locator_specification'access, value => INVALID_LOCATOR_SPECIFICATION),
    (code => str_invalid_grantor'access, value => INVALID_GRANTOR),
    (code => str_invalid_grant_operation'access, value => INVALID_GRANT_OPERATION),
    (code => str_invalid_role_specification'access, value => INVALID_ROLE_SPECIFICATION),
    (code => str_cardinality_violation'access, value => CARDINALITY_VIOLATION),
    (code => str_data_exception'access, value => DATA_EXCEPTION),
    (code => str_array_subscript_error'access, value => ARRAY_SUBSCRIPT_ERROR),
    (code => str_character_not_in_repertoire'access, value => CHARACTER_NOT_IN_REPERTOIRE),
    (code => str_datetime_field_overflow'access, value => DATETIME_FIELD_OVERFLOW),
    (code => str_division_by_zero'access, value => DIVISION_BY_ZERO),
    (code => str_error_in_assignment'access, value => ERROR_IN_ASSIGNMENT),
    (code => str_escape_character_conflict'access, value => ESCAPE_CHARACTER_CONFLICT),
    (code => str_indicator_overflow'access, value => INDICATOR_OVERFLOW),
    (code => str_interval_field_overflow'access, value => INTERVAL_FIELD_OVERFLOW),
    (code => str_invalid_argument_for_logarithm'access, value => INVALID_ARGUMENT_FOR_LOGARITHM),
    (code => str_invalid_argument_for_power_function'access, value => INVALID_ARGUMENT_FOR_POWER_FUNCTION),
    (code => str_invalid_argument_for_width_bucket_function'access, value => INVALID_ARGUMENT_FOR_WIDTH_BUCKET_FUNCTION),
    (code => str_invalid_character_value_for_cast'access, value => INVALID_CHARACTER_VALUE_FOR_CAST),
    (code => str_invalid_datetime_format'access, value => INVALID_DATETIME_FORMAT),
    (code => str_invalid_escape_character'access, value => INVALID_ESCAPE_CHARACTER),
    (code => str_invalid_escape_octet'access, value => INVALID_ESCAPE_OCTET),
    (code => str_invalid_escape_sequence'access, value => INVALID_ESCAPE_SEQUENCE),
    (code => str_nonstandard_use_of_escape_character'access, value => NONSTANDARD_USE_OF_ESCAPE_CHARACTER),
    (code => str_invalid_indicator_parameter_value'access, value => INVALID_INDICATOR_PARAMETER_VALUE),
    (code => str_invalid_limit_value'access, value => INVALID_LIMIT_VALUE),
    (code => str_invalid_parameter_value'access, value => INVALID_PARAMETER_VALUE),
    (code => str_invalid_regular_expression'access, value => INVALID_REGULAR_EXPRESSION),
    (code => str_invalid_time_zone_displacement_value'access, value => INVALID_TIME_ZONE_DISPLACEMENT_VALUE),
    (code => str_invalid_use_of_escape_character'access, value => INVALID_USE_OF_ESCAPE_CHARACTER),
    (code => str_most_specific_type_mismatch'access, value => MOST_SPECIFIC_TYPE_MISMATCH),
    (code => str_null_value_not_allowed'access, value => NULL_VALUE_NOT_ALLOWED),
    (code => str_null_value_no_indicator_parameter'access, value => NULL_VALUE_NO_INDICATOR_PARAMETER),
    (code => str_numeric_value_out_of_range'access, value => NUMERIC_VALUE_OUT_OF_RANGE),
    (code => str_string_data_length_mismatch'access, value => STRING_DATA_LENGTH_MISMATCH),
    (code => str_string_data_right_truncation'access, value => STRING_DATA_RIGHT_TRUNCATION),
    (code => str_substring_error'access, value => SUBSTRING_ERROR),
    (code => str_trim_error'access, value => TRIM_ERROR),
    (code => str_unterminated_c_string'access, value => UNTERMINATED_C_STRING),
    (code => str_zero_length_character_string'access, value => ZERO_LENGTH_CHARACTER_STRING),
    (code => str_floating_point_exception'access, value => FLOATING_POINT_EXCEPTION),
    (code => str_invalid_text_representation'access, value => INVALID_TEXT_REPRESENTATION),
    (code => str_invalid_binary_representation'access, value => INVALID_BINARY_REPRESENTATION),
    (code => str_bad_copy_file_format'access, value => BAD_COPY_FILE_FORMAT),
    (code => str_untranslatable_character'access, value => UNTRANSLATABLE_CHARACTER),
    (code => str_not_an_xml_document'access, value => NOT_AN_XML_DOCUMENT),
    (code => str_invalid_xml_document'access, value => INVALID_XML_DOCUMENT),
    (code => str_invalid_xml_content'access, value => INVALID_XML_CONTENT),
    (code => str_invalid_xml_comment'access, value => INVALID_XML_COMMENT),
    (code => str_invalid_xml_processing_instruction'access, value => INVALID_XML_PROCESSING_INSTRUCTION),
    (code => str_integrity_constraint_violation'access, value => INTEGRITY_CONSTRAINT_VIOLATION),
    (code => str_restrict_violation'access, value => RESTRICT_VIOLATION),
    (code => str_not_null_violation'access, value => NOT_NULL_VIOLATION),
    (code => str_foreign_key_violation'access, value => FOREIGN_KEY_VIOLATION),
    (code => str_unique_violation'access, value => UNIQUE_VIOLATION),
    (code => str_check_violation'access, value => CHECK_VIOLATION),
    (code => str_invalid_cursor_state'access, value => INVALID_CURSOR_STATE),
    (code => str_invalid_transaction_state'access, value => INVALID_TRANSACTION_STATE),
    (code => str_active_sql_transaction'access, value => ACTIVE_SQL_TRANSACTION),
    (code => str_branch_transaction_already_active'access, value => BRANCH_TRANSACTION_ALREADY_ACTIVE),
    (code => str_held_cursor_requires_same_isolation_level'access, value => HELD_CURSOR_REQUIRES_SAME_ISOLATION_LEVEL),
    (code => str_inappropriate_access_mode_for_branch_transaction'access, value => INAPPROPRIATE_ACCESS_MODE_FOR_BRANCH_TRANSACTION),
    (code => str_inappropriate_isolation_level_for_branch_transaction'access, value => INAPPROPRIATE_ISOLATION_LEVEL_FOR_BRANCH_TRANSACTION),
    (code => str_no_active_sql_transaction_for_branch_transaction'access, value => NO_ACTIVE_SQL_TRANSACTION_FOR_BRANCH_TRANSACTION),
    (code => str_read_only_sql_transaction'access, value => READ_ONLY_SQL_TRANSACTION),
    (code => str_schema_and_data_statement_mixing_not_supported'access, value => SCHEMA_AND_DATA_STATEMENT_MIXING_NOT_SUPPORTED),
    (code => str_no_active_sql_transaction'access, value => NO_ACTIVE_SQL_TRANSACTION),
    (code => str_in_failed_sql_transaction'access, value => IN_FAILED_SQL_TRANSACTION),
    (code => str_invalid_sql_statement_name'access, value => INVALID_SQL_STATEMENT_NAME),
    (code => str_triggered_data_change_violation'access, value => TRIGGERED_DATA_CHANGE_VIOLATION),
    (code => str_invalid_authorization_specification'access, value => INVALID_AUTHORIZATION_SPECIFICATION),
    (code => str_dependent_privilege_descriptors_still_exist'access, value => DEPENDENT_PRIVILEGE_DESCRIPTORS_STILL_EXIST),
    (code => str_dependent_objects_still_exist'access, value => DEPENDENT_OBJECTS_STILL_EXIST),
    (code => str_invalid_transaction_termination'access, value => INVALID_TRANSACTION_TERMINATION),
    (code => str_sre_sql_routine_exception'access, value => SRE_SQL_ROUTINE_EXCEPTION),
    (code => str_sre_function_executed_no_return_statement'access, value => SRE_FUNCTION_EXECUTED_NO_RETURN_STATEMENT),
    (code => str_sre_modifying_sql_data_not_permitted'access, value => SRE_MODIFYING_SQL_DATA_NOT_PERMITTED),
    (code => str_sre_prohibited_sql_statement_attempted'access, value => SRE_PROHIBITED_SQL_STATEMENT_ATTEMPTED),
    (code => str_sre_reading_sql_data_not_permitted'access, value => SRE_READING_SQL_DATA_NOT_PERMITTED),
    (code => str_invalid_cursor_name'access, value => INVALID_CURSOR_NAME),
    (code => str_ere_external_routine_exception'access, value => ERE_EXTERNAL_ROUTINE_EXCEPTION),
    (code => str_ere_containing_sql_not_permitted'access, value => ERE_CONTAINING_SQL_NOT_PERMITTED),
    (code => str_ere_modifying_sql_data_not_permitted'access, value => ERE_MODIFYING_SQL_DATA_NOT_PERMITTED),
    (code => str_ere_prohibited_sql_statement_attempted'access, value => ERE_PROHIBITED_SQL_STATEMENT_ATTEMPTED),
    (code => str_ere_reading_sql_data_not_permitted'access, value => ERE_READING_SQL_DATA_NOT_PERMITTED),
    (code => str_eri_external_routine_invocation_exception'access, value => ERI_EXTERNAL_ROUTINE_INVOCATION_EXCEPTION),
    (code => str_eri_invalid_sqlstate_returned'access, value => ERI_INVALID_SQLSTATE_RETURNED),
    (code => str_eri_null_value_not_allowed'access, value => ERI_NULL_VALUE_NOT_ALLOWED),
    (code => str_eri_trigger_protocol_violated'access, value => ERI_TRIGGER_PROTOCOL_VIOLATED),
    (code => str_eri_srf_protocol_violated'access, value => ERI_SRF_PROTOCOL_VIOLATED),
    (code => str_savepoint_exception'access, value => SAVEPOINT_EXCEPTION),
    (code => str_invalid_savepoint_specification'access, value => INVALID_SAVEPOINT_SPECIFICATION),
    (code => str_invalid_catalog_name'access, value => INVALID_CATALOG_NAME),
    (code => str_invalid_schema_name'access, value => INVALID_SCHEMA_NAME),
    (code => str_transaction_rollback'access, value => TRANSACTION_ROLLBACK),
    (code => str_transaction_integrity_constraint_violation'access, value => TRANSACTION_INTEGRITY_CONSTRAINT_VIOLATION),
    (code => str_serialization_failure'access, value => SERIALIZATION_FAILURE),
    (code => str_statement_completion_unknown'access, value => STATEMENT_COMPLETION_UNKNOWN),
    (code => str_deadlock_detected'access, value => DEADLOCK_DETECTED),
    (code => str_syntax_error_or_access_rule_violation'access, value => SYNTAX_ERROR_OR_ACCESS_RULE_VIOLATION),
    (code => str_syntax_error'access, value => SYNTAX_ERROR),
    (code => str_insufficient_privilege'access, value => INSUFFICIENT_PRIVILEGE),
    (code => str_cannot_coerce'access, value => CANNOT_COERCE),
    (code => str_grouping_error'access, value => GROUPING_ERROR),
    (code => str_invalid_foreign_key'access, value => INVALID_FOREIGN_KEY),
    (code => str_invalid_name'access, value => INVALID_NAME),
    (code => str_name_too_long'access, value => NAME_TOO_LONG),
    (code => str_reserved_name'access, value => RESERVED_NAME),
    (code => str_datatype_mismatch'access, value => DATATYPE_MISMATCH),
    (code => str_indeterminate_datatype'access, value => INDETERMINATE_DATATYPE),
    (code => str_wrong_object_type'access, value => WRONG_OBJECT_TYPE),
    (code => str_undefined_column'access, value => UNDEFINED_COLUMN),
    (code => str_undefined_function'access, value => UNDEFINED_FUNCTION),
    (code => str_undefined_table'access, value => UNDEFINED_TABLE),
    (code => str_undefined_parameter'access, value => UNDEFINED_PARAMETER),
    (code => str_undefined_object'access, value => UNDEFINED_OBJECT),
    (code => str_duplicate_column'access, value => DUPLICATE_COLUMN),
    (code => str_duplicate_cursor'access, value => DUPLICATE_CURSOR),
    (code => str_duplicate_database'access, value => DUPLICATE_DATABASE),
    (code => str_duplicate_function'access, value => DUPLICATE_FUNCTION),
    (code => str_duplicate_prepared_statement'access, value => DUPLICATE_PREPARED_STATEMENT),
    (code => str_duplicate_schema'access, value => DUPLICATE_SCHEMA),
    (code => str_duplicate_table'access, value => DUPLICATE_TABLE),
    (code => str_duplicate_alias'access, value => DUPLICATE_ALIAS),
    (code => str_duplicate_object'access, value => DUPLICATE_OBJECT),
    (code => str_ambiguous_column'access, value => AMBIGUOUS_COLUMN),
    (code => str_ambiguous_function'access, value => AMBIGUOUS_FUNCTION),
    (code => str_ambiguous_parameter'access, value => AMBIGUOUS_PARAMETER),
    (code => str_ambiguous_alias'access, value => AMBIGUOUS_ALIAS),
    (code => str_invalid_column_reference'access, value => INVALID_COLUMN_REFERENCE),
    (code => str_invalid_column_definition'access, value => INVALID_COLUMN_DEFINITION),
    (code => str_invalid_cursor_definition'access, value => INVALID_CURSOR_DEFINITION),
    (code => str_invalid_database_definition'access, value => INVALID_DATABASE_DEFINITION),
    (code => str_invalid_function_definition'access, value => INVALID_FUNCTION_DEFINITION),
    (code => str_invalid_prepared_statement_definition'access, value => INVALID_PREPARED_STATEMENT_DEFINITION),
    (code => str_invalid_schema_definition'access, value => INVALID_SCHEMA_DEFINITION),
    (code => str_invalid_table_definition'access, value => INVALID_TABLE_DEFINITION),
    (code => str_invalid_object_definition'access, value => INVALID_OBJECT_DEFINITION),
    (code => str_with_check_option_violation'access, value => WITH_CHECK_OPTION_VIOLATION),
    (code => str_insufficient_resources'access, value => INSUFFICIENT_RESOURCES),
    (code => str_disk_full'access, value => DISK_FULL),
    (code => str_out_of_memory'access, value => OUT_OF_MEMORY),
    (code => str_too_many_connections'access, value => TOO_MANY_CONNECTIONS),
    (code => str_program_limit_exceeded'access, value => PROGRAM_LIMIT_EXCEEDED),
    (code => str_statement_too_complex'access, value => STATEMENT_TOO_COMPLEX),
    (code => str_too_many_columns'access, value => TOO_MANY_COLUMNS),
    (code => str_too_many_arguments'access, value => TOO_MANY_ARGUMENTS),
    (code => str_object_not_in_prerequisite_state'access, value => OBJECT_NOT_IN_PREREQUISITE_STATE),
    (code => str_object_in_use'access, value => OBJECT_IN_USE),
    (code => str_cant_change_runtime_param'access, value => CANT_CHANGE_RUNTIME_PARAM),
    (code => str_lock_not_available'access, value => LOCK_NOT_AVAILABLE),
    (code => str_operator_intervention'access, value => OPERATOR_INTERVENTION),
    (code => str_query_canceled'access, value => QUERY_CANCELED),
    (code => str_admin_shutdown'access, value => ADMIN_SHUTDOWN),
    (code => str_crash_shutdown'access, value => CRASH_SHUTDOWN),
    (code => str_cannot_connect_now'access, value => CANNOT_CONNECT_NOW),
    (code => str_io_error'access, value => IO_ERROR),
    (code => str_undefined_file'access, value => UNDEFINED_FILE),
    (code => str_duplicate_file'access, value => DUPLICATE_FILE),
    (code => str_config_file_error'access, value => CONFIG_FILE_ERROR),
    (code => str_lock_file_exists'access, value => LOCK_FILE_EXISTS),
    (code => str_plpgsql_error'access, value => PLPGSQL_ERROR),
    (code => str_raise_exception'access, value => RAISE_EXCEPTION),
    (code => str_no_data_found'access, value => NO_DATA_FOUND),
    (code => str_too_many_rows'access, value => TOO_MANY_ROWS),
    (code => str_internal_error'access, value => INTERNAL_ERROR),
    (code => str_data_corrupted'access, value => DATA_CORRUPTED),
    (code => str_index_corrupted'access, value => INDEX_CORRUPTED),
    (code => str_unknown_error'access, value => UNKNOWN_ERROR)
  );

  function Error_Value (code : string)
    return Error_Value_t is
  begin
    for index in error_codes'range loop
      if error_codes (index).code.all = code then
        return error_codes (index).value;
      end if;
    end loop;
    return unknown_error;
  end Error_Value;

end PGAda.Errors;
