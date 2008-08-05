------------------------------------------------------------------------------
--                                                                          --
--                          P G A D A . U T I L S                           --
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

with PGAda.Syntax; use PGAda.Syntax;

package body PGAda.Utils is

   -----------------------
   -- Begin_Transaction --
   -----------------------

   procedure Begin_Transaction (DB : in Connection_Type'Class) is
   begin
      Exec (DB, "BEGIN");
   end Begin_Transaction;

   ------------
   -- Commit --
   ------------

   procedure Commit (DB : in Connection_Type'Class) is
   begin
      Exec (DB, "COMMIT");
   end Commit;

   --------------
   -- Next_Val --
   --------------

   function Next_Val
     (DB            : Connection_Type'Class;
      Sequence_Name : String)
      return Integer
   is
      Result : Result_Type;
   begin
      Exec (DB, "SELECT NEXTVAL(" & Escape (Sequence_Name) & ")", Result);
      return Integer'Value (Get_Value (Result, 1, 1));
   end Next_Val;

   --------------
   -- Rollback --
   --------------

   procedure Rollback (DB : in Connection_Type'Class) is
   begin
      Exec (DB, "ROLLBACK");
   end Rollback;

end PGAda.Utils;
