{ config, pkgs, ...}:

{
programs.nushell = {
    enable = true;
    settings = {
      skip_welcome_message = true;
      edit_mode = "vi";
      # prompt = "echo $(starship prompt)"; # Enable the Starship prompt
      startup = [ "let-env NNN_PLUG = 'v:preview-tui;g:imgview'"
                  "let-env NNN_TRASH = '1'"
                  "let-env VISUAL = 'nvim'"
                  "alias fm = nnn -HCdaP v"
                  "alias nnn = nnn -HCdaP v"
                  "alias n = nnn -HCdaP v"
                  "alias $VISUAL = echo $nu.env.VISUAL"
                  "alias $EDITOR = echo $nu.env.EDITOR"
      ];
    };
  };
}
