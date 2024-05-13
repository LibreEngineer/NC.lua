-- create a readonly table
local function rotbl(tbl)
  return setmetatable(tbl,{
    __index=function(self, k)
      return self[k]
    end,
    __newindex=function(self, k, v)
    end
  })
end

-- The module table
-- tables used as enums, are to be set before the implementation below
local M={
  err={},
  fmt={},
  program={},
  subprogram={},
  wcs={
    [0]='G53',
    'G54',
    'G55',
    'G56',
    'G57',
    'G58',
    'G59',
  },
  var={},
  tool={},
  unit={},
}


--{{{ Error Handling:
M.err={-- if err flags are set false, will use M.warn instead
  -- read-only violation
  ro_violation=function()
    error("attempt to update a read-only table", 2)
  end,
}
--}}}

--{{{ Formatting:
M.fmt=setmetatable({
},{--metatable:
  __call=function()
  end
})
--}}}

--{{{ FileIO:
-- All write cmds get passed through here.
-- Returns the string that it writes
function M:write(str)
  return str
end
function M:writeln(str)
  return M:write(str.."\n")
end
function M:writeblk(str)
  return M:write(str..";\n")
end
function M:comment(str)
  str="("..str:gsub("\n", ")\n(")..")"
  str=str:gsub("()", "")
  return M:write(str)
end
-- range = {start, end}
function M:overwrite(range, str)
  return M:write(str)
end
-- range = {start, end}
function M:delete(range)
  return M:overwrite(range, "")
end
--}}}

--{{{ Programs & Subprograms:
M.program={
  fp=nil,--file pointer
  id=nil,--numeric program id
  post="",-- the post processor to use
  title="",-- should include traceable information, like the programmer's name & date of creation
}
function M.program:new(file, id, title)
end
function M.program:close()
end
function M.program:run()
end
------------------------------------------
function M.subprogram:new(file, id, title)
end
function M.subprogram:close()
end
function M.subprogram:run()
end
--}}}

--{{{ Commands:
setmetatable(M.wcs,{--metatable:
  __call=function()
  end
})
setmetatable(M.var,{--metatable:
  __call=function()
  end,
})
setmetatable(M.tool,{--metatable:
  __call=function()
  end
})
function M:coolant()
end
function M:spin()
end
function M:feed()
end
function M:rapid()
end
function M:linear()
end
function M:arc()
end
--}}}


return setmetatable(M,{
  __index=function(self, k)
    return self[k]
  end,
  __newindex=function(self, k, v)
    self.err.ro_violation()
    -- else, returns nil
  end
})
