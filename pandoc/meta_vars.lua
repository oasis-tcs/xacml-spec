-- Replace $(x) where 'x' is one of the metadata (${x} and {{x}} don't work in URLs, handled as delimiter by Pandoc)
local PLACEHOLDER_START = "%"
local PLACEHOLDER_END = "%"
local PLACEHOLDER_START_LEN = string.len(PLACEHOLDER_START)
local PLACEHOLDER_END_LEN = string.len(PLACEHOLDER_END)
local MIN_PLACEHOLDER_LEN_EXCLUDING_FIRST_CHAR = PLACEHOLDER_START_LEN + PLACEHOLDER_END_LEN

local vars = {}

-- Set date metadata to current date if unset. Based on https://pandoc.org/lua-filters.html#setting-the-date-in-the-metadata
function Meta(m)
  if m.date == nil then
    m.date = os.date("%d %B %Y")
  end
  for k, v in pairs(m) do
    -- print("k: ".. k .. ", v: ".. vars[k])
    if pandoc.utils.type(v) == 'Inlines' then
      vars[k] = pandoc.utils.stringify(v)
    elseif pandoc.utils.type(v) == 'string' then
      vars[k] = v
    end
  end
  return m
end

-- Replace placeholders with metadata values. Based on https://pandoc.org/lua-filters.html#replacing-placeholders-with-their-metadata-value

-- local function get_vars (meta)
--  for k, v in pairs(meta) do
--    print("key:"..k..",value:"..tostring(v))
--    vars["${" .. k .. "}"] = {table.unpack(v)}
--  end
-- end

local function replace (str)
  -- print("Replacing String: "..el.text)
  -- Simple form but requires to have whitespaces before/after the placeholder:
  -- if vars[str] then
  --   return pandoc.Span(vars[str])
  -- else
  --   return el
  -- end

  -- Advanced form: placeholder can be replaced anywhere:
  local search_init_index = 1
  local replacement_parts = {}
  local last_placeholder_end_last_index = 0
  while(search_init_index + MIN_PLACEHOLDER_LEN_EXCLUDING_FIRST_CHAR <= string.len(str))
  do
    local placeholder_start_first_index, placeholder_start_last_index = string.find(str, PLACEHOLDER_START, search_init_index, true)
    if placeholder_start_first_index then
      local placeholder_end_first_index, placeholder_end_last_index = string.find(str, PLACEHOLDER_END, placeholder_start_last_index + 1, true)
      if placeholder_end_first_index then 
        local key = string.sub(str, placeholder_start_last_index + 1, placeholder_end_first_index-1)
        if vars[key] then
          if last_placeholder_end_last_index+1 < placeholder_start_first_index then
            -- Append the substring between the last placeholder and this one, as is, if there is any
            table.insert(replacement_parts, string.sub(str, last_placeholder_end_last_index+1, placeholder_start_first_index-1) )
          end
          -- Replace the placeholder with the corresponding metadata value
          table.insert(replacement_parts, vars[key])
          last_placeholder_end_last_index = placeholder_end_last_index
        end
        search_init_index = placeholder_end_last_index + 1
      else
        -- No PLACEHOLDER_END found after PLACEHOLDER_START, resume the search after PLACEHOLDER_START
        search_init_index = placeholder_start_last_index + 1
      end
    else
      -- No placeholder found
      break
    end
    
  end

  if last_placeholder_end_last_index == 0 then
    -- No placeholder found, nothing to replace
    return nil
  else
    -- Append the substring between the last placeholder and the end, as is, if there is any
    if last_placeholder_end_last_index < string.len(str) then table.insert(replacement_parts, string.sub(str, last_placeholder_end_last_index+1 )) end
    local replacement = table.concat(replacement_parts)
    return replacement
  end

end

local function replace_Str(el)
  -- print("Replacing ".. pandoc.utils.type(el)..": "..tostring(el))
  -- if el.text then
  local replacement = replace(el.text)
  if replacement then el.text = replacement end
  return el
  --end
end

-- TODO: remove if unncessary
local function replace_Link_target(el)
  -- print("Replacing Link target: "..el.target)
  local replacement = replace(el.target)
  if replacement then el.target = replacement end
  return el
end

local function replace_CodeBlock(el)
  -- print("Replacing ".. pandoc.utils.type(el)..": "..tostring(el))
  local replacement = replace(el.text)
  if replacement then el.text = replacement end
  return el
end

function Pandoc(doc)
  print("Publication date changed to '"..vars["date"].."'. If this is official, remember to update the date also in References from other documents to this one.")
  local doc_after_meta_vars_replaced =  doc:walk { Meta = get_vars }:walk { Str = replace_Str, Link = replace_Link_target, CodeBlock = replace_CodeBlock }
  return pandoc.utils.run_lua_filter(doc_after_meta_vars_replaced, "pandoc/diagram.lua")
end