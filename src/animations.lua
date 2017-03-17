
function anim(a, i)
  a.f += i
  if a.f > a.sz then
    a.f = a.st
  end
end