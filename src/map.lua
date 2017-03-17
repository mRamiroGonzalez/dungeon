
function get_block_below(e, flag)
 return (get_block_flag(e.x, e.y+8, flag)) or (get_block_flag(e.x+7, e.y+8, flag))
end

function get_block_flag(x, y, flag)
 return fget(mget(flr(x/8), flr(y/8)), flag)
end

function get_block_on_top(e, flag)
 return get_block_flag(e.x, e.y-1, flag) or get_block_flag(e.x+7, e.y-1, flag)
end