{ pkgs, config, ... }:

{
programs.qutebrowser = {
      enable = true;
      extraConfig = ''
        c.statusbar.padding = {'top': 5, 'bottom': 5, 'left': 3, 'right': 3}
        c.tabs.padding = {'top': 8, 'bottom': 6, 'left': 3, 'right': 3}
      '';
      keyBindings = {
        normal = {
        "N" =  "tab-next";
        "E" =  "tab-prev";
        "K" =  "search-prev";
        "l" =  "mode-enter insert";
        "n" =  "scroll down";
        "e" =  "scroll up";
        "i" =  "scroll right";
        "j" =  "search-next";
        "b" =  "set-cmd-text -s :tab-select ";
        "gL" =  "open javascript:location.href='org-protocol://capture?template=l&url='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(document.title)+'&body='+encodeURIComponent(document.getSelection())";
        "gM" =  "open javascript:location.href='org-protocol://capture?template=m&url='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(document.title)+'&body='+encodeURIComponent(document.getSelection())";
        "gR" = "open javascript:location.href='org-protocol://roam-ref?template=r&ref='+encodeURIComponent(location.href)+'&title='+encodeURIComponent(document.title)";
        "pf" =  "spawn --userscript qute-pass";
        "gz" =  "jseval var d=document,s=d.createElement('script';;s.src='https://www.zotero.org/bookmarklet/loader.js';(d.body?d.body:d.documentElement;.appendChild(s;;void(0;;";
        "t" =  "set-cmd-text -s :open -t";
        "Y" =  "yank selection";
        "O" =  "set-cmd-text :open {url:pretty}";
        "<Alt-Left>" =  "back";
        "<Alt-Right>" =  "forward";
        };
      };
      searchEngines = {
        "DEFAULT" =  "https://duckduckgo.com/?q={}";
        "w" =  "https://en.wikipedia.org/w/index.php?search={}";
        "gs" =  "https://scholar.google.com/scholar?q={}";
        "aw" =  "https://wiki.archlinux.org/?search={}";
        "o" =  "https://search.nixos.org/options?channel=unstable&from=0&size=50&sort=relevance&query={}";
        "p" =  "https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&query={}";
        "d" =  "https://en.wiktionary.org/wiki/{}";
        "v" =  "https://eo.wiktionary.org/wiki/{}";
        "melpa" =  "https://melpa.org/#/?q={}";
        "s" =  "http://stackoverflow.com/search?q={}";
        "ss" = "https://www.semanticscholar.org/search?q={}";
        "c" =  "https://clio.columbia.edu/quicksearch?q={}";
        "gh" =  "https://github.com/search?q={}&type=Repositories";
        "h" =  "https://hackage.haskell.org/packages/search?terms={}";
        "libgen" =  "https://libgen.is/search.php?req={}";
        "viki" =  "https://eo.wikipedia.org/w/index.php?search={}";
        "ia" =  "https://archive.org/details/texts?and%5B%5D={}&sin=";
        };
      settings = {
        colors = {
          tabs = {
            even.bg = "#16161C";
            odd.bg = "#16161C";
            selected.even.bg = "#2E303E";
            selected.odd.bg = "#2E303E";
          };
        };
        fonts = {
          completion.category = "12pt Iosevka";
          default_family = "Iosevka, Terminus, Monospace, monospace, Fixed";
          prompts = "12pt Iosevka";
        };
        hints.chars = "arstdhneio";
        # url.default_page = "${scripts}/homepage/homepage.html";
      };
    };
  }
