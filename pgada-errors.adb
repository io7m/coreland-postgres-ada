-- auto generated - do not edit

package body PGAda.Errors is

  type Error_t is record
    code  : access constant string;
    value : Error_Value_t;
  end record;

  str_Successful_Completion : aliased constant string := "00000";
  str_Warning : aliased constant string := "01000";
  str_Warn_Dynamic_Result_Sets_Returned : aliased constant string := "0100C";
  str_Warn_Implicit_Zero_Bit_Padding : aliased constant string := "01008";
  str_Warn_Null_Value_Eliminated_In_Set_Function : aliased constant string := "01003";
  str_Warn_Privilege_Not_Granted : aliased constant string := "01007";
  str_Warn_Privilege_Not_Revoked : aliased constant string := "01006";
  str_Warn_String_Data_Right_Truncation : aliased constant string := "01004";
  str_Deprecated_Feature : aliased constant string := "01P01";
  str_No_Data : aliased constant string := "02000";
  str_No_Additional_Dynamic_Result_Sets_Returned : aliased constant string := "02001";
  str_SQL_Statement_Not_Yet_Complete : aliased constant string := "03000";
  str_Connection_Exception : aliased constant string := "08000";
  str_Connection_Does_Not_Exist : aliased constant string := "08003";
  str_Connection_Failure : aliased constant string := "08006";
  str_SQL_Client_Unable_To_Establish_SQL_Connection : aliased constant string := "08001";
  str_SQL_Server_Rejected_Establishment_Of_SQL_Connection : aliased constant string := "08004";
  str_Transaction_Resolution_Unknown : aliased constant string := "08007";
  str_Protocol_Violation : aliased constant string := "08P01";
  str_Triggered_Action_Exception : aliased constant string := "09000";
  str_Feature_Not_Supported : aliased constant string := "0A000";
  str_Invalid_Transaction_Initiation : aliased constant string := "0B000";
  str_Locator_Exception : aliased constant string := "0F000";
  str_Invalid_Locator_Specification : aliased constant string := "0F001";
  str_Invalid_Grantor : aliased constant string := "0L000";
  str_Invalid_Grant_Operation : aliased constant string := "0LP01";
  str_Invalid_Role_Specification : aliased constant string := "0P000";
  str_Cardinality_Violation : aliased constant string := "21000";
  str_Data_Exception : aliased constant string := "22000";
  str_Array_Subscript_Error : aliased constant string := "2202E";
  str_Character_Not_In_Repertoire : aliased constant string := "22021";
  str_Datetime_Field_Overflow : aliased constant string := "22008";
  str_Division_By_Zero : aliased constant string := "22012";
  str_Error_In_Assignment : aliased constant string := "22005";
  str_Escape_Character_Conflict : aliased constant string := "2200B";
  str_Indicator_Overflow : aliased constant string := "22022";
  str_Interval_Field_Overflow : aliased constant string := "22015";
  str_Invalid_Argument_For_Logarithm : aliased constant string := "2201E";
  str_Invalid_Argument_For_Power_Function : aliased constant string := "2201F";
  str_Invalid_Argument_For_Width_Bucket_Function : aliased constant string := "2201G";
  str_Invalid_Character_Value_For_Cast : aliased constant string := "22018";
  str_Invalid_Datetime_Format : aliased constant string := "22007";
  str_Invalid_Escape_Character : aliased constant string := "22019";
  str_Invalid_Escape_Octet : aliased constant string := "2200D";
  str_Invalid_Escape_Sequence : aliased constant string := "22025";
  str_Nonstandard_Use_Of_Escape_Character : aliased constant string := "22P06";
  str_Invalid_Indicator_Parameter_Value : aliased constant string := "22010";
  str_Invalid_Limit_Value : aliased constant string := "22020";
  str_Invalid_Parameter_Value : aliased constant string := "22023";
  str_Invalid_Regular_Expression : aliased constant string := "2201B";
  str_Invalid_Time_Zone_Displacement_Value : aliased constant string := "22009";
  str_Invalid_Use_Of_Escape_Character : aliased constant string := "2200C";
  str_Most_Specific_Type_Mismatch : aliased constant string := "2200G";
  str_Null_Value_Not_Allowed : aliased constant string := "22004";
  str_Null_Value_No_Indicator_Parameter : aliased constant string := "22002";
  str_Numeric_Value_Out_Of_Range : aliased constant string := "22003";
  str_String_Data_Length_Mismatch : aliased constant string := "22026";
  str_String_Data_Right_Truncation : aliased constant string := "22001";
  str_Substring_Error : aliased constant string := "22011";
  str_Trim_Error : aliased constant string := "22027";
  str_Unterminated_C_String : aliased constant string := "22024";
  str_Zero_Length_Character_String : aliased constant string := "2200F";
  str_Floating_Point_Exception : aliased constant string := "22P01";
  str_Invalid_Text_Representation : aliased constant string := "22P02";
  str_Invalid_Binary_Representation : aliased constant string := "22P03";
  str_Bad_Copy_File_Format : aliased constant string := "22P04";
  str_Untranslatable_Character : aliased constant string := "22P05";
  str_Not_An_XML_Document : aliased constant string := "2200L";
  str_Invalid_XML_Document : aliased constant string := "2200M";
  str_Invalid_XML_Content : aliased constant string := "2200N";
  str_Invalid_XML_Comment : aliased constant string := "2200S";
  str_Invalid_XML_Processing_Instruction : aliased constant string := "2200T";
  str_Integrity_Constraint_Violation : aliased constant string := "23000";
  str_Restrict_Violation : aliased constant string := "23001";
  str_Not_Null_Violation : aliased constant string := "23502";
  str_Foreign_Key_Violation : aliased constant string := "23503";
  str_Unique_Violation : aliased constant string := "23505";
  str_Check_Violation : aliased constant string := "23514";
  str_Invalid_Cursor_State : aliased constant string := "24000";
  str_Invalid_Transaction_State : aliased constant string := "25000";
  str_Active_SQL_Transaction : aliased constant string := "25001";
  str_Branch_Transaction_Already_Active : aliased constant string := "25002";
  str_Held_Cursor_Requires_Same_Isolation_Level : aliased constant string := "25008";
  str_Inappropriate_Access_Mode_For_Branch_Transaction : aliased constant string := "25003";
  str_Inappropriate_Isolation_Level_For_Branch_Transaction : aliased constant string := "25004";
  str_No_Active_SQL_Transaction_For_Branch_Transaction : aliased constant string := "25005";
  str_Read_Only_SQL_Transaction : aliased constant string := "25006";
  str_Schema_And_Data_Statement_Mixing_Not_Supported : aliased constant string := "25007";
  str_No_Active_SQL_Transaction : aliased constant string := "25P01";
  str_In_Failed_SQL_Transaction : aliased constant string := "25P02";
  str_Invalid_SQL_Statement_Name : aliased constant string := "26000";
  str_Triggered_Data_Change_Violation : aliased constant string := "27000";
  str_Invalid_Authorization_Specification : aliased constant string := "28000";
  str_Dependent_Privilege_Descriptors_Still_Exist : aliased constant string := "2B000";
  str_Dependent_Objects_Still_Exist : aliased constant string := "2BP01";
  str_Invalid_Transaction_Termination : aliased constant string := "2D000";
  str_SRE_SQL_Routine_Exception : aliased constant string := "2F000";
  str_SRE_Function_Executed_No_Return_Statement : aliased constant string := "2F005";
  str_SRE_Modifying_SQL_Data_Not_Permitted : aliased constant string := "2F002";
  str_SRE_Prohibited_SQL_Statement_Attempted : aliased constant string := "2F003";
  str_SRE_Reading_SQL_Data_Not_Permitted : aliased constant string := "2F004";
  str_Invalid_Cursor_Name : aliased constant string := "34000";
  str_ERE_External_Routine_Exception : aliased constant string := "38000";
  str_ERE_Containing_SQL_Not_Permitted : aliased constant string := "38001";
  str_ERE_Modifying_SQL_Data_Not_Permitted : aliased constant string := "38002";
  str_ERE_Prohibited_SQL_Statement_Attempted : aliased constant string := "38003";
  str_ERE_Reading_SQL_Data_Not_Permitted : aliased constant string := "38004";
  str_ERI_External_Routine_Invocation_Exception : aliased constant string := "39000";
  str_ERI_Invalid_SQLstate_Returned : aliased constant string := "39001";
  str_ERI_Null_Value_Not_Allowed : aliased constant string := "39004";
  str_ERI_Trigger_Protocol_Violated : aliased constant string := "39P01";
  str_ERI_SRF_Protocol_Violated : aliased constant string := "39P02";
  str_Savepoint_Exception : aliased constant string := "3B000";
  str_Invalid_Savepoint_Specification : aliased constant string := "3B001";
  str_Invalid_Catalog_Name : aliased constant string := "3D000";
  str_Invalid_Schema_Name : aliased constant string := "3F000";
  str_Transaction_Rollback : aliased constant string := "40000";
  str_Transaction_Integrity_Constraint_Violation : aliased constant string := "40002";
  str_Serialization_Failure : aliased constant string := "40001";
  str_Statement_Completion_Unknown : aliased constant string := "40003";
  str_Deadlock_Detected : aliased constant string := "40P01";
  str_Syntax_Error_Or_Access_Rule_Violation : aliased constant string := "42000";
  str_Syntax_Error : aliased constant string := "42601";
  str_Insufficient_Privilege : aliased constant string := "42501";
  str_Cannot_Coerce : aliased constant string := "42846";
  str_Grouping_Error : aliased constant string := "42803";
  str_Invalid_Foreign_Key : aliased constant string := "42830";
  str_Invalid_Name : aliased constant string := "42602";
  str_Name_Too_Long : aliased constant string := "42622";
  str_Reserved_Name : aliased constant string := "42939";
  str_Datatype_Mismatch : aliased constant string := "42804";
  str_Indeterminate_Datatype : aliased constant string := "42P18";
  str_Wrong_Object_Type : aliased constant string := "42809";
  str_Undefined_Column : aliased constant string := "42703";
  str_Undefined_Function : aliased constant string := "42883";
  str_Undefined_Table : aliased constant string := "42P01";
  str_Undefined_Parameter : aliased constant string := "42P02";
  str_Undefined_Object : aliased constant string := "42704";
  str_Duplicate_Column : aliased constant string := "42701";
  str_Duplicate_Cursor : aliased constant string := "42P03";
  str_Duplicate_Database : aliased constant string := "42P04";
  str_Duplicate_Function : aliased constant string := "42723";
  str_Duplicate_Prepared_Statement : aliased constant string := "42P05";
  str_Duplicate_Schema : aliased constant string := "42P06";
  str_Duplicate_Table : aliased constant string := "42P07";
  str_Duplicate_Alias : aliased constant string := "42712";
  str_Duplicate_Object : aliased constant string := "42710";
  str_Ambiguous_Column : aliased constant string := "42702";
  str_Ambiguous_Function : aliased constant string := "42725";
  str_Ambiguous_Parameter : aliased constant string := "42P08";
  str_Ambiguous_Alias : aliased constant string := "42P09";
  str_Invalid_Column_Reference : aliased constant string := "42P10";
  str_Invalid_Column_Definition : aliased constant string := "42611";
  str_Invalid_Cursor_Definition : aliased constant string := "42P11";
  str_Invalid_Database_Definition : aliased constant string := "42P12";
  str_Invalid_Function_Definition : aliased constant string := "42P13";
  str_Invalid_Prepared_Statement_Definition : aliased constant string := "42P14";
  str_Invalid_Schema_Definition : aliased constant string := "42P15";
  str_Invalid_Table_Definition : aliased constant string := "42P16";
  str_Invalid_Object_Definition : aliased constant string := "42P17";
  str_With_Check_Option_Violation : aliased constant string := "44000";
  str_Insufficient_Resources : aliased constant string := "53000";
  str_Disk_Full : aliased constant string := "53100";
  str_Out_Of_Memory : aliased constant string := "53200";
  str_Too_Many_Connections : aliased constant string := "53300";
  str_Program_Limit_Exceeded : aliased constant string := "54000";
  str_Statement_Too_Complex : aliased constant string := "54001";
  str_Too_Many_Columns : aliased constant string := "54011";
  str_Too_Many_Arguments : aliased constant string := "54023";
  str_Object_Not_In_Prerequisite_State : aliased constant string := "55000";
  str_Object_In_Use : aliased constant string := "55006";
  str_Cant_Change_Runtime_Param : aliased constant string := "55P02";
  str_Lock_Not_Available : aliased constant string := "55P03";
  str_Operator_Intervention : aliased constant string := "57000";
  str_Query_Canceled : aliased constant string := "57014";
  str_Admin_Shutdown : aliased constant string := "57P01";
  str_Crash_Shutdown : aliased constant string := "57P02";
  str_Cannot_Connect_Now : aliased constant string := "57P03";
  str_IO_Error : aliased constant string := "58030";
  str_Undefined_File : aliased constant string := "58P01";
  str_Duplicate_File : aliased constant string := "58P02";
  str_Config_File_Error : aliased constant string := "F0000";
  str_Lock_File_Exists : aliased constant string := "F0001";
  str_Plpgsql_Error : aliased constant string := "P0000";
  str_Raise_Exception : aliased constant string := "P0001";
  str_No_Data_Found : aliased constant string := "P0002";
  str_Too_Many_Rows : aliased constant string := "P0003";
  str_Internal_Error : aliased constant string := "XX000";
  str_Data_Corrupted : aliased constant string := "XX001";
  str_Index_Corrupted : aliased constant string := "XX002";
  str_Unknown_Error : aliased constant string := "ZZZZZ";

  error_codes : constant array (natural range <>) of Error_t := (
    (code => str_Successful_Completion'access, value => Successful_Completion),
    (code => str_Warning'access, value => Warning),
    (code => str_Warn_Dynamic_Result_Sets_Returned'access, value => Warn_Dynamic_Result_Sets_Returned),
    (code => str_Warn_Implicit_Zero_Bit_Padding'access, value => Warn_Implicit_Zero_Bit_Padding),
    (code => str_Warn_Null_Value_Eliminated_In_Set_Function'access, value => Warn_Null_Value_Eliminated_In_Set_Function),
    (code => str_Warn_Privilege_Not_Granted'access, value => Warn_Privilege_Not_Granted),
    (code => str_Warn_Privilege_Not_Revoked'access, value => Warn_Privilege_Not_Revoked),
    (code => str_Warn_String_Data_Right_Truncation'access, value => Warn_String_Data_Right_Truncation),
    (code => str_Deprecated_Feature'access, value => Deprecated_Feature),
    (code => str_No_Data'access, value => No_Data),
    (code => str_No_Additional_Dynamic_Result_Sets_Returned'access, value => No_Additional_Dynamic_Result_Sets_Returned),
    (code => str_SQL_Statement_Not_Yet_Complete'access, value => SQL_Statement_Not_Yet_Complete),
    (code => str_Connection_Exception'access, value => Connection_Exception),
    (code => str_Connection_Does_Not_Exist'access, value => Connection_Does_Not_Exist),
    (code => str_Connection_Failure'access, value => Connection_Failure),
    (code => str_SQL_Client_Unable_To_Establish_SQL_Connection'access, value => SQL_Client_Unable_To_Establish_SQL_Connection),
    (code => str_SQL_Server_Rejected_Establishment_Of_SQL_Connection'access, value => SQL_Server_Rejected_Establishment_Of_SQL_Connection),
    (code => str_Transaction_Resolution_Unknown'access, value => Transaction_Resolution_Unknown),
    (code => str_Protocol_Violation'access, value => Protocol_Violation),
    (code => str_Triggered_Action_Exception'access, value => Triggered_Action_Exception),
    (code => str_Feature_Not_Supported'access, value => Feature_Not_Supported),
    (code => str_Invalid_Transaction_Initiation'access, value => Invalid_Transaction_Initiation),
    (code => str_Locator_Exception'access, value => Locator_Exception),
    (code => str_Invalid_Locator_Specification'access, value => Invalid_Locator_Specification),
    (code => str_Invalid_Grantor'access, value => Invalid_Grantor),
    (code => str_Invalid_Grant_Operation'access, value => Invalid_Grant_Operation),
    (code => str_Invalid_Role_Specification'access, value => Invalid_Role_Specification),
    (code => str_Cardinality_Violation'access, value => Cardinality_Violation),
    (code => str_Data_Exception'access, value => Data_Exception),
    (code => str_Array_Subscript_Error'access, value => Array_Subscript_Error),
    (code => str_Character_Not_In_Repertoire'access, value => Character_Not_In_Repertoire),
    (code => str_Datetime_Field_Overflow'access, value => Datetime_Field_Overflow),
    (code => str_Division_By_Zero'access, value => Division_By_Zero),
    (code => str_Error_In_Assignment'access, value => Error_In_Assignment),
    (code => str_Escape_Character_Conflict'access, value => Escape_Character_Conflict),
    (code => str_Indicator_Overflow'access, value => Indicator_Overflow),
    (code => str_Interval_Field_Overflow'access, value => Interval_Field_Overflow),
    (code => str_Invalid_Argument_For_Logarithm'access, value => Invalid_Argument_For_Logarithm),
    (code => str_Invalid_Argument_For_Power_Function'access, value => Invalid_Argument_For_Power_Function),
    (code => str_Invalid_Argument_For_Width_Bucket_Function'access, value => Invalid_Argument_For_Width_Bucket_Function),
    (code => str_Invalid_Character_Value_For_Cast'access, value => Invalid_Character_Value_For_Cast),
    (code => str_Invalid_Datetime_Format'access, value => Invalid_Datetime_Format),
    (code => str_Invalid_Escape_Character'access, value => Invalid_Escape_Character),
    (code => str_Invalid_Escape_Octet'access, value => Invalid_Escape_Octet),
    (code => str_Invalid_Escape_Sequence'access, value => Invalid_Escape_Sequence),
    (code => str_Nonstandard_Use_Of_Escape_Character'access, value => Nonstandard_Use_Of_Escape_Character),
    (code => str_Invalid_Indicator_Parameter_Value'access, value => Invalid_Indicator_Parameter_Value),
    (code => str_Invalid_Limit_Value'access, value => Invalid_Limit_Value),
    (code => str_Invalid_Parameter_Value'access, value => Invalid_Parameter_Value),
    (code => str_Invalid_Regular_Expression'access, value => Invalid_Regular_Expression),
    (code => str_Invalid_Time_Zone_Displacement_Value'access, value => Invalid_Time_Zone_Displacement_Value),
    (code => str_Invalid_Use_Of_Escape_Character'access, value => Invalid_Use_Of_Escape_Character),
    (code => str_Most_Specific_Type_Mismatch'access, value => Most_Specific_Type_Mismatch),
    (code => str_Null_Value_Not_Allowed'access, value => Null_Value_Not_Allowed),
    (code => str_Null_Value_No_Indicator_Parameter'access, value => Null_Value_No_Indicator_Parameter),
    (code => str_Numeric_Value_Out_Of_Range'access, value => Numeric_Value_Out_Of_Range),
    (code => str_String_Data_Length_Mismatch'access, value => String_Data_Length_Mismatch),
    (code => str_String_Data_Right_Truncation'access, value => String_Data_Right_Truncation),
    (code => str_Substring_Error'access, value => Substring_Error),
    (code => str_Trim_Error'access, value => Trim_Error),
    (code => str_Unterminated_C_String'access, value => Unterminated_C_String),
    (code => str_Zero_Length_Character_String'access, value => Zero_Length_Character_String),
    (code => str_Floating_Point_Exception'access, value => Floating_Point_Exception),
    (code => str_Invalid_Text_Representation'access, value => Invalid_Text_Representation),
    (code => str_Invalid_Binary_Representation'access, value => Invalid_Binary_Representation),
    (code => str_Bad_Copy_File_Format'access, value => Bad_Copy_File_Format),
    (code => str_Untranslatable_Character'access, value => Untranslatable_Character),
    (code => str_Not_An_XML_Document'access, value => Not_An_XML_Document),
    (code => str_Invalid_XML_Document'access, value => Invalid_XML_Document),
    (code => str_Invalid_XML_Content'access, value => Invalid_XML_Content),
    (code => str_Invalid_XML_Comment'access, value => Invalid_XML_Comment),
    (code => str_Invalid_XML_Processing_Instruction'access, value => Invalid_XML_Processing_Instruction),
    (code => str_Integrity_Constraint_Violation'access, value => Integrity_Constraint_Violation),
    (code => str_Restrict_Violation'access, value => Restrict_Violation),
    (code => str_Not_Null_Violation'access, value => Not_Null_Violation),
    (code => str_Foreign_Key_Violation'access, value => Foreign_Key_Violation),
    (code => str_Unique_Violation'access, value => Unique_Violation),
    (code => str_Check_Violation'access, value => Check_Violation),
    (code => str_Invalid_Cursor_State'access, value => Invalid_Cursor_State),
    (code => str_Invalid_Transaction_State'access, value => Invalid_Transaction_State),
    (code => str_Active_SQL_Transaction'access, value => Active_SQL_Transaction),
    (code => str_Branch_Transaction_Already_Active'access, value => Branch_Transaction_Already_Active),
    (code => str_Held_Cursor_Requires_Same_Isolation_Level'access, value => Held_Cursor_Requires_Same_Isolation_Level),
    (code => str_Inappropriate_Access_Mode_For_Branch_Transaction'access, value => Inappropriate_Access_Mode_For_Branch_Transaction),
    (code => str_Inappropriate_Isolation_Level_For_Branch_Transaction'access, value => Inappropriate_Isolation_Level_For_Branch_Transaction),
    (code => str_No_Active_SQL_Transaction_For_Branch_Transaction'access, value => No_Active_SQL_Transaction_For_Branch_Transaction),
    (code => str_Read_Only_SQL_Transaction'access, value => Read_Only_SQL_Transaction),
    (code => str_Schema_And_Data_Statement_Mixing_Not_Supported'access, value => Schema_And_Data_Statement_Mixing_Not_Supported),
    (code => str_No_Active_SQL_Transaction'access, value => No_Active_SQL_Transaction),
    (code => str_In_Failed_SQL_Transaction'access, value => In_Failed_SQL_Transaction),
    (code => str_Invalid_SQL_Statement_Name'access, value => Invalid_SQL_Statement_Name),
    (code => str_Triggered_Data_Change_Violation'access, value => Triggered_Data_Change_Violation),
    (code => str_Invalid_Authorization_Specification'access, value => Invalid_Authorization_Specification),
    (code => str_Dependent_Privilege_Descriptors_Still_Exist'access, value => Dependent_Privilege_Descriptors_Still_Exist),
    (code => str_Dependent_Objects_Still_Exist'access, value => Dependent_Objects_Still_Exist),
    (code => str_Invalid_Transaction_Termination'access, value => Invalid_Transaction_Termination),
    (code => str_SRE_SQL_Routine_Exception'access, value => SRE_SQL_Routine_Exception),
    (code => str_SRE_Function_Executed_No_Return_Statement'access, value => SRE_Function_Executed_No_Return_Statement),
    (code => str_SRE_Modifying_SQL_Data_Not_Permitted'access, value => SRE_Modifying_SQL_Data_Not_Permitted),
    (code => str_SRE_Prohibited_SQL_Statement_Attempted'access, value => SRE_Prohibited_SQL_Statement_Attempted),
    (code => str_SRE_Reading_SQL_Data_Not_Permitted'access, value => SRE_Reading_SQL_Data_Not_Permitted),
    (code => str_Invalid_Cursor_Name'access, value => Invalid_Cursor_Name),
    (code => str_ERE_External_Routine_Exception'access, value => ERE_External_Routine_Exception),
    (code => str_ERE_Containing_SQL_Not_Permitted'access, value => ERE_Containing_SQL_Not_Permitted),
    (code => str_ERE_Modifying_SQL_Data_Not_Permitted'access, value => ERE_Modifying_SQL_Data_Not_Permitted),
    (code => str_ERE_Prohibited_SQL_Statement_Attempted'access, value => ERE_Prohibited_SQL_Statement_Attempted),
    (code => str_ERE_Reading_SQL_Data_Not_Permitted'access, value => ERE_Reading_SQL_Data_Not_Permitted),
    (code => str_ERI_External_Routine_Invocation_Exception'access, value => ERI_External_Routine_Invocation_Exception),
    (code => str_ERI_Invalid_SQLstate_Returned'access, value => ERI_Invalid_SQLstate_Returned),
    (code => str_ERI_Null_Value_Not_Allowed'access, value => ERI_Null_Value_Not_Allowed),
    (code => str_ERI_Trigger_Protocol_Violated'access, value => ERI_Trigger_Protocol_Violated),
    (code => str_ERI_SRF_Protocol_Violated'access, value => ERI_SRF_Protocol_Violated),
    (code => str_Savepoint_Exception'access, value => Savepoint_Exception),
    (code => str_Invalid_Savepoint_Specification'access, value => Invalid_Savepoint_Specification),
    (code => str_Invalid_Catalog_Name'access, value => Invalid_Catalog_Name),
    (code => str_Invalid_Schema_Name'access, value => Invalid_Schema_Name),
    (code => str_Transaction_Rollback'access, value => Transaction_Rollback),
    (code => str_Transaction_Integrity_Constraint_Violation'access, value => Transaction_Integrity_Constraint_Violation),
    (code => str_Serialization_Failure'access, value => Serialization_Failure),
    (code => str_Statement_Completion_Unknown'access, value => Statement_Completion_Unknown),
    (code => str_Deadlock_Detected'access, value => Deadlock_Detected),
    (code => str_Syntax_Error_Or_Access_Rule_Violation'access, value => Syntax_Error_Or_Access_Rule_Violation),
    (code => str_Syntax_Error'access, value => Syntax_Error),
    (code => str_Insufficient_Privilege'access, value => Insufficient_Privilege),
    (code => str_Cannot_Coerce'access, value => Cannot_Coerce),
    (code => str_Grouping_Error'access, value => Grouping_Error),
    (code => str_Invalid_Foreign_Key'access, value => Invalid_Foreign_Key),
    (code => str_Invalid_Name'access, value => Invalid_Name),
    (code => str_Name_Too_Long'access, value => Name_Too_Long),
    (code => str_Reserved_Name'access, value => Reserved_Name),
    (code => str_Datatype_Mismatch'access, value => Datatype_Mismatch),
    (code => str_Indeterminate_Datatype'access, value => Indeterminate_Datatype),
    (code => str_Wrong_Object_Type'access, value => Wrong_Object_Type),
    (code => str_Undefined_Column'access, value => Undefined_Column),
    (code => str_Undefined_Function'access, value => Undefined_Function),
    (code => str_Undefined_Table'access, value => Undefined_Table),
    (code => str_Undefined_Parameter'access, value => Undefined_Parameter),
    (code => str_Undefined_Object'access, value => Undefined_Object),
    (code => str_Duplicate_Column'access, value => Duplicate_Column),
    (code => str_Duplicate_Cursor'access, value => Duplicate_Cursor),
    (code => str_Duplicate_Database'access, value => Duplicate_Database),
    (code => str_Duplicate_Function'access, value => Duplicate_Function),
    (code => str_Duplicate_Prepared_Statement'access, value => Duplicate_Prepared_Statement),
    (code => str_Duplicate_Schema'access, value => Duplicate_Schema),
    (code => str_Duplicate_Table'access, value => Duplicate_Table),
    (code => str_Duplicate_Alias'access, value => Duplicate_Alias),
    (code => str_Duplicate_Object'access, value => Duplicate_Object),
    (code => str_Ambiguous_Column'access, value => Ambiguous_Column),
    (code => str_Ambiguous_Function'access, value => Ambiguous_Function),
    (code => str_Ambiguous_Parameter'access, value => Ambiguous_Parameter),
    (code => str_Ambiguous_Alias'access, value => Ambiguous_Alias),
    (code => str_Invalid_Column_Reference'access, value => Invalid_Column_Reference),
    (code => str_Invalid_Column_Definition'access, value => Invalid_Column_Definition),
    (code => str_Invalid_Cursor_Definition'access, value => Invalid_Cursor_Definition),
    (code => str_Invalid_Database_Definition'access, value => Invalid_Database_Definition),
    (code => str_Invalid_Function_Definition'access, value => Invalid_Function_Definition),
    (code => str_Invalid_Prepared_Statement_Definition'access, value => Invalid_Prepared_Statement_Definition),
    (code => str_Invalid_Schema_Definition'access, value => Invalid_Schema_Definition),
    (code => str_Invalid_Table_Definition'access, value => Invalid_Table_Definition),
    (code => str_Invalid_Object_Definition'access, value => Invalid_Object_Definition),
    (code => str_With_Check_Option_Violation'access, value => With_Check_Option_Violation),
    (code => str_Insufficient_Resources'access, value => Insufficient_Resources),
    (code => str_Disk_Full'access, value => Disk_Full),
    (code => str_Out_Of_Memory'access, value => Out_Of_Memory),
    (code => str_Too_Many_Connections'access, value => Too_Many_Connections),
    (code => str_Program_Limit_Exceeded'access, value => Program_Limit_Exceeded),
    (code => str_Statement_Too_Complex'access, value => Statement_Too_Complex),
    (code => str_Too_Many_Columns'access, value => Too_Many_Columns),
    (code => str_Too_Many_Arguments'access, value => Too_Many_Arguments),
    (code => str_Object_Not_In_Prerequisite_State'access, value => Object_Not_In_Prerequisite_State),
    (code => str_Object_In_Use'access, value => Object_In_Use),
    (code => str_Cant_Change_Runtime_Param'access, value => Cant_Change_Runtime_Param),
    (code => str_Lock_Not_Available'access, value => Lock_Not_Available),
    (code => str_Operator_Intervention'access, value => Operator_Intervention),
    (code => str_Query_Canceled'access, value => Query_Canceled),
    (code => str_Admin_Shutdown'access, value => Admin_Shutdown),
    (code => str_Crash_Shutdown'access, value => Crash_Shutdown),
    (code => str_Cannot_Connect_Now'access, value => Cannot_Connect_Now),
    (code => str_IO_Error'access, value => IO_Error),
    (code => str_Undefined_File'access, value => Undefined_File),
    (code => str_Duplicate_File'access, value => Duplicate_File),
    (code => str_Config_File_Error'access, value => Config_File_Error),
    (code => str_Lock_File_Exists'access, value => Lock_File_Exists),
    (code => str_Plpgsql_Error'access, value => Plpgsql_Error),
    (code => str_Raise_Exception'access, value => Raise_Exception),
    (code => str_No_Data_Found'access, value => No_Data_Found),
    (code => str_Too_Many_Rows'access, value => Too_Many_Rows),
    (code => str_Internal_Error'access, value => Internal_Error),
    (code => str_Data_Corrupted'access, value => Data_Corrupted),
    (code => str_Index_Corrupted'access, value => Index_Corrupted),
    (code => str_Unknown_Error'access, value => Unknown_Error)
  );

  function Error_Value (code : string)
    return Error_Value_t is
  begin
    for index in error_codes'range loop
      if error_codes (index).code.all = code then
        return error_codes (index).value;
      end if;
    end loop;
    return Unknown_Error;
  end Error_Value;

end PGAda.Errors;
