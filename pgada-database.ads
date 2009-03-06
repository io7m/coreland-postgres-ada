------------------------------------------------------------------------------
--                                                                          --
--                       P G A D A . D A T A B A S E                        --
--                                                                          --
--                                 S p e c                                  --
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

with Ada.Finalization;
with PGAda.Errors;
with PGAda.Thin;

package PGAda.Database is

  pragma Preelaborate;

  PG_Error : exception;

  type Connection_t is
    new Ada.Finalization.Limited_Controlled with private;

  subtype Error_Field is PGAda.Thin.Error_Field;

  procedure Set_DB_Login
   (Connection : in out Connection_t;
    Host       : in String  := "";
    Port       : in Natural := 0;
    Options    : in String  := "";
    TTY        : in String  := "";
    DB_Name    : in String  := "";
    Login      : in String := "";
    Password   : in String := "");

  --  Connect to a database

  function DB (Connection : Connection_t) return String;
  function Host (Connection : Connection_t) return String;
  function Port (Connection : Connection_t) return Positive;
  function Options (Connection : Connection_t) return String;

  --  Query characteristics of an open connection

  type Connection_Status_t is (Connection_OK, Connection_Bad);

  function Status (Connection : Connection_t)
    return Connection_Status_t;

  function Error_Message (Connection : Connection_t) return String;

  procedure Finish (Connection : in out Connection_t);

  procedure Reset (Connection : in Connection_t);

  type Result_t is
     new Ada.Finalization.Controlled with private;

  type Exec_Status_t is
   (Empty_Query,
    Command_OK,
    Tuples_OK,
    Copy_Out,
    Copy_In,
    Bad_Response,
    Non_Fatal_Error,
    Fatal_Error);

  procedure Exec
   (Connection : in Connection_t'Class;
    Query      : in String;
    Result     : out Result_t;
    Status     : out Exec_Status_t);

  procedure Exec
   (Connection : in Connection_t'Class;
    Query      : in String;
    Result     : out Result_t);

  --  Note: the Connection parameter is of type Connection_t'Class
  --  because this function cannot be a primitive operation of several
  --  tagged types.

  function Error_Message (Result : Result_t) return String;

  function Exec
   (Connection : Connection_t'Class;
    Query      : String) return Result_t;
  --  Function form of the subprogram

  procedure Exec
   (Connection : in Connection_t'Class;
    Query      : in String);
  --  This procedure executes the query but does not test the result. It
  --  can be used for queries that do not require a result and cannot fail.

  function Result_Status (Result : Result_t) return Exec_Status_t;

  function Error_Code (Result : Result_t) return PGAda.Errors.Error_Value_t;

  function Result_Error_Field
    (Result : Result_t;
     Field  : Error_Field) return String;

  function Nbr_Tuples (Result : Result_t) return Natural;
  function Number_Of_Tuples (Result : Result_t)
    return Natural renames Nbr_Tuples;

  function Nbr_Fields (Result : Result_t) return Natural;
  function Number_Of_Fields (Result : Result_t)
    return Natural renames Nbr_Fields;

  function Field_Name
   (Result      : Result_t;
    Field_Index : Positive) return String;

  function Get_Value
   (Result      : Result_t;
    Tuple_Index : Positive;
    Field_Index : Positive) return String;

  function Get_Value
   (Result      : Result_t;
    Tuple_Index : Positive;
    Field_Name  : String) return String;

  function Get_Value
   (Result      : Result_t;
    Tuple_Index : Positive;
    Field_Index : Positive) return Integer;

  function Get_Value
   (Result      : Result_t;
    Tuple_Index : Positive;
    Field_Name  : String) return Integer;

  function Get_Value
   (Result      : Result_t;
    Tuple_Index : Positive;
    Field_Index : Positive) return Long_Integer;

  function Get_Value
   (Result      : Result_t;
    Tuple_Index : Positive;
    Field_Name  : String) return Long_Integer;

  function Get_Value
   (Result      : Result_t;
    Tuple_Index : Positive;
    Field_Index : Positive) return Long_Long_Integer;

  function Get_Value
   (Result      : Result_t;
    Tuple_Index : Positive;
    Field_Name  : String) return Long_Long_Integer;

  function Get_Length
   (Result      : Result_t;
    Tuple_Index : Positive;
    Field_Index : Positive) return Natural;

  function Is_Null
   (Result      : Result_t;
    Tuple_Index : Positive;
    Field_Index : Positive) return Boolean;

  function Command_Status (Result : Result_t) return String;
  function Command_Tuples (Result : Result_t) return String;

  function OID_Status (Result : Result_t) return String;

  procedure Clear (Result : in out Result_t);

private

  type Connection_t is new Ada.Finalization.Limited_Controlled with record
     Actual : Thin.PG_Conn_Access_t;
  end record;
  procedure Finalize (Connection : in out Connection_t);

  type Natural_Access_t is access Natural;

  type Result_t is new Ada.Finalization.Controlled with record
     Actual    : Thin.PG_Result_Access_t;
     Ref_Count : Natural_Access_t := new Integer'(1);
  end record;
  procedure Adjust (Result : in out Result_t);
  procedure Finalize (Result : in out Result_t);

end PGAda.Database;
