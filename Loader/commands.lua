export type structure = {
  endpoint: {
    get: { param: (self, url: string, Callback: () -> ()) -> any },
    post: { body: (self, url: string, body: {} | "body: { ['key'] = value }", Callback: () -> ()) -> any }
  }, 
  settings: {
    API_KEY: string,
    COMMANDS: { [any]: {
      description: string,
      syntax: string,
      permissions: {any},
      parameters: number & {
        Player: number,
        Reason: { Index: number, Default: string },
      }
    }} --/ Not used;
  };
};

--/ struct;
local struct = {};

struct['kickplayer'] = function(struct: structure, data)
  local player: Player = data.Player;
  local reason = data.Reason;
  
  return player:Kick(reason);
end;

struct['globalban'] = function(struct: structure, data)
  local player: Player = data.Player;
  local reason = data.Reason;

  struct.endpoint.post:body('http://api.rectify.international/v1/panel/user/globalban/', { 
    ['apikey'] = struct.settings.API_KEY, ['userid'] = player.UserId, ['reason'] = (reason)
  }, function(output)
    if output.status ~= 200 then
      return error((output['data'] and output.data.message) or output.status)
    else
      warn(string.format('globalBan:%s:%s', (output.data.userid == player.UserId), output.data.reason));

      return player:Kick(output.data.reason);
    end;
  end);
end;

struct['unglobalban'] = function(struct: structure, data)
  local player: Player = data.Player;
  
  --/ Empty;
end;

struct['banplayer'] = function(struct: structure, data)
  local player: Player = data.Player;
  local reason = data.Reason;

  struct.endpoint.post:body('http://api.rectify.international/v1/panel/user/ban/', { 
    ['apikey'] = struct.settings.API_KEY, ['userid'] = player.UserId, ['reason'] = (reason)
  }, function(output) 
    if output.status ~= 200 then
      return error((output['data'] and output.data.message) or output.status)
    else
      warn(string.format('banplayer:%s:%s', (output.data.userid == player.UserId), output.data.reason));

      return player:Kick(output.data.reason);
    end;
  end);
end;

struct['unbanplayer'] = function(struct: structure, data)
  local player: Player = data.Player;

  --/ Empty;
end;

struct['muteplayer'] = function(struct: structure, data)
  local player: Player = data.Player;
  local reason = data.Reason;
  
  --/ Empty;
end;

struct['unmuteplayer'] = function(struct: structure, data)
  local player: Player = data.Player;
  
  --/ Empty;
end;

struct['announce'] = function(struct: structure, data)
  local message = data.Message;
  
  --/ Empty;
end;

struct['warnplayer'] = function(struct: structure, data)
  local player: Player = data.Player;
  local reason = data.Reason;
  
  --/ Empty;
end;

struct['viewlogs'] = function(struct: structure, data)
  --/ Empty;
end;

struct['shutdownserver'] = function(struct: structure, data)
  local reason = data.Reason;
  
  for _, player: Player in pairs(game:GetService('Players'):GetPlayers())  do
    player:Kick(reason);
  end;
end;

struct['getdiscord'] = function(struct: structure, data)
  local player: Player = data.Player;
  
  --/ Empty;
end;

return struct;
