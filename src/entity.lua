function init_entity(start_x, start_y, speed, start_sprite, length_sprites)
  return {
    x = start_x, y = start_y,
    dx = 0, dy = 0,
    w = 8, h = 8,
    mvt_h = 0,
    mvt_v = 0,
    facing = 1,
    v_speed = 4,
    h_speed = speed,
    jumping = false,
    jump_initial_speed = -7,
    gravity = 1,
    walk={f=start_sprite, st=start_sprite, sz=start_sprite+length_sprites, fix=start_sprite}
  }
end

function init_torch(x, y, start_sprite, length_sprites)
  return{
    x = x*8,
    y = y*8,
    burns={f=start_sprite, st=start_sprite, sz=start_sprite+length_sprites}
  }
end

function update_anim_torches(torches)
  for t in all(torches) do
    if (counter % 30 == 0) then 
      anim(t.burns, 2)
    end
  end
end

function update_gravity(e)
  if (e.dy < e.v_speed) then
    e.dy += e.gravity
  else
    e.dy = e.v_speed
  end
  if e.dy < 0 then
    e.mvt_v = -1
  else
    e.mvt_v = 1
  end
end

function update_from_controls(p)
 horizontal_controls(p)
 vertical_controls(p)
end

function is_on_a_solid_block(e)
 return get_block_below(e, 0)
end
function is_below_a_solid_block(e)
 return get_block_on_top(e, 0)
end
function is_in_front_of_a_block(e)
return get_block_in_front(e, 0)
end