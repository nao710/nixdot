{pkgs, ...}:{
 programs.firefox ={
  enable= true;
  profiles.default.extensions.packages = with  pkgs.inputs.firefox-addons; [
   ublock-origin
   bitwarden
   ];
};
}
