--[[ All permission's:
  ADMINISTRATOR,
  MODERATE_MEMBERS,
  MENTION_EVERYONE,
  MANAGE_GUILD,
  KICK_MEMBERS,
  BAN_MEMBERS,
  VIEW_AUDIT_LOG
]]

-- Settings:
local setting = {};

-- API Key:
setting.API_KEY = 'YOUR_API_KEY';
--[[ Description: The API key for your admin system. 
  This exclusive API key is reserved for premium users. 
  It grants access to advanced administrative features and extended functionality for efficiently managing your Discord server.
  With this key, you can utilize our enhanced Discord permissions through the API, making your administrative tasks more powerful and streamlined.
]]

-- Commands & Permissions:
setting.COMMANDS = {
  kickplayer = {
    description = "Kick a player from the game.",
    syntax = "kick",
    permissions = {
      KICK_MEMBERS = true,
      VIEW_AUDIT_LOG = true,
    },
    parameters = {
      Player = 1,
      Reason = { Index = 2, Default = 'Unspecified.' },
    }
  },
  globalban = {
    description = "Ban a player from accessing the game.",
    syntax = "globalban",
    permissions = {
      BAN_MEMBERS = true,
      VIEW_AUDIT_LOG = true
    },
    parameters = {
      Player = 1,
      Reason = { Index = 2, Default = 'Unspecified.' },
    }
  },
  unglobalban = {
    description = "Remove a player from the ban list.",
    syntax = "unglobalban",
    permissions = {
      BAN_MEMBERS = true,
      VIEW_AUDIT_LOG = true
    },
    parameters = {
      Player = 1,
    }
  },
  banplayer = {
    description = "Ban a player from accessing the game.",
    syntax = "ban",
    permissions = {
      BAN_MEMBERS = true,
      VIEW_AUDIT_LOG = true
    },
    parameters = {
      Player = 1,
      Reason = { Index = 2, Default = 'Unspecified.' },
    }
  },
  unbanplayer = {
    description = "Remove a player from the ban list.",
    syntax = "unban",
    permissions = {
      BAN_MEMBERS = true,
      VIEW_AUDIT_LOG = true
    },
    parameters = {
      Player = 1,
    }
  },
  muteplayer = {
    description = "Mute a player(s) in-game chat.",
    syntax = "mute",
    permissions = {
      VIEW_AUDIT_LOG = true,
      MODERATE_MEMBERS = true
    },
    parameters = {
      Player = 1,
    }
  },
  unmuteplayer = {
    description = "Unmute a player(s) in-game chat.",
    syntax = "unmute",
    permissions = {
      VIEW_AUDIT_LOG = true,
      MODERATE_MEMBERS = true
    },
    parameters = {
      Player = 1,
    }
  },
  announce = {
    description = "Send a global announcement to all players.",
    syntax = "announce",
    permissions = {
      ADMINISTRATOR = true,
      MENTION_EVERYONE = true
    },
    parameters = {
      Message = 1,
    }
  },
  warnplayer = {
    description = "Issue a warning to a player for rule violations.",
    syntax = "warn",
    permissions = {
      ADMINISTRATOR = true,
      VIEW_AUDIT_LOG = true
    },
    parameters = {
      Player = 1,
      Reason = { Index = 2, Default = 'Unspecified.' },
    }
  },
  viewlogs = {
    description = "View server logs and activity history.",
    syntax = "viewlogs",
    permissions = {
      ADMINISTRATOR = true,
      VIEW_AUDIT_LOG = true
    }
  },
  shutdownserver = {
    description = "Shut down the game server.",
    syntax = "shutdown",
    permissions = {
      ADMINISTRATOR = true,
      MANAGE_GUILD = true
    }, 
    parameters = {
      Reason = { Index = 1, Default = 'Unspecified.' },
    }
  },
  getdiscord = {
    description = "Get a player's linked Discord account.",
    syntax = "getdiscord",
    permissions = {
      MODERATE_MEMBERS = true,
      VIEW_AUDIT_LOG = true
    },
    parameters = {
      Player = 1,
    }
  },
};

return setting;
