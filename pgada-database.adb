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
with Interfaces.C.Strings;       use Interfaces.C, Interfaces.C.Strings;

package body PGAda.Database is

   use PGAda.Thin;

   Exec_Status_Match :
     constant array (Thin.Exec_Status_Type) of Exec_Status_Type :=
       (PGRES_EMPTY_QUERY    => Empty_Query,
        PGRES_COMMAND_OK     => Command_OK,
        PGRES_TUPLES_OK      => Tuples_OK,
        PGRES_COPY_OUT       => Copy_Out,
        PGRES_COPY_IN        => Copy_In,
        PGRES_BAD_RESPONSE   => Bad_Response,
        PGRES_NONFATAL_ERROR => Non_Fatal_Error,
        PGRES_FATAL_ERROR    => Fatal_Error);

   -----------------------
   -- Local subprograms --
   -----------------------

   function C_String_Or_Null (S : String) return chars_ptr;
   procedure Free (S : in out chars_ptr);
   --  Create a C string or return Null_Ptr if the string is empty, and
   --  free it if needed.

   ------------
   -- Adjust --
   ------------

   procedure Adjust (Result : in out Result_Type) is
   begin
      Result.Ref_Count.all := Result.Ref_Count.all + 1;
   end Adjust;

   ----------------------
   -- C_String_Or_Null --
   ----------------------

   function C_String_Or_Null (S : String) return chars_ptr is
   begin
      if S = "" then
         return Null_Ptr;
      else
         return New_String (S);
      end if;
   end C_String_Or_Null;

   -----------
   -- Clear --
   -----------

   procedure Clear (Result : in out Result_Type) is
   begin
      PQ_Clear (Result.Actual);
      Result.Actual := null;
   end Clear;

   --------------------
   -- Command_Status --
   --------------------

   function Command_Status (Result : Result_Type) return String is
   begin
      return Value (PQ_Cmd_Status (Result.Actual));
   end Command_Status;

   --------
   -- DB --
   --------

   function DB (Connection : Connection_Type) return String is
   begin
      return Value (PQ_Db (Connection.Actual));
   end DB;

   -------------------
   -- Error_Message --
   -------------------

   function Error_Message (Connection : Connection_Type) return String is
   begin
      return Value (PQ_Error_Message (Connection.Actual));
   end Error_Message;

   ----------
   -- Exec --
   ----------

   procedure Exec (Connection : in Connection_Type'Class;
                   Query      : in String;
                   Result     : out Result_Type)
   is
      C_Query : chars_ptr := New_String (Query);
   begin
      Result.Actual := PQ_Exec (Connection.Actual, C_Query);
      Interfaces.C.Strings.Free (C_Query);
   end Exec;

   ----------
   -- Exec --
   ----------

   function Exec (Connection : Connection_Type'Class; Query : String)
     return Result_Type
   is
      Result : Result_Type;
   begin
      Exec (Connection, Query, Result);
      return Result;
   end Exec;

   ----------
   -- Exec --
   ----------

   procedure Exec (Connection : in Connection_Type'Class;
                   Query      : in String)
   is
      Result : Result_Type;
   begin
      Exec (Connection, Query, Result);
   end Exec;

   ----------------
   -- Field_Name --
   ----------------

   function Field_Name (Result      : Result_Type;
                        Field_Index : Positive)
     return String is
   begin
      return Value (PQ_F_Name (Result.Actual, int (Field_Index) - 1));
   end Field_Name;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Connection : in out Connection_Type) is
   begin
      if Connection.Actual /= null then
         Finish (Connection);
      end if;
   end Finalize;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Result : in out Result_Type) is
      procedure Free is
         new Ada.Unchecked_Deallocation (Natural, Natural_Access);
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

   procedure Finish (Connection : in out Connection_Type) is
   begin
      PQ_Finish (Connection.Actual);
      Connection.Actual := null;
   end Finish;

   ----------
   -- Free --
   ----------

   procedure Free (S : in out chars_ptr) is
   begin
      if S /= Null_Ptr then
         Interfaces.C.Strings.Free (S);
      end if;
   end Free;

   ----------------
   -- Get_Length --
   ----------------

   function Get_Length (Result      : Result_Type;
                        Tuple_Index : Positive;
                        Field_Index : Positive)
     return Natural
   is
   begin
      return Natural (PQ_Get_Length (Result.Actual,
                                     int (Tuple_Index) - 1,
                                     int (Field_Index) - 1));
   end Get_Length;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value (Result      : Result_Type;
                       Tuple_Index : Positive;
                       Field_Index : Positive)
     return String
   is
   begin
      return Value (PQ_Get_Value (Result.Actual,
                                 int (Tuple_Index) - 1,
                                 int (Field_Index) - 1));
   end Get_Value;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value (Result      : Result_Type;
                       Tuple_Index : Positive;
                       Field_Name  : String)
     return String
   is
      C_Name : chars_ptr       := New_String (Field_Name);
      Ret    : constant String :=
        Get_Value (Result, Tuple_Index,
                   1 + Natural (PQ_F_Number (Result.Actual, C_Name)));
   begin
      Free (C_Name);
      return Ret;
   end Get_Value;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value (Result      : Result_Type;
                       Tuple_Index : Positive;
                       Field_Index : Positive)
     return Integer
   is
   begin
      return Integer'Value (Get_Value (Result, Tuple_Index, Field_Index));
   end Get_Value;

   ---------------
   -- Get_Value --
   ---------------

   function Get_Value (Result      : Result_Type;
                       Tuple_Index : Positive;
                       Field_Name  : String)
     return Integer
   is
   begin
      return Integer'Value (Get_Value (Result, Tuple_Index, Field_Name));
   end Get_Value;

   ----------
   -- Host --
   ----------

   function Host (Connection : Connection_Type) return String is
   begin
      return Value (PQ_Host (Connection.Actual));
   end Host;

   -------------
   -- Is_Null --
   -------------

   function Is_Null (Result      : Result_Type;
                     Tuple_Index : Positive;
                     Field_Index : Positive)
     return Boolean
   is
   begin
      return 1 = PQ_Get_Is_Null
        (Result.Actual, int (Tuple_Index) - 1, int (Field_Index) - 1);
   end Is_Null;

   ----------------
   -- Nbr_Fields --
   ----------------

   function Nbr_Fields (Result : Result_Type) return Natural is
   begin
      return Natural (PQ_N_Fields (Result.Actual));
   end Nbr_Fields;

   ----------------
   -- Nbr_Tuples --
   ----------------

   function Nbr_Tuples (Result : Result_Type) return Natural is
   begin
      return Natural (PQ_N_Tuples (Result.Actual));
   end Nbr_Tuples;

   ----------------
   -- OID_Status --
   ----------------

   function OID_Status (Result : Result_Type) return String is
   begin
      return Value (PQ_Oid_Status (Result.Actual));
   end OID_Status;

   -------------
   -- Options --
   -------------

   function Options (Connection : Connection_Type) return String is
   begin
      return Value (PQ_Options (Connection.Actual));
   end Options;

   ----------
   -- Port --
   ----------

   function Port (Connection : Connection_Type) return Positive is
   begin
      return Positive'Value (Value (PQ_Port (Connection.Actual)));
   end Port;

   -----------
   -- Reset --
   -----------

   procedure Reset (Connection : in Connection_Type) is
   begin
      PQ_Reset (Connection.Actual);
   end Reset;

   -------------------
   -- Result_Status --
   -------------------

   function Result_Status (Result : Result_Type) return Exec_Status_Type is
   begin
      return Exec_Status_Match (PQ_Result_Status (Result.Actual));
   end Result_Status;

   ------------------
   -- Set_DB_Login --
   ------------------

   procedure Set_DB_Login (Connection : in out Connection_Type;
                           Host       : in String  := "";
                           Port       : in Natural := 0;
                           Options    : in String  := "";
                           TTY        : in String  := "";
                           DB_Name    : in String  := "";
                           Login      : in String  := "";
                           Password   : in String  := "")
   is
      C_Host     : chars_ptr := C_String_Or_Null (Host);
      C_Port     : chars_ptr;
      C_Options  : chars_ptr := C_String_Or_Null (Options);
      C_TTY      : chars_ptr := C_String_Or_Null (TTY);
      C_DB_Name  : chars_ptr := C_String_Or_Null (DB_Name);
      C_Login    : chars_ptr := C_String_Or_Null (Login);
      C_Password : chars_ptr := C_String_Or_Null (Password);
   begin
      if Port = 0 then
         C_Port := Null_Ptr;
      else
         C_Port := New_String (Positive'Image (Port));
      end if;
      Connection.Actual :=
        PQ_Set_Db_Login (C_Host, C_Port, C_Options, C_TTY, C_DB_Name,
                         C_Login, C_Password);
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

   function Status (Connection : Connection_Type)
     return Connection_Status_Type
   is
   begin
      case PQ_Status (Connection.Actual) is
         when CONNECTION_OK =>
            return Connection_OK;
         when CONNECTION_BAD =>
            return Connection_Bad;
         when others =>
            raise Constraint_Error;
      end case;
   end Status;

   ---------
   -- TTY --
   ---------

   function TTY (Connection : Connection_Type) return String is
   begin
      return Value (PQ_TTY (Connection.Actual));
   end TTY;

end PGAda.Database;
