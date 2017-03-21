function _init()
  p = init_entity(76, 64, 3, 16, 6)
  bad = init_entity(30, 30, 1, 48, 5)
end

function _draw()
  cls()
  map(0,0,0,0,16,16)
  spr(p.walk.f, p.x, p.y, 1, 1, (p.facing == 0))
  spr(bad.walk.f, bad.x, bad.y, 1, 1, (bad.facing == 0))
  --for b in all(blocks_to_check_h) do spr(1, b.x, b.y, 1, 1) end
  --for b in all(blocks_to_check_v) do spr(1, b.x, b.y, 1, 1) end
  print_debug()
end

function _update()
  update_gravity(p)
  update_gravity(bad)
  update_from_controls(p)
  follow_player(bad, p)
end
