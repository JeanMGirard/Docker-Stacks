


### Nginx on Ubuntu 18.04 LTS (bionic)
*https://certbot.eff.org/lets-encrypt/ubuntubionic-nginx*
```bash
sudo apt-get update
sudo apt-get install software-properties-common
sudo add-apt-repository universe
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot python-certbot-nginx
```


### Get Started

```bash
# have Certbot edit your Nginx configuration automatically
sudo certbot --nginx

#make the changes to your Nginx configuration by hand
sudo certbot --nginx certonly
```
If you want to obtain a **wildcard certificate** using Let's Encrypt's new ACMEv2 server, you'll also need to use one of Certbot's DNS plugins. 
To do this, make sure the plugin for your DNS provider is installed using the instructions above and run a command like the following:
```
sudo certbot -a dns-plugin -i nginx -d "*.example.com" -d example.com --server https://acme-v02.api.letsencrypt.org/directory
```
**You'll need to replace dns-plugin with the name of the DNS plugin you want to use.**
