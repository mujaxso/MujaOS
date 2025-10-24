{
  # Layerrules to blur background when rofi is open
  layerrule = [
    "blur, gtk-layer-shell"
    "xray, rofi"
    "blur, !rofi"
    "ignorezero, rofi"
  ];
}
