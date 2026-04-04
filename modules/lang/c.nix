{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libllvm
    lld
    clang
    clang-tools
    cmake
    gnumake
    libtool
    libvterm
    glibtool
    # gcc releated deps
    pkg-config
    glib.dev
  ];
}
