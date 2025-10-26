```
// Create Application Gateway - Layer 7 

1. Create RG - LB  
2. Create VNET - LB-VNET 

3. Create 2VMs - VM1 & VM2 (Ubuntu Server) | Standard_D2s_v3 | NSG: http-80, https-443, ssh-22 
  
 cd Downloads  
 chmod 400 key.pem 
ssh -i key.pem atul@20.57.132.118

ON VM1 >>

 sudo apt update  
 sudo apt install apache2 -y 
 sudo systemctl start apache2 
 sudo systemctl enable apache2 
 cd /var/www/html 
sudo rm index.html 
sudo mkdir images
cd images 
 sudo touch index.html  
 sudo nano index.html 
  
 save <h1> Images <h1> on VM1 

>> On VM2 

ssh -i key.pem atul@20.51.116.207

 sudo apt update  
 sudo apt install apache2 -y 
 sudo systemctl start apache2 
 sudo systemctl enable apache2 
 cd /var/www/html 
sudo rm index.html 
sudo mkdir videos
cd videos 
 sudo touch index.html  
 sudo nano index.html 

 save <h1> Videos<h1> on VM2 

http://20.57.132.118/images/index.html
http://20.51.116.207/videos/index.html
  
 
4. Create Application Gateway 
5. Create Backendpool >> add both VMs
6. Create BackedSetting 
7. Rules >> Backend Target - Backend Setting 
Path Based - Images - /images
Path Based - Videos - /videos



```
