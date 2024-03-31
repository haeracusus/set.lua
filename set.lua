local set = {}

function set.new(t)
  assert(type(t)=='table','not a table')
  local new = {}
  for _,v in pairs(t) do new[v] = true end
  return new
end

function set.union(a,b)
  assert(type(a)=='table' and type(b)=='table', 'one of these is not a set/table')
  local new = {}
  for k in pairs(a) do new[k] = true end
  for k in pairs(b) do new[k] = true end
  return new
end

function set.intersection(a,b)
  assert(type(a)=='table' and type(b)=='table', 'one of these is not a set/table')
  local new = {}
  for k in pairs(a) do new[k] = b[k] end
  return new
end

function set.diff(a,b)
  assert(type(a)=='table' and type(b)=='table', 'one of these is not a set/table')
  local new = {}
  for k in pairs(a) do new[k] = not b[k] or nil end
  return new
end

function set.sdiff(a,b)
  assert(type(a)=='table' and type(b)=='table', 'one of these is not a set/table')
  local new = {}
  for k in pairs(a) do new[k] = true end
  for k in pairs(b) do new[k] = not new[k] or nil end
  return new
end

function set.add(s,v)
  assert(type(s)=='table','cannot insert into nonset')
  assert(v~=nil,'value is nil')
  s[v] = true
end

function set.remove(s,v)
  assert(type(s)=='table','cannot insert into nonset')
  assert(v~=nil,'value is nil')
  s[v] = nil
end

function set.concat(s,sep)
  assert(type(s)=='table','not a set/table, cannot concatenate')
  if sep then assert(type(sep)=='string','not a string, cannot be separator') else sep = '' end
  local str = ''
  for k in pairs(s) do
    str=str..tostring(k)..sep
  end
  str = str:sub(1,-(sep:len()+1))
  return str
end

function set.cardinality(s)
  assert(type(s)=='table','not a set/table, cannot get length')
  local count = 0
  for _ in pairs(s) do
    count = count + 1
  end
  return count
end

return set
