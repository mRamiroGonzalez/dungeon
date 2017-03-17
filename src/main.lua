function _init()
init_player()
end

function _draw()
  cls()
  map(0,0,0,0,16,16)
  spr(p.walk.f, p.x, p.y, 1, 1, (p.facing == 0))
  --for b in all(blocks_to_check_h) do spr(1, b.x, b.y, 1, 1) end
  --for b in all(blocks_to_check_v) do spr(1, b.x, b.y, 1, 1) end
  print_debug()
end

function _update()
  update_gravity(p)
  update_from_controls(p)
end
