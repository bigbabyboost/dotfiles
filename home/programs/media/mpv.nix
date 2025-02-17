{pkgs, ...}: {
  programs.mpv = {
    enable = true;
    defaultProfiles = ["fast"];
    scripts = with pkgs.mpvScripts; [
      mpris
      sponsorblock
      thumbnail
      modernz
      smartskip
      youtube-chat
      quality-menu
      youtube-upnext
      autosubsync-mpv
      autoload
      smart-copy-paste-2      
    ];
    config = {
      hwdec = "auto-safe";
      hwdec-codecs = "all";
      vo = "gpu";
      gpu-context = "wayland";
      osc = "no";
      pulse-buffer = "50";
      audio-pitch-correction = "yes";
      ytdl-format = "bestvideo[height<=?1080][vcodec!~='av0?1']+bestaudio/best";
      save-position-on-quit = true;
      slang = "ind,id,eng,en,enUS,en-US,fi,fiFI,fi-FI";
      alang = "ind,id,eng,en,enUS,en-US,fi,fiFI,fi-FI";
      demuxer-mkv-subtitle-preroll = true;
      sub-auto = "fuzzy";
      sub-file-paths = "ass:srt:sub:subs:subtitles";
      embeddedfonts = "yes";
      sub-border-size = "3.2";
      sub-shadow-offset = "1";
      sub-shadow-color = "#33000000";
    };
  };
}
