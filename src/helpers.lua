
function print_debug()
  -- print(bad2.facing, 5,5,0)
end

function sp_to_rect(e)
  local r = {}
    r.x1 = e.x
    r.y1 = e.y
    r.x2 = e.x + e.w - 1
    r.y2 = e.y + e.h - 1
  return r
end

function copy_table(from)
  local copy = {}
  for k,v in pairs(from) do copy[k] = v end
  return copy
end
