#! /bin/bash
function convert_QT_to_mp4() {
  for file in *.mov ; do
    local bname=$(basename "$file" .mov)
    local mp4name="$bname.mp4"
    ffmpeg -i "$file" -pix_fmt yuv420p "$mp4name"
  done
}
convert_QT_to_mp4