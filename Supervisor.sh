sudo apt-get install supervisor
cd /etc/supervisor/conf.d/
sudo touch kockpitetl.conf
sudo chmod 777 kockpitetl.conf
echo "
[program:autostart]
command=/bin/bash /usr/local/autostart.sh
user=azure
password=Shelby51035252
chown=azure
autostart=true
autorestart=true
stderr_logfile=/var/log/supervisor/test.err.log
stdout_logfile=/var/log/supervisor/test.out.log " > kockpitetl.conf
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl restart all
