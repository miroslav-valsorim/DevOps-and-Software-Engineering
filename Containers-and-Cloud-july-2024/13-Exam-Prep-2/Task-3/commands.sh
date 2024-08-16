
cd blackbox
blackbox-exporter.exe

cd alertmanager
.\alertmanager.exe --config.file .\alertmanager-exam.yml

cd prometheus
prometheus.exe --config.file prometheus-exam.yml