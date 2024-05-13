#!/usr/bin/env lua
local NC = require('NC')
local p = NC.new_program('test.nc', 5457, "Purcell, NC.lua test program")
local function tbldmp(tbl)
  return require'serpent'.block(tbl, {maxlevel=4, comment=false, nocode=true})
end


p:close()
