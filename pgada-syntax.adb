------------------------------------------------------------------------------
--                                                                          --
--                         P G A D A . S Y N T A X                          --
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

package body PGAda.Syntax is

   ------------
   -- Escape --
   ------------

   function Escape (S : String) return String
   is
      Result : String (1 .. S'Length * 2);
      Last   : Natural := 0;
   begin
      for I in S'Range loop
         if S (I) = ''' then
            Last := Last + 1;
            Result (Last) := '\';
         end if;
         Last := Last + 1;
         Result (Last) := S (I);
      end loop;
      return ''' & Result (1 .. Last) & ''';
   end Escape;

   -----------
   -- Image --
   -----------

   function Image (I : Integer) return String is
      S : constant String := Integer'Image (I);
   begin
      if S (1) = ' ' then
         return S (1 .. S'Last);
      else
         return S;
      end if;
   end Image;

end PGAda.Syntax;
