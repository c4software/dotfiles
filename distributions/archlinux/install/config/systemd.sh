# Limit journal size to 50MB
echo "SystemMaxUse=50M" | sudo tee -a /etc/systemd/journald.conf
