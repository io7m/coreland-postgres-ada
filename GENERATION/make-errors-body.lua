#!/usr/bin/env lua

local str = require ("str")

local longest = 0
local lines   = {}

for line in io.lines ("error_codes.dat") do
  local t    = str.split (line, " ")
  local code = t[1];
  local name = t[2];
  local pair = {}

  pair.name = name
  pair.code = code

  table.insert (lines, pair)
end

io.write ([[
-- auto generated - do not edit

package body PGAda.Errors is

  type Error_t is record
    code  : access constant string;
    value : Error_Value_t;
  end record;

]])

for key, pair in pairs (lines) do
  io.write ("  str_"..pair.name.." : aliased constant string := \""..pair.code.."\";\n")
end

io.write ([[

  error_codes : constant array (natural range <>) of Error_t := (
]])

for index, pair in pairs (lines) do
  io.write ("    (code => str_"..pair.name.."'access, value => "
    ..pair.name..")")

  if index == table.maxn (lines) then
    io.write ("\n")
  else
    io.write (",\n")
  end
end

io.write ([[
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
]])
