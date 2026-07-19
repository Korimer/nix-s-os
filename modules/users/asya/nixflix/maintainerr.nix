{
  den.aspects.asya.provides.nixflix.provides.maintainerr.nixos = { config, ... }:
  {
    nixflix = {
      maintainerr = {
        enable = true;
        rules = [
          {
                
            name = "Movies To Delete";
            description = "Deletes movies that have been watched or around too long.";
            library = "Movies";
            dataType = "movie";
            radarrServerName = "Radarr";
            collection.deleteAfterDays = 14;
            rules = [
              {
                customVal = { ruleTypeId = 3; value = "1"; };
                operator = null;
                firstVal = [ 6 42 ];
                action = "EQUALS";
                section = 0;
              }
            ];
          }
        ];
      };
    };
  };
}

