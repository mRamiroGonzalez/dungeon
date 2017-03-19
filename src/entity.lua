function init_player()
  p = {
    x = 76, y = 64,
    dx = 0, dy = 0,
    w = 8, h = 8,
    mvt_h = 0,
    mvt_v = 0,
    facing = 1,
    v_speed = 4,
    h_speed = 1,
    jumping = false,
    jump_initial_speed = -7,
    gravity = 1,
    walk={f=37,st=37,sz=39, fix=40},
    --walk={f=16,st=16,sz=21, fix=16},
  }
end

function update_gravity(p)
  if (p.dy < p.v_speed) then
    p.dy += p.gravity
  else
    p.dy = p.v_speed
  end
  if p.dy < 0 then
    p.mvt_v = -1
  else
    p.mvt_v = 1
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