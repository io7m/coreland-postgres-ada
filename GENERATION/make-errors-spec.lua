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

package PGAda.Errors is
  pragma Preelaborate;

  type Error_Value_t is (
]])

for index, value in pairs (lines) do
  io.write ("    "..value.name)
  if index == table.maxn (lines) then
    io.write ("\n")
  else
    io.write (",\n")
  end
end

io.write ([[
  );

  function Error_Value (code : string) return Error_Value_t;

end PGAda.Errors;
]])
