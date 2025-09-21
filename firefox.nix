{pkgs, ...}:{
 programs.firefox ={
  enable= true;
  languagePacks =["ja","en-US"];
  extensions.packages = with  pkgs.inputs.firefox-addons; [
   ublock-origin
   bitwarden
   ];
};
}
