-- auto generated - do not edit

package PGAda.Errors is
  pragma Preelaborate;

  type Error_Value_t is (
    Successful_Completion,
    Warning,
    Warn_Dynamic_Result_Sets_Returned,
    Warn_Implicit_Zero_Bit_Padding,
    Warn_Null_Value_Eliminated_In_Set_Function,
    Warn_Privilege_Not_Granted,
    Warn_Privilege_Not_Revoked,
    Warn_String_Data_Right_Truncation,
    Deprecated_Feature,
    No_Data,
    No_Additional_Dynamic_Result_Sets_Returned,
    SQL_Statement_Not_Yet_Complete,
    Connection_Exception,
    Connection_Does_Not_Exist,
    Connection_Failure,
    SQL_Client_Unable_To_Establish_SQL_Connection,
    SQL_Server_Rejected_Establishment_Of_SQL_Connection,
    Transaction_Resolution_Unknown,
    Protocol_Violation,
    Triggered_Action_Exception,
    Feature_Not_Supported,
    Invalid_Transaction_Initiation,
    Locator_Exception,
    Invalid_Locator_Specification,
    Invalid_Grantor,
    Invalid_Grant_Operation,
    Invalid_Role_Specification,
    Cardinality_Violation,
    Data_Exception,
    Array_Subscript_Error,
    Character_Not_In_Repertoire,
    Datetime_Field_Overflow,
    Division_By_Zero,
    Error_In_Assignment,
    Escape_Character_Conflict,
    Indicator_Overflow,
    Interval_Field_Overflow,
    Invalid_Argument_For_Logarithm,
    Invalid_Argument_For_Power_Function,
    Invalid_Argument_For_Width_Bucket_Function,
    Invalid_Character_Value_For_Cast,
    Invalid_Datetime_Format,
    Invalid_Escape_Character,
    Invalid_Escape_Octet,
    Invalid_Escape_Sequence,
    Nonstandard_Use_Of_Escape_Character,
    Invalid_Indicator_Parameter_Value,
    Invalid_Limit_Value,
    Invalid_Parameter_Value,
    Invalid_Regular_Expression,
    Invalid_Time_Zone_Displacement_Value,
    Invalid_Use_Of_Escape_Character,
    Most_Specific_Type_Mismatch,
    Null_Value_Not_Allowed,
    Null_Value_No_Indicator_Parameter,
    Numeric_Value_Out_Of_Range,
    String_Data_Length_Mismatch,
    String_Data_Right_Truncation,
    Substring_Error,
    Trim_Error,
    Unterminated_C_String,
    Zero_Length_Character_String,
    Floating_Point_Exception,
    Invalid_Text_Representation,
    Invalid_Binary_Representation,
    Bad_Copy_File_Format,
    Untranslatable_Character,
    Not_An_XML_Document,
    Invalid_XML_Document,
    Invalid_XML_Content,
    Invalid_XML_Comment,
    Invalid_XML_Processing_Instruction,
    Integrity_Constraint_Violation,
    Restrict_Violation,
    Not_Null_Violation,
    Foreign_Key_Violation,
    Unique_Violation,
    Check_Violation,
    Invalid_Cursor_State,
    Invalid_Transaction_State,
    Active_SQL_Transaction,
    Branch_Transaction_Already_Active,
    Held_Cursor_Requires_Same_Isolation_Level,
    Inappropriate_Access_Mode_For_Branch_Transaction,
    Inappropriate_Isolation_Level_For_Branch_Transaction,
    No_Active_SQL_Transaction_For_Branch_Transaction,
    Read_Only_SQL_Transaction,
    Schema_And_Data_Statement_Mixing_Not_Supported,
    No_Active_SQL_Transaction,
    In_Failed_SQL_Transaction,
    Invalid_SQL_Statement_Name,
    Triggered_Data_Change_Violation,
    Invalid_Authorization_Specification,
    Dependent_Privilege_Descriptors_Still_Exist,
    Dependent_Objects_Still_Exist,
    Invalid_Transaction_Termination,
    SRE_SQL_Routine_Exception,
    SRE_Function_Executed_No_Return_Statement,
    SRE_Modifying_SQL_Data_Not_Permitted,
    SRE_Prohibited_SQL_Statement_Attempted,
    SRE_Reading_SQL_Data_Not_Permitted,
    Invalid_Cursor_Name,
    ERE_External_Routine_Exception,
    ERE_Containing_SQL_Not_Permitted,
    ERE_Modifying_SQL_Data_Not_Permitted,
    ERE_Prohibited_SQL_Statement_Attempted,
    ERE_Reading_SQL_Data_Not_Permitted,
    ERI_External_Routine_Invocation_Exception,
    ERI_Invalid_SQLstate_Returned,
    ERI_Null_Value_Not_Allowed,
    ERI_Trigger_Protocol_Violated,
    ERI_SRF_Protocol_Violated,
    Savepoint_Exception,
    Invalid_Savepoint_Specification,
    Invalid_Catalog_Name,
    Invalid_Schema_Name,
    Transaction_Rollback,
    Transaction_Integrity_Constraint_Violation,
    Serialization_Failure,
    Statement_Completion_Unknown,
    Deadlock_Detected,
    Syntax_Error_Or_Access_Rule_Violation,
    Syntax_Error,
    Insufficient_Privilege,
    Cannot_Coerce,
    Grouping_Error,
    Invalid_Foreign_Key,
    Invalid_Name,
    Name_Too_Long,
    Reserved_Name,
    Datatype_Mismatch,
    Indeterminate_Datatype,
    Wrong_Object_Type,
    Undefined_Column,
    Undefined_Function,
    Undefined_Table,
    Undefined_Parameter,
    Undefined_Object,
    Duplicate_Column,
    Duplicate_Cursor,
    Duplicate_Database,
    Duplicate_Function,
    Duplicate_Prepared_Statement,
    Duplicate_Schema,
    Duplicate_Table,
    Duplicate_Alias,
    Duplicate_Object,
    Ambiguous_Column,
    Ambiguous_Function,
    Ambiguous_Parameter,
    Ambiguous_Alias,
    Invalid_Column_Reference,
    Invalid_Column_Definition,
    Invalid_Cursor_Definition,
    Invalid_Database_Definition,
    Invalid_Function_Definition,
    Invalid_Prepared_Statement_Definition,
    Invalid_Schema_Definition,
    Invalid_Table_Definition,
    Invalid_Object_Definition,
    With_Check_Option_Violation,
    Insufficient_Resources,
    Disk_Full,
    Out_Of_Memory,
    Too_Many_Connections,
    Program_Limit_Exceeded,
    Statement_Too_Complex,
    Too_Many_Columns,
    Too_Many_Arguments,
    Object_Not_In_Prerequisite_State,
    Object_In_Use,
    Cant_Change_Runtime_Param,
    Lock_Not_Available,
    Operator_Intervention,
    Query_Canceled,
    Admin_Shutdown,
    Crash_Shutdown,
    Cannot_Connect_Now,
    IO_Error,
    Undefined_File,
    Duplicate_File,
    Config_File_Error,
    Lock_File_Exists,
    Plpgsql_Error,
    Raise_Exception,
    No_Data_Found,
    Too_Many_Rows,
    Internal_Error,
    Data_Corrupted,
    Index_Corrupted,
    Unknown_Error
  );

  function Error_Value (code : String) return Error_Value_t;

end PGAda.Errors;
