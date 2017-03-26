function _init()
  counter = 0

  p = init_entity(76, 64, 3, 16, 6)
  bad = init_entity(30, 30, 1, 48, 4)
  bad2 = init_entity(30, 64, 1, 32, 4)

  torches = {}
  add(torches, init_torch(7, 3, 74, 2, 4))
  add(torches, init_torch(11, 9, 74, 2, 4))
  add(torches, init_torch(3, 9, 74, 2, 4))
end

function _draw()
  cls()
  map(0,0,0,0,16,16)
  for t in all(torches) do
    spr(t.burns.f, t.x, t.y, 2, 2)
  end
  spr(p.walk.f, p.x, p.y, 1, 1, (p.facing == 0))
  spr(bad.walk.f, bad.x, bad.y, 1, 1, (bad.facing == 0))
  spr(bad2.walk.f, bad2.x, bad2.y, 1, 1, (bad2.facing == 0))
  -- for b in all(blocks_to_check_h) do spr(1, b.x, b.y, 1, 1) end
  -- for b in all(blocks_to_check_v) do spr(1, b.x, b.y, 1, 1) end
  print_debug()
end

function _update()
  counter += 1

  update_anim_torches(torches)

  update_gravity(p)
  update_gravity(bad)
  update_gravity(bad2)
  
  update_from_controls(p)
  follow_player(bad, p)
  walk_endless(bad2)
end
