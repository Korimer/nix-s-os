{ pkgs, ... }:
let
  recolor = pkgs.ankiAddons.recolor.withConfig {
    config = {
      colors = {
        ACCENT_CARD = [ "Card mode" "#7aa2f7" "#7aa2f7" "--accent-card" ];
        ACCENT_DANGER = [ "Danger" "#f7768e" "#f7768e" "--accent-danger" ];
        ACCENT_NOTE = [ "Note mode" "#73daca" "#73daca" "--accent-note" ];
        BORDER = [ "Border" "#414868" "#414868" "--border" ];
        BORDER_FOCUS = [ "Border (focused input)" "#7aa2f7" "#7aa2f7" "--border-focus" ];
        BORDER_STRONG = [ "Border (strong)" "#565f89" "#565f89" "--border-strong" ];
        BORDER_SUBTLE = [ "Border (subtle)" "#101014" "#101014" "--border-subtle" ];
        BUTTON_BG = [ "Button background" "#292e42" "#292e42" "--button-bg" ];
        BUTTON_DISABLED = [ "Button background (disabled)" "#565f89" "#565f89" "--button-disabled" ];
        BUTTON_HOVER = [ "Button background (hover)" "#414868" "#414868" [ "--button-gradient-start" "--button-gradient-end" ] ];
        BUTTON_HOVER_BORDER = [ "Button border (hover)" "#7aa2f7" "#7aa2f7" "--button-hover-border" ];
        BUTTON_PRIMARY_BG = [ "Button Primary Bg" "#7aa2f7" "#7aa2f7" "--button-primary-bg" ];
        BUTTON_PRIMARY_DISABLED = [ "Button Primary Disabled" "#565f89" "#565f89" "--button-primary-disabled" ];
        BUTTON_PRIMARY_GRADIENT_END = [ "Button Primary Gradient End" "#2ac3de" "#2ac3de" "--button-primary-gradient-end" ];
        BUTTON_PRIMARY_GRADIENT_START = [ "Button Primary Gradient Start" "#7aa2f7" "#7aa2f7" "--button-primary-gradient-start" ];
        CANVAS = [ "Background" "#1a1b26" "#1a1b26" [ "--canvas" "--bs-body-bg" "--bs-body-bg" ] ];
        CANVAS_CODE = [ "Code editor background" "#16161e" "#16161e" "--canvas-code" ];
        CANVAS_ELEVATED = [ "Background (elevated)" "#16161e" "#16161e" "--canvas-elevated" ];
        CANVAS_GLASS = [ "Background (transparent text surface)" "#1a1b26" "#1a1b26" "--canvas-glass" ];
        CANVAS_INSET = [ "Background (inset)" "#16161e" "#16161e" "--canvas-inset" ];
        CANVAS_OVERLAY = [ "Background (menu & tooltip)" "#1f2335" "#1f2335" "--canvas-overlay" ];
        FG = [ "Text" "#a9b1d6" "#a9b1d6" [ "--fg" "--bs-body-color" "--bs-body-color" ] ];
        FG_DISABLED = [ "Text (disabled)" "#565f89" "#565f89" "--fg-disabled" ];
        FG_FAINT = [ "Text (faint)" "#565f89" "#565f89" "--fg-faint" ];
        FG_LINK = [ "Text (link)" "#73daca" "#73daca" "--fg-link" ];
        FG_SUBTLE = [ "Text (subtle)" "#787c99" "#787c99" "--fg-subtle" ];
        FLAG_1 = [ "Flag 1" "#f7768e" "#f7768e" "--flag-1" ];
        FLAG_2 = [ "Flag 2" "#ff9e64" "#ff9e64" "--flag-2" ];
        FLAG_3 = [ "Flag 3" "#9ece6a" "#9ece6a" "--flag-3" ];
        FLAG_4 = [ "Flag 4" "#7aa2f7" "#7aa2f7" "--flag-4" ];
        FLAG_5 = [ "Flag 5" "#bb9af7" "#bb9af7" "--flag-5" ];
        FLAG_6 = [ "Flag 6" "#7dcfff" "#7dcfff" "--flag-6" ];
        FLAG_7 = [ "Flag 7" "#9d7cd8" "#9d7cd8" "--flag-7" ];
        HIGHLIGHT_BG = [ "Highlight background" "#515c7e40" "#515c7e40" "--highlight-bg" ];
        HIGHLIGHT_FG = [ "Highlight text" "#c0caf5" "#c0caf5" "--highlight-fg" ];
        SCROLLBAR_BG = [ "Scrollbar background" "#16161e" "#16161e" "--scrollbar-bg" ];
        SCROLLBAR_BG_ACTIVE = [ "Scrollbar background (active)" "#414868" "#414868" "--scrollbar-bg-active" ];
        SCROLLBAR_BG_HOVER = [ "Scrollbar background (hover)" "#292e42" "#292e42" "--scrollbar-bg-hover" ];
        SELECTED_BG = [ "Selected Bg" "#283457" "#283457" "--selected-bg" ];
        SELECTED_FG = [ "Selected Fg" "#c0caf5" "#c0caf5" "--selected-fg" ];
        SHADOW = [ "Shadow" "#101014" "#101014" "--shadow" ];
        SHADOW_FOCUS = [ "Shadow (focused input)" "#7aa2f7" "#7aa2f7" "--shadow-focus" ];
        SHADOW_INSET = [ "Shadow (inset)" "#101014" "#101014" "--shadow-inset" ];
        SHADOW_SUBTLE = [ "Shadow (subtle)" "#16161e" "#16161e" "--shadow-subtle" ];
        STATE_BURIED = [ "Buried" "#e0af68" "#e0af68" "--state-buried" ];
        STATE_LEARN = [ "Learn" "#ff9e64" "#ff9e64" "--state-learn" ];
        STATE_MARKED = [ "Marked" "#7dcfff" "#7dcfff" "--state-marked" ];
        STATE_NEW = [ "New" "#7aa2f7" "#7aa2f7" "--state-new" ];
        STATE_REVIEW = [ "Review" "#9ece6a" "#9ece6a" "--state-review" ];
        STATE_SUSPENDED = [ "Suspended" "#e0af68" "#e0af68" "--state-suspended" ];
      };
      version = {
        major = 3; minor = 3;
      };
    };
  };
  passfail = pkgs.ankiAddons.passfail2.withConfig {
    config = {
      again_button_name = "Incorrect";
      good_button_name = "Correct";
    };
  };
  ankiExtensions = with pkgs.ankiAddons; [
    # fancy extensions requiring config
    passfail recolor
    # Normal extensions
    anki-connect
    adjust-sound-volume
    review-heatmap
    reviewer-refocus-card # lets me scroll cards with pgUp/pgDown
  ];
  myAnki = pkgs.anki.withAddons ankiExtensions;
in
{
  environment.systemPackages = [
    myAnki
  ];
}
