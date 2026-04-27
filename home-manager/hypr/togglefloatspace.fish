#!/usr/bin/env fish

if test (hyprctl activeworkspace -j | jq -r .name) = floating
    set ISFLOATING
else
    set ISFLOATING floating
end

hyprctl dispatch renameworkspace $(hyprctl activeworkspace -j | jq .id) $ISFLOATING
