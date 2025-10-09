{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
       libllvm
       clang
       clang-tools
       cmake
       gnumake
       libtool
       libvterm
       glibtool
       
     ];
   }
