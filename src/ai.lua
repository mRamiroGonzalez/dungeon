
function follow_player(e,p)
  move_x(e,p)
  move_y(e,p)
end

function move_x(e, p)
  e.dx = 0

  if (e.x < p.x) then
    e.dx = e.h_speed
    e.mvt_h = 1
    e.facing = 1
  elseif (e.x > p.x) then
    e.dx = -e.h_speed
    e.mvt_h = -1
    e.facing = 0
  else
   e.walk.f = e.walk.fix
   e.dx = 0
  end

  h_col = box_collide_h(e)
  
  if (e.x % 8 != 0) and h_col then
    if(e.mvt_h == 1) e.x += 8 - (e.x % 8)
    if(e.mvt_h == -1) e.x -= (e.x % 8)
  end

  if h_col then
    e.walk.f = e.walk.fix
  else
    e.x += e.dx
    anim(e.walk, 0.35)
  end
end

function move_y(e, p)
  v_col = box_collide_v(e)

  if (e.y % 8 != 0) and v_col then
    if(e.mvt_v == -1) e.y -= (e.y % 8)
    if(e.mvt_v == 1) e.y += 8 - (e.y % 8)
  end

  if (not (v_col)) e.y += e.dy

  if (is_on_a_solid_block(e)) then 
    e.jumping = false
    e.dy = 0
    e.mvt_v = 0
  end
  if (is_below_a_solid_block(e)) then
    e.dy = 1
  end
end