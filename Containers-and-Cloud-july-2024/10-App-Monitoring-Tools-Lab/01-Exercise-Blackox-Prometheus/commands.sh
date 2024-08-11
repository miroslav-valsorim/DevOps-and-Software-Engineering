cd blackbox
blackbox_exporter.exe

# open localhost:9115 
# http://localhost:9115/probe?target=https://alfaromeo.azurewebsites.net/

cd prometheus
prometheus.exe --config.file prometheus-blackbox.yml

# open localhost:9090
# Status > targets -> to check if the blackbox is configured