{...}: {
  programs.zsh.shellAliases = {
    # Nix/NixOS specific
    nsu = "sudo nixos-rebuild switch";
    nbs = "sudo nixos-rebuild switch --flake .#";
    nbsh = "sudo nixos-rebuild switch --flake .#$(hostname)";
    nboot = "sudo nixos-rebuild boot";
    ntest = "sudo nixos-rebuild test";
    nvm = "nix-collect-garbage -d && nix-store --optimize";

    # Flakes
    nf = "nix flake";
    nfu = "nix flake update";
    nfp = "nix flake show --all-systems";
    nfi = "nix flake info";
    nfs = "nix flake show";
    nfo = "nix flake output";

    # Nix shell/env
    ns = "nix-shell";
    ne = "nix develop";
    nde = "nix develop --impure";
    nr = "nix run";
    nrs = "nix run .#";

    # GC and cleanup
    ngc = "sudo nix-collect-garbage -d";
    ngcc = "sudo nix-collect-garbage --delete-older-than 7d";
    nsweep = "sudo nix-store --gc && sudo nix-collect-garbage -d";

    # Config editing
    ncfg = "cd /etc/nixos";
    nvimcfg = "nvim /etc/nixos/configuration.nix";
    nvimflake = "nvim /etc/nixos/flake.nix";
    nh = "nix run nixpkgs#nix-health";

    # Package management
    ni = "nix-env -iA";
    nis = "nix-env -q";
    nu = "nix-env --upgrade";
    nrm = "nix-env -e";
    nlist = "nix-env -q";
    nsf = "nix search nixpkgs";
    nsx = "nix search";
    nx = "nix search nixpkgs";
    nclean = "sudo nix-collect-garbage -d";
    ncheck = "nix doctor";
    ndrv = "nix show-derivation";

    # Navigation
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    dl = "cd ~/Downloads";
    dt = "cd ~/Desktop";
    docs = "cd ~/Documents";

    # Git
    lg = "lazygit";
    gs = "git status";
    gl = "git pull";
    gp = "git push";
    ga = "git add";
    gc = "git commit";
    gcm = "git commit -m";
    gco = "git checkout";
    gcl = "git clone";
    gb = "git branch";
    gd = "git diff";

    # Utils
    cls = "clear";
    c = "clear";
    h = "history";
    j = "jobs -l";
    ltr = "ls -ltr";
    du1 = "du -h --max-depth=1";
    free = "free -h";
    ls = "eza --icons --color=always --group-directories-first";
    ll = "eza -alF --icons --color=always --group-directories-first";
    la = "eza -a --icons --color=always --group-directories-first";
    l = "eza -F --icons --color=always --group-directories-first";
    grep = "grep --color=auto";

    # thunderbird
    tb = "thunderbird";
    tbp = "thunderbird -P";
    tbs = "thunderbird --safe-mode";
  };
}
