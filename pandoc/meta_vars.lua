local vars = {}

-- Set date metadata to current date if unset. Based on https://pandoc.org/lua-filters.html#setting-the-date-in-the-metadata
function Meta(m)
  if m.date == nil then
    m.date = os.date("%d %B %Y")
  end
  for k, v in pairs(m) do
    print("key:"..k..",value:"..tostring(v))
    vars["%" .. k .. "%"] = v -- {table.unpack(v)}
  end
  return m
end

-- Replace placeholders with metadata values. Based on https://pandoc.org/lua-filters.html#replacing-placeholders-with-their-metadata-value

-- local function get_vars (meta)
--  for k, v in pairs(meta) do
--    print("key:"..k..",value:"..tostring(v))
--    vars["%" .. k .. "%"] = {table.unpack(v)}
--  end
-- end

local function replace (el)
  if vars[el.text] then
    return pandoc.Span(vars[el.text])
  else
    return el
  end
end

function Pandoc(doc)
  print("Publication date changed to '"..vars["%date%"].."'. Remember to update the date also in References from other documents to this one.")
  return doc:walk { Meta = get_vars }:walk { Str = replace }
end