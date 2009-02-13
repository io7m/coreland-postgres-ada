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
    (code => str_Successful_Completion'Access, value => Successful_Completion),
    (code => str_Warning'Access, value => Warning),
    (code => str_Warn_Dynamic_Result_Sets_Returned'Access, value => Warn_Dynamic_Result_Sets_Returned),
    (code => str_Warn_Implicit_Zero_Bit_Padding'Access, value => Warn_Implicit_Zero_Bit_Padding),
    (code => str_Warn_Null_Value_Eliminated_In_Set_Function'Access, value => Warn_Null_Value_Eliminated_In_Set_Function),
    (code => str_Warn_Privilege_Not_Granted'Access, value => Warn_Privilege_Not_Granted),
    (code => str_Warn_Privilege_Not_Revoked'Access, value => Warn_Privilege_Not_Revoked),
    (code => str_Warn_String_Data_Right_Truncation'Access, value => Warn_String_Data_Right_Truncation),
    (code => str_Deprecated_Feature'Access, value => Deprecated_Feature),
    (code => str_No_Data'Access, value => No_Data),
    (code => str_No_Additional_Dynamic_Result_Sets_Returned'Access, value => No_Additional_Dynamic_Result_Sets_Returned),
    (code => str_SQL_Statement_Not_Yet_Complete'Access, value => SQL_Statement_Not_Yet_Complete),
    (code => str_Connection_Exception'Access, value => Connection_Exception),
    (code => str_Connection_Does_Not_Exist'Access, value => Connection_Does_Not_Exist),
    (code => str_Connection_Failure'Access, value => Connection_Failure),
    (code => str_SQL_Client_Unable_To_Establish_SQL_Connection'Access, value => SQL_Client_Unable_To_Establish_SQL_Connection),
    (code => str_SQL_Server_Rejected_Establishment_Of_SQL_Connection'Access, value => SQL_Server_Rejected_Establishment_Of_SQL_Connection),
    (code => str_Transaction_Resolution_Unknown'Access, value => Transaction_Resolution_Unknown),
    (code => str_Protocol_Violation'Access, value => Protocol_Violation),
    (code => str_Triggered_Action_Exception'Access, value => Triggered_Action_Exception),
    (code => str_Feature_Not_Supported'Access, value => Feature_Not_Supported),
    (code => str_Invalid_Transaction_Initiation'Access, value => Invalid_Transaction_Initiation),
    (code => str_Locator_Exception'Access, value => Locator_Exception),
    (code => str_Invalid_Locator_Specification'Access, value => Invalid_Locator_Specification),
    (code => str_Invalid_Grantor'Access, value => Invalid_Grantor),
    (code => str_Invalid_Grant_Operation'Access, value => Invalid_Grant_Operation),
    (code => str_Invalid_Role_Specification'Access, value => Invalid_Role_Specification),
    (code => str_Cardinality_Violation'Access, value => Cardinality_Violation),
    (code => str_Data_Exception'Access, value => Data_Exception),
    (code => str_Array_Subscript_Error'Access, value => Array_Subscript_Error),
    (code => str_Character_Not_In_Repertoire'Access, value => Character_Not_In_Repertoire),
    (code => str_Datetime_Field_Overflow'Access, value => Datetime_Field_Overflow),
    (code => str_Division_By_Zero'Access, value => Division_By_Zero),
    (code => str_Error_In_Assignment'Access, value => Error_In_Assignment),
    (code => str_Escape_Character_Conflict'Access, value => Escape_Character_Conflict),
    (code => str_Indicator_Overflow'Access, value => Indicator_Overflow),
    (code => str_Interval_Field_Overflow'Access, value => Interval_Field_Overflow),
    (code => str_Invalid_Argument_For_Logarithm'Access, value => Invalid_Argument_For_Logarithm),
    (code => str_Invalid_Argument_For_Power_Function'Access, value => Invalid_Argument_For_Power_Function),
    (code => str_Invalid_Argument_For_Width_Bucket_Function'Access, value => Invalid_Argument_For_Width_Bucket_Function),
    (code => str_Invalid_Character_Value_For_Cast'Access, value => Invalid_Character_Value_For_Cast),
    (code => str_Invalid_Datetime_Format'Access, value => Invalid_Datetime_Format),
    (code => str_Invalid_Escape_Character'Access, value => Invalid_Escape_Character),
    (code => str_Invalid_Escape_Octet'Access, value => Invalid_Escape_Octet),
    (code => str_Invalid_Escape_Sequence'Access, value => Invalid_Escape_Sequence),
    (code => str_Nonstandard_Use_Of_Escape_Character'Access, value => Nonstandard_Use_Of_Escape_Character),
    (code => str_Invalid_Indicator_Parameter_Value'Access, value => Invalid_Indicator_Parameter_Value),
    (code => str_Invalid_Limit_Value'Access, value => Invalid_Limit_Value),
    (code => str_Invalid_Parameter_Value'Access, value => Invalid_Parameter_Value),
    (code => str_Invalid_Regular_Expression'Access, value => Invalid_Regular_Expression),
    (code => str_Invalid_Time_Zone_Displacement_Value'Access, value => Invalid_Time_Zone_Displacement_Value),
    (code => str_Invalid_Use_Of_Escape_Character'Access, value => Invalid_Use_Of_Escape_Character),
    (code => str_Most_Specific_Type_Mismatch'Access, value => Most_Specific_Type_Mismatch),
    (code => str_Null_Value_Not_Allowed'Access, value => Null_Value_Not_Allowed),
    (code => str_Null_Value_No_Indicator_Parameter'Access, value => Null_Value_No_Indicator_Parameter),
    (code => str_Numeric_Value_Out_Of_Range'Access, value => Numeric_Value_Out_Of_Range),
    (code => str_String_Data_Length_Mismatch'Access, value => String_Data_Length_Mismatch),
    (code => str_String_Data_Right_Truncation'Access, value => String_Data_Right_Truncation),
    (code => str_Substring_Error'Access, value => Substring_Error),
    (code => str_Trim_Error'Access, value => Trim_Error),
    (code => str_Unterminated_C_String'Access, value => Unterminated_C_String),
    (code => str_Zero_Length_Character_String'Access, value => Zero_Length_Character_String),
    (code => str_Floating_Point_Exception'Access, value => Floating_Point_Exception),
    (code => str_Invalid_Text_Representation'Access, value => Invalid_Text_Representation),
    (code => str_Invalid_Binary_Representation'Access, value => Invalid_Binary_Representation),
    (code => str_Bad_Copy_File_Format'Access, value => Bad_Copy_File_Format),
    (code => str_Untranslatable_Character'Access, value => Untranslatable_Character),
    (code => str_Not_An_XML_Document'Access, value => Not_An_XML_Document),
    (code => str_Invalid_XML_Document'Access, value => Invalid_XML_Document),
    (code => str_Invalid_XML_Content'Access, value => Invalid_XML_Content),
    (code => str_Invalid_XML_Comment'Access, value => Invalid_XML_Comment),
    (code => str_Invalid_XML_Processing_Instruction'Access, value => Invalid_XML_Processing_Instruction),
    (code => str_Integrity_Constraint_Violation'Access, value => Integrity_Constraint_Violation),
    (code => str_Restrict_Violation'Access, value => Restrict_Violation),
    (code => str_Not_Null_Violation'Access, value => Not_Null_Violation),
    (code => str_Foreign_Key_Violation'Access, value => Foreign_Key_Violation),
    (code => str_Unique_Violation'Access, value => Unique_Violation),
    (code => str_Check_Violation'Access, value => Check_Violation),
    (code => str_Invalid_Cursor_State'Access, value => Invalid_Cursor_State),
    (code => str_Invalid_Transaction_State'Access, value => Invalid_Transaction_State),
    (code => str_Active_SQL_Transaction'Access, value => Active_SQL_Transaction),
    (code => str_Branch_Transaction_Already_Active'Access, value => Branch_Transaction_Already_Active),
    (code => str_Held_Cursor_Requires_Same_Isolation_Level'Access, value => Held_Cursor_Requires_Same_Isolation_Level),
    (code => str_Inappropriate_Access_Mode_For_Branch_Transaction'Access, value => Inappropriate_Access_Mode_For_Branch_Transaction),
    (code => str_Inappropriate_Isolation_Level_For_Branch_Transaction'Access, value => Inappropriate_Isolation_Level_For_Branch_Transaction),
    (code => str_No_Active_SQL_Transaction_For_Branch_Transaction'Access, value => No_Active_SQL_Transaction_For_Branch_Transaction),
    (code => str_Read_Only_SQL_Transaction'Access, value => Read_Only_SQL_Transaction),
    (code => str_Schema_And_Data_Statement_Mixing_Not_Supported'Access, value => Schema_And_Data_Statement_Mixing_Not_Supported),
    (code => str_No_Active_SQL_Transaction'Access, value => No_Active_SQL_Transaction),
    (code => str_In_Failed_SQL_Transaction'Access, value => In_Failed_SQL_Transaction),
    (code => str_Invalid_SQL_Statement_Name'Access, value => Invalid_SQL_Statement_Name),
    (code => str_Triggered_Data_Change_Violation'Access, value => Triggered_Data_Change_Violation),
    (code => str_Invalid_Authorization_Specification'Access, value => Invalid_Authorization_Specification),
    (code => str_Dependent_Privilege_Descriptors_Still_Exist'Access, value => Dependent_Privilege_Descriptors_Still_Exist),
    (code => str_Dependent_Objects_Still_Exist'Access, value => Dependent_Objects_Still_Exist),
    (code => str_Invalid_Transaction_Termination'Access, value => Invalid_Transaction_Termination),
    (code => str_SRE_SQL_Routine_Exception'Access, value => SRE_SQL_Routine_Exception),
    (code => str_SRE_Function_Executed_No_Return_Statement'Access, value => SRE_Function_Executed_No_Return_Statement),
    (code => str_SRE_Modifying_SQL_Data_Not_Permitted'Access, value => SRE_Modifying_SQL_Data_Not_Permitted),
    (code => str_SRE_Prohibited_SQL_Statement_Attempted'Access, value => SRE_Prohibited_SQL_Statement_Attempted),
    (code => str_SRE_Reading_SQL_Data_Not_Permitted'Access, value => SRE_Reading_SQL_Data_Not_Permitted),
    (code => str_Invalid_Cursor_Name'Access, value => Invalid_Cursor_Name),
    (code => str_ERE_External_Routine_Exception'Access, value => ERE_External_Routine_Exception),
    (code => str_ERE_Containing_SQL_Not_Permitted'Access, value => ERE_Containing_SQL_Not_Permitted),
    (code => str_ERE_Modifying_SQL_Data_Not_Permitted'Access, value => ERE_Modifying_SQL_Data_Not_Permitted),
    (code => str_ERE_Prohibited_SQL_Statement_Attempted'Access, value => ERE_Prohibited_SQL_Statement_Attempted),
    (code => str_ERE_Reading_SQL_Data_Not_Permitted'Access, value => ERE_Reading_SQL_Data_Not_Permitted),
    (code => str_ERI_External_Routine_Invocation_Exception'Access, value => ERI_External_Routine_Invocation_Exception),
    (code => str_ERI_Invalid_SQLstate_Returned'Access, value => ERI_Invalid_SQLstate_Returned),
    (code => str_ERI_Null_Value_Not_Allowed'Access, value => ERI_Null_Value_Not_Allowed),
    (code => str_ERI_Trigger_Protocol_Violated'Access, value => ERI_Trigger_Protocol_Violated),
    (code => str_ERI_SRF_Protocol_Violated'Access, value => ERI_SRF_Protocol_Violated),
    (code => str_Savepoint_Exception'Access, value => Savepoint_Exception),
    (code => str_Invalid_Savepoint_Specification'Access, value => Invalid_Savepoint_Specification),
    (code => str_Invalid_Catalog_Name'Access, value => Invalid_Catalog_Name),
    (code => str_Invalid_Schema_Name'Access, value => Invalid_Schema_Name),
    (code => str_Transaction_Rollback'Access, value => Transaction_Rollback),
    (code => str_Transaction_Integrity_Constraint_Violation'Access, value => Transaction_Integrity_Constraint_Violation),
    (code => str_Serialization_Failure'Access, value => Serialization_Failure),
    (code => str_Statement_Completion_Unknown'Access, value => Statement_Completion_Unknown),
    (code => str_Deadlock_Detected'Access, value => Deadlock_Detected),
    (code => str_Syntax_Error_Or_Access_Rule_Violation'Access, value => Syntax_Error_Or_Access_Rule_Violation),
    (code => str_Syntax_Error'Access, value => Syntax_Error),
    (code => str_Insufficient_Privilege'Access, value => Insufficient_Privilege),
    (code => str_Cannot_Coerce'Access, value => Cannot_Coerce),
    (code => str_Grouping_Error'Access, value => Grouping_Error),
    (code => str_Invalid_Foreign_Key'Access, value => Invalid_Foreign_Key),
    (code => str_Invalid_Name'Access, value => Invalid_Name),
    (code => str_Name_Too_Long'Access, value => Name_Too_Long),
    (code => str_Reserved_Name'Access, value => Reserved_Name),
    (code => str_Datatype_Mismatch'Access, value => Datatype_Mismatch),
    (code => str_Indeterminate_Datatype'Access, value => Indeterminate_Datatype),
    (code => str_Wrong_Object_Type'Access, value => Wrong_Object_Type),
    (code => str_Undefined_Column'Access, value => Undefined_Column),
    (code => str_Undefined_Function'Access, value => Undefined_Function),
    (code => str_Undefined_Table'Access, value => Undefined_Table),
    (code => str_Undefined_Parameter'Access, value => Undefined_Parameter),
    (code => str_Undefined_Object'Access, value => Undefined_Object),
    (code => str_Duplicate_Column'Access, value => Duplicate_Column),
    (code => str_Duplicate_Cursor'Access, value => Duplicate_Cursor),
    (code => str_Duplicate_Database'Access, value => Duplicate_Database),
    (code => str_Duplicate_Function'Access, value => Duplicate_Function),
    (code => str_Duplicate_Prepared_Statement'Access, value => Duplicate_Prepared_Statement),
    (code => str_Duplicate_Schema'Access, value => Duplicate_Schema),
    (code => str_Duplicate_Table'Access, value => Duplicate_Table),
    (code => str_Duplicate_Alias'Access, value => Duplicate_Alias),
    (code => str_Duplicate_Object'Access, value => Duplicate_Object),
    (code => str_Ambiguous_Column'Access, value => Ambiguous_Column),
    (code => str_Ambiguous_Function'Access, value => Ambiguous_Function),
    (code => str_Ambiguous_Parameter'Access, value => Ambiguous_Parameter),
    (code => str_Ambiguous_Alias'Access, value => Ambiguous_Alias),
    (code => str_Invalid_Column_Reference'Access, value => Invalid_Column_Reference),
    (code => str_Invalid_Column_Definition'Access, value => Invalid_Column_Definition),
    (code => str_Invalid_Cursor_Definition'Access, value => Invalid_Cursor_Definition),
    (code => str_Invalid_Database_Definition'Access, value => Invalid_Database_Definition),
    (code => str_Invalid_Function_Definition'Access, value => Invalid_Function_Definition),
    (code => str_Invalid_Prepared_Statement_Definition'Access, value => Invalid_Prepared_Statement_Definition),
    (code => str_Invalid_Schema_Definition'Access, value => Invalid_Schema_Definition),
    (code => str_Invalid_Table_Definition'Access, value => Invalid_Table_Definition),
    (code => str_Invalid_Object_Definition'Access, value => Invalid_Object_Definition),
    (code => str_With_Check_Option_Violation'Access, value => With_Check_Option_Violation),
    (code => str_Insufficient_Resources'Access, value => Insufficient_Resources),
    (code => str_Disk_Full'Access, value => Disk_Full),
    (code => str_Out_Of_Memory'Access, value => Out_Of_Memory),
    (code => str_Too_Many_Connections'Access, value => Too_Many_Connections),
    (code => str_Program_Limit_Exceeded'Access, value => Program_Limit_Exceeded),
    (code => str_Statement_Too_Complex'Access, value => Statement_Too_Complex),
    (code => str_Too_Many_Columns'Access, value => Too_Many_Columns),
    (code => str_Too_Many_Arguments'Access, value => Too_Many_Arguments),
    (code => str_Object_Not_In_Prerequisite_State'Access, value => Object_Not_In_Prerequisite_State),
    (code => str_Object_In_Use'Access, value => Object_In_Use),
    (code => str_Cant_Change_Runtime_Param'Access, value => Cant_Change_Runtime_Param),
    (code => str_Lock_Not_Available'Access, value => Lock_Not_Available),
    (code => str_Operator_Intervention'Access, value => Operator_Intervention),
    (code => str_Query_Canceled'Access, value => Query_Canceled),
    (code => str_Admin_Shutdown'Access, value => Admin_Shutdown),
    (code => str_Crash_Shutdown'Access, value => Crash_Shutdown),
    (code => str_Cannot_Connect_Now'Access, value => Cannot_Connect_Now),
    (code => str_IO_Error'Access, value => IO_Error),
    (code => str_Undefined_File'Access, value => Undefined_File),
    (code => str_Duplicate_File'Access, value => Duplicate_File),
    (code => str_Config_File_Error'Access, value => Config_File_Error),
    (code => str_Lock_File_Exists'Access, value => Lock_File_Exists),
    (code => str_Plpgsql_Error'Access, value => Plpgsql_Error),
    (code => str_Raise_Exception'Access, value => Raise_Exception),
    (code => str_No_Data_Found'Access, value => No_Data_Found),
    (code => str_Too_Many_Rows'Access, value => Too_Many_Rows),
    (code => str_Internal_Error'Access, value => Internal_Error),
    (code => str_Data_Corrupted'Access, value => Data_Corrupted),
    (code => str_Index_Corrupted'Access, value => Index_Corrupted),
    (code => str_Unknown_Error'Access, value => Unknown_Error)
  );

  function Error_Value (code : string)
    return Error_Value_t is
  begin
    for index in error_codes'Range loop
      if error_codes (index).code.all = code then
        return error_codes (index).value;
      end if;
    end loop;
    return Unknown_Error;
  end Error_Value;

end PGAda.Errors;
