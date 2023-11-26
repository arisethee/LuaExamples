export type structure = {
  endpoint: {
    get: { param: (self, url: string, Callback: () -> ()) -> any },
    post: { body: (self, url: string, body: {} | "body: { ['key'] = value }", Callback: () -> ()) -> any }
  }, settings: {
    API_KEY: string
  };
};

return (function(struct: structure, Invoker: Player, Callback: () -> ())
  struct.endpoint.post:body('http://api.rectify.international/v1/public_admin/userpermissions', { 
    ['apikey'] = struct.settings.API_KEY, ['userid'] = Invoker.UserId
  }, Callback);
end);
