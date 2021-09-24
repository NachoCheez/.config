# kill existing polybars
killall -q polybar
# start polybars
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload example &
  done
else
  polybar --reload example &
fi
polybar bar1 &
polybar bar2 &

