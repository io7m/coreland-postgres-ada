------------------------------------------------------------------------------
--                                                                          --
--                       P G A D A . D A T A B A S E                        --
--                                                                          --
--                                 B o d y                                  --
--                                                                          --
--  Copyright (c) Samuel Tardieu 2000                                       --
--  All rights reserved.                                                    --
--                                                                          --
--  Redistribution and use in source and binary forms, with or without      --
--  modification, are permitted provided that the following conditions      --
--  are met:                                                                --
--  1. Redistributions of source code must retain the above copyright       --
--     notice, this list of conditions and the following disclaimer.        --
--  2. Redistributions in binary form must reproduce the above copyright    --
--     notice, this list of conditions and the following disclaimer in      --
--     the documentation and/or other materials provided with the           --
--     distribution.                                                        --
--  3. Neither the name of Samuel Tardieu nor the names of its contributors --
--     may be used to endorse or promote products derived from this         --
--     software without specific prior written permission.                  --
--                                                                          --
--  THIS SOFTWARE IS PROVIDED BY SAMUEL TARDIEU AND CONTRIBUTORS ``AS       --
--  IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT          --
--  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS       --
--  FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL SAMUEL      --
--  TARDIEU OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,             --
--  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES                --
--  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR      --
--  SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)      --
--  HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN               --
--  CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR            --
--  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,          --
--  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.                      --
--                                                                          --
------------------------------------------------------------------------------

with Ada.Unchecked_Deallocation;
with Interfaces.C.Strings;
with Interfaces.C;

package body PGAda.Database is
  package ICS renames Interfaces.C.Strings;
  package IC renames Interfaces.C;

  use type ICS.chars_ptr;
  use type IC.int;

  use type PGAda.Thin.PG_Conn_Access_t;
  use type PGAda.Thin.PG_Result_Access_t;

  Exec_Status_Match :
   constant array (Thin.Exec_Status_t) of Exec_Status_t :=
    (PGAda.Thin.PGRES_EMPTY_QUERY   => Empty_Query,
     PGAda.Thin.PGRES_COMMAND_OK    => Command_OK,
     PGAda.Thin.PGRES_TUPLES_OK    => Tuples_OK,
     PGAda.Thin.PGRES_COPY_OUT     => Copy_Out,
     PGAda.Thin.PGRES_COPY_IN      => Copy_In,
     PGAda.Thin.PGRES_BAD_RESPONSE  => Bad_Response,
     PGAda.Thin.PGRES_NONFATAL_ERROR => Non_Fatal_Error,
     PGAda.Thin.PGRES_FATAL_ERROR   => Fatal_Error);

  -----------------------
  -- Local subprograms --
  -----------------------

  function C_String_Or_Null (S : String) return ICS.chars_ptr;
  procedure Free (S : in out ICS.chars_ptr);
  --  Create a C string or return Null_Ptr if the string is empty, and
  --  free it if needed.

  ------------
  -- Adjust --
  ------------

  procedure Adjust (Result : in out Result_t) is
  begin
    Result.Ref_Count.all := Result.Ref_Count.all + 1;
  end Adjust;

  ----------------------
  -- C_String_Or_Null --
  ----------------------

  function C_String_Or_Null (S : String) return ICS.chars_ptr is
  begin
    if S = "" then
      return ICS.Null_Ptr;
    else
      return ICS.New_String (S);
    end if;
  end C_String_Or_Null;

  -----------
  -- Clear --
  -----------

  procedure Clear (Result : in out Result_t) is
  begin
    PGAda.Thin.PQ_Clear (Result.Actual);
    Result.Actual := null;
  end Clear;

  --------------------
  -- Command_Status --
  --------------------

  function Command_Status (Result : Result_t) return String is
  begin
    return ICS.Value (PGAda.Thin.PQ_Cmd_Status (Result.Actual));
  end Command_Status;

  --------------------
  -- Command_Tuples --
  --------------------

  function Command_Tuples (Result : Result_t) return String is
  begin
    return ICS.Value (PGAda.Thin.PQ_Cmd_Tuples (Result.Actual));
  end Command_Tuples;

  --------
  -- DB --
  --------

  function DB (Connection : Connection_t) return String is
  begin
    return ICS.Value (PGAda.Thin.PQ_Db (Connection.Actual));
  end DB;

  -------------------
  -- Error_Message --
  -------------------

  function Error_Message (Connection : Connection_t) return String is
  begin
    return ICS.Value (PGAda.Thin.PQ_Error_Message (Connection.Actual));
  end Error_Message;

  -------------------
  -- Error_Message --
  -------------------

  function Error_Message (Result : Result_t) return String is
  begin
    return Result_Error_Field
      (Result => Result,
       Field  => PGAda.Thin.PG_DIAG_MESSAGE_PRIMARY);
  end Error_Message;

  ----------
  -- Exec --
  ----------

  procedure Exec
   (Connection : in Connection_t'Class;
    Query    : in String;
    Result    : out Result_t;
    Status    : out Exec_Status_t)
  is
    C_Query : ICS.chars_ptr := ICS.New_String (Query);
  begin
    Result.Actual := PGAda.Thin.PQ_Exec (Connection.Actual, C_Query);
    ICS.Free (C_Query);
    Status := Result_Status (Result);
  end Exec;

  ----------
  -- Exec --
  ----------

  procedure Exec
   (Connection : in Connection_t'Class;
    Query    : in String;
    Result    : out Result_t)
  is
    C_Query : ICS.chars_ptr := ICS.New_String (Query);
  begin
    Result.Actual := PGAda.Thin.PQ_Exec (Connection.Actual, C_Query);
    ICS.Free (C_Query);
  end Exec;

  ----------
  -- Exec --
  ----------

  function Exec
   (Connection : Connection_t'Class;
    Query    : String) return Result_t
  is
    Result : Result_t;
  begin
    Exec (Connection, Query, Result);
    return Result;
  end Exec;

  ----------
  -- Exec --
  ----------

  procedure Exec
   (Connection : in Connection_t'Class;
    Query      : in String)
  is
    Result : Result_t;
  begin
    -- Result value ignored by call
    pragma Warnings (off);
    Exec (Connection, Query, Result);
    pragma Warnings (on);
  end Exec;

  ----------------
  -- Field_Name --
  ----------------

  function Field_Name
   (Result      : Result_t;
    Field_Index : Positive) return String is
  begin
    return ICS.Value (PGAda.Thin.PQ_F_Name (Result.Actual, IC.int (Field_Index) - 1));
  end Field_Name;

  --------------
  -- Finalize --
  --------------

  procedure Finalize (Connection : in out Connection_t) is
  begin
    if Connection.Actual /= null then
      Finish (Connection);
    end if;
  end Finalize;

  --------------
  -- Finalize --
  --------------

  procedure Finalize (Result : in out Result_t) is
    procedure Free is
      new Ada.Unchecked_Deallocation (Natural, Natural_Access_t);
  begin
    Result.Ref_Count.all := Result.Ref_Count.all - 1;
    if Result.Ref_Count.all = 0 and then Result.Actual /= null then
      Free (Result.Ref_Count);
      Clear (Result);
    end if;
  end Finalize;

  ------------
  -- Finish --
  ------------

  procedure Finish (Connection : in out Connection_t) is
  begin
    PGAda.Thin.PQ_Finish (Connection.Actual);
    Connection.Actual := null;
  end Finish;

  ----------
  -- Free --
  ----------

  procedure Free (S : in out ICS.chars_ptr) is
  begin
    if S /= ICS.Null_Ptr then
      ICS.Free (S);
    end if;
  end Free;

  ----------------
  -- Get_Length --
  ----------------

  function Get_Length
   (Result    : Result_t;
    Tuple_Index : Positive;
    Field_Index : Positive) return Natural is
  begin
    return Natural (PGAda.Thin.PQ_Get_Length
    (Result.Actual, IC.int (Tuple_Index) - 1, IC.int (Field_Index) - 1));
  end Get_Length;

  ---------------
  -- Get_Value --
  ---------------

  function Get_Value
   (Result    : Result_t;
    Tuple_Index : Positive;
    Field_Index : Positive) return String is
  begin
    return ICS.Value (PGAda.Thin.PQ_Get_Value
    (Result.Actual, IC.int (Tuple_Index) - 1, IC.int (Field_Index) - 1));
  end Get_Value;

  ---------------
  -- Get_Value --
  ---------------

  function Get_Value
   (Result    : Result_t;
    Tuple_Index : Positive;
    Field_Name  : String) return String
  is
    C_Name : ICS.chars_ptr     := ICS.New_String (Field_Name);
    Ret   : constant String :=
     Get_Value (Result, Tuple_Index,
      1 + Natural (PGAda.Thin.PQ_F_Number (Result.Actual, C_Name)));
  begin
    Free (C_Name);
    return Ret;
  end Get_Value;

  ---------------
  -- Get_Value --
  ---------------

  function Get_Value
   (Result    : Result_t;
    Tuple_Index : Positive;
    Field_Index : Positive) return Integer is
  begin
    return Integer'Value (Get_Value (Result, Tuple_Index, Field_Index));
  end Get_Value;

  ---------------
  -- Get_Value --
  ---------------

  function Get_Value
   (Result    : Result_t;
    Tuple_Index : Positive;
    Field_Name  : String) return Integer is
  begin
    return Integer'Value (Get_Value (Result, Tuple_Index, Field_Name));
  end Get_Value;

  ---------------
  -- Get_Value --
  ---------------

  function Get_Value
   (Result    : Result_t;
    Tuple_Index : Positive;
    Field_Index : Positive) return Long_Integer is
  begin
    return Long_Integer'Value (Get_Value (Result, Tuple_Index, Field_Index));
  end Get_Value;

  ---------------
  -- Get_Value --
  ---------------

  function Get_Value
   (Result    : Result_t;
    Tuple_Index : Positive;
    Field_Name  : String) return Long_Integer is
  begin
    return Long_Integer'Value (Get_Value (Result, Tuple_Index, Field_Name));
  end Get_Value;

  ---------------
  -- Get_Value --
  ---------------

  function Get_Value
   (Result    : Result_t;
    Tuple_Index : Positive;
    Field_Index : Positive) return Long_Long_Integer is
  begin
    return Long_Long_Integer'Value
     (Get_Value (Result, Tuple_Index, Field_Index));
  end Get_Value;

  ---------------
  -- Get_Value --
  ---------------

  function Get_Value
   (Result    : Result_t;
    Tuple_Index : Positive;
    Field_Name  : String) return Long_Long_Integer is
  begin
    return Long_Long_Integer'Value
     (Get_Value (Result, Tuple_Index, Field_Name));
  end Get_Value;

  ----------
  -- Host --
  ----------

  function Host (Connection : Connection_t) return String is
  begin
    return ICS.Value (PGAda.Thin.PQ_Host (Connection.Actual));
  end Host;

  -------------
  -- Is_Null --
  -------------

  function Is_Null
   (Result    : Result_t;
    Tuple_Index : Positive;
    Field_Index : Positive) return Boolean is
  begin
    return 1 = PGAda.Thin.PQ_Get_Is_Null
     (Result.Actual, IC.int (Tuple_Index) - 1, IC.int (Field_Index) - 1);
  end Is_Null;

  ----------------
  -- Nbr_Fields --
  ----------------

  function Nbr_Fields (Result : Result_t) return Natural is
  begin
    return Natural (PGAda.Thin.PQ_N_Fields (Result.Actual));
  end Nbr_Fields;

  ----------------
  -- Nbr_Tuples --
  ----------------

  function Nbr_Tuples (Result : Result_t) return Natural is
  begin
    return Natural (PGAda.Thin.PQ_N_Tuples (Result.Actual));
  end Nbr_Tuples;

  ----------------
  -- OID_Status --
  ----------------

  function OID_Status (Result : Result_t) return String is
  begin
    return ICS.Value (PGAda.Thin.PQ_Oid_Status (Result.Actual));
  end OID_Status;

  -------------
  -- Options --
  -------------

  function Options (Connection : Connection_t) return String is
  begin
    return ICS.Value (PGAda.Thin.PQ_Options (Connection.Actual));
  end Options;

  ----------
  -- Port --
  ----------

  function Port (Connection : Connection_t) return Positive is
  begin
    return Positive'Value (ICS.Value (PGAda.Thin.PQ_Port (Connection.Actual)));
  end Port;

  -----------
  -- Reset --
  -----------

  procedure Reset (Connection : in Connection_t) is
  begin
    PGAda.Thin.PQ_Reset (Connection.Actual);
  end Reset;

  -------------------
  -- Result_Status --
  -------------------

  function Result_Status (Result : Result_t) return Exec_Status_t is
  begin
    return Exec_Status_Match (PGAda.Thin.PQ_Result_Status (Result.Actual));
  end Result_Status;

  ------------------------
  -- Result_Error_Field --
  ------------------------

  function Result_Error_Field
  (Result : Result_t;
   Field  : Error_Field) return String
  is
    C_Res : constant ICS.chars_ptr :=
      PGAda.Thin.PQ_Result_Error_Field (Result.Actual, Field);
  begin
    if C_Res = ICS.Null_Ptr then
      return "";
    else
      return ICS.Value (C_Res);
    end if;
  end Result_Error_Field;

  ----------------
  -- Error_Code --
  ----------------

  function Error_Code (Result : Result_t)
    return PGAda.Errors.Error_Value_t is
  begin
    return PGAda.Errors.Error_Value
      (Result_Error_Field (Result, PGAda.Thin.PG_DIAG_SQLSTATE));
  end Error_Code;

  ------------------
  -- Set_DB_Login --
  ------------------

  procedure Set_DB_Login
   (Connection : in out Connection_t;
    Host       : in String  := "";
    Port       : in Natural := 0;
    Options    : in String  := "";
    TTY        : in String  := "";
    DB_Name    : in String  := "";
    Login      : in String  := "";
    Password   : in String  := "")
  is
    C_Host     : ICS.chars_ptr := C_String_Or_Null (Host);
    C_Port     : ICS.chars_ptr;
    C_Options  : ICS.chars_ptr := C_String_Or_Null (Options);
    C_TTY      : ICS.chars_ptr := C_String_Or_Null (TTY);
    C_DB_Name  : ICS.chars_ptr := C_String_Or_Null (DB_Name);
    C_Login    : ICS.chars_ptr := C_String_Or_Null (Login);
    C_Password : ICS.chars_ptr := C_String_Or_Null (Password);
  begin
    if Port = 0 then
      C_Port := ICS.Null_Ptr;
    else
      C_Port := ICS.New_String (Positive'Image (Port));
    end if;
    Connection.Actual :=
     PGAda.Thin.PQ_Set_Db_Login
      (C_Host,
      C_Port,
      C_Options,
      C_TTY,
      C_DB_Name,
      C_Login,
      C_Password);

    Free (C_Host);
    Free (C_Port);
    Free (C_Options);
    Free (C_TTY);
    Free (C_DB_Name);
    Free (C_Login);
    Free (C_Password);
    if Connection.Actual = null then
      raise PG_Error;
    end if;
  end Set_DB_Login;

  ------------
  -- Status --
  ------------

  function Status (Connection : Connection_t) return Connection_Status_t is
  begin
    case PGAda.Thin.PQ_Status (Connection.Actual) is
      when PGAda.Thin.CONNECTION_OK  => return Connection_OK;
      when PGAda.Thin.CONNECTION_BAD => return Connection_Bad;
    end case;
  end Status;

end PGAda.Database;
