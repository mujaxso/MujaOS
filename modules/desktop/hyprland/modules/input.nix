{
  kb_layout = "us,ara";
  kb_options = "grp:alt_shift_toggle,ctrl:nocaps,caps:escape"; # Add Escape on tap
  kb_variant = ","; # Empty variant for US, default for Arabic
  # kb_model =
  # kb_rules =

  follow_mouse = 1;

  sensitivity = 0;
  accel_profile = "flat"; # Disable mouse acceleration for precision

  touchpad = {
    natural_scroll = false;
    tap-to-click = true; # Easier tapping
    disable_while_typing = true; # Prevent accidental touches
  };
}
