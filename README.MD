# Jupyter Hub based on Alpine

1. This version uses Python 3.6 and Alpine 3.10.
2. The authenticator configured is dummy.
	- Login: use any
	- Password: See the jupyterhub_config.py
3. To build the image, run the code below
```
sudo docker build --rm -t juphub-alpine .
```
4. To run in a container the builded image, run the code below
```
sudo docker run -p 8000:8000 -d juphub-alpine
```
5. Access from your web browser using the url below
```
http://localhost:8000/
```