{ pkgs, ...}:
{
  programs.yazi = {
    enable = true;
    
    settings = {
      mgr = {
        show_hidden = true;
        sort_by = "natural";
      };
      
      opener = {
        edit = [
          { run = "nvim \"$@\""; block = true; }
        ];
        image = [
          {
            run = ''feh --scale-down --auto-zoom "$@"'';
            orphan = true;
            desc = "View with feh";
          }
        ];
      };
      
      open = {
        prepend_rules = [
          { mime = "image/*"; use = "image"; }
        ];
      };
    };
    
    keymap = {
      mgr.prepend_keymap = [
        { run = "close"; on = [ "<C-q>" ]; }
        { run = "yank --cut"; on = [ "d" ]; }
        { run = "remove --force"; on = [ "D" ]; }
      ];
    };
  };
}
