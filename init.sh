cd /home/nvidia/work/services/soc
echo 'nvidia' | sudo screen -dmS calserv python calserviceslong.py
sleep 1
echo 'nvidia' | sudo screen -dmS gisserv python gisserviceslong.py



echo "start tmux session and run baresip in this session"
bash -c "tmux new  -d -s gis && tmux send -t gis '/home/nvidia/work/services/soc' ENTER &&tmux send -t gis 'python gisserviceslong.py' ENTER "
bash -c "tmux new  -d -s frpc && tmux send -t frpc ' cd /home/pi/frpc/' ENTER &&tmux send -t frpc './frpc -c frpc.ini' ENTER "

cd /home/nvidia/work/services/soc && tmux new-session -d -s gis python gisserviceslong.py