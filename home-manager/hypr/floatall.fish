#!/usr/bin/env fish
for i in $(hyprctl clients -j | jq -r ".[] | select(.workspace.id == $(hyprctl activeworkspace -j | jq .id)) | .pid")
    hyprctl dispatch togglefloating pid:$i
end
