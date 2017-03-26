function _init()
  counter = 0
  entities = {}

  p = init_entity(76, 64, 3, 16, 6)

  add(entities, init_entity(7*8, 3*8, 0, 74, 2,'torch'))
  add(entities, init_entity(11*8, 9*8, 0, 74, 2,'torch'))
  add(entities, init_entity(3*8, 9*8, 0, 74, 2,'torch'))
end

function _draw()
  cls()
  map(0,0,0,0,16,16)

  for e in all(entities) do
    if (e.entity_type == 'torch') then
      spr(e.base_anim.f, e.x, e.y, 2, 2)
    elseif e.entity_type == 'bad' then
      spr(e.base_anim.f, e.x, e.y, 1, 1, (e.facing == 0))
    end
  end
  spr(p.base_anim.f, p.x, p.y, 1, 1, (p.facing == 0))

  -- for b in all(blocks_to_check_h) do spr(1, b.x, b.y, 1, 1) end
  -- for b in all(blocks_to_check_v) do spr(1, b.x, b.y, 1, 1) end
  print_debug()
end

function _update()
  counter += 1

  load_entities(loaded_map(p), entities)

  update_gravity(p)
  update_from_controls(p)
  
  for e in all(entities) do
    if e.entity_type == 'bad' then
      update_gravity(e)
      walk_endless(e)
    elseif e.entity_type == 'torch' then
      update_anim_torch(e)
    end
  end
  --follow_player(bad, p)
  
end
