local imports = {};
imports.requests = game:GetService('HttpService');

--/ struct;
local struct = {};
struct.post = {};
struct.get = {};

function struct.post:body(url, body: {} | "body: { ['key'] = value }", Callback: () -> ())
  local success, response = pcall(imports.requests.RequestAsync, imports.requests, {
    Url = url,
    Method = 'POST',
    Headers = {
      ["Content-Type"] = "application/x-www-form-urlencoded"
    },
    Body = (function(self)
      for key, value in pairs(body) do
        self ..= string.format('%s=%s', key, value);
      end;
      
      return self;
    end)('')
  });

  if not success then 
    return error(response)
  else
    return Callback((imports.requests:JSONDecode(response.Body)).data);
  end;
end;

function struct.get:param(url, param: {} | "body: { value }", Callback: () -> ())
  local success, response = pcall(imports.requests.RequestAsync, imports.requests, {
    Url = (function(self)
      for key, value in pairs(param) do
        self ..= string.format('/:%s', value);
      end;
      
      return self;
    end)(url),
    Method = 'GET',
  });

  if not success then 
    return error(response)
  else
    return Callback((imports.requests:JSONDecode(response.Body)).data);
  end;
end;

return struct;
