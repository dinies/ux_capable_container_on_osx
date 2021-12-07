# ux_capable_container_on_osx

Useful [guide](https://cntnr.io/running-guis-with-docker-on-mac-os-x-a14df6a76efc) to set up osx machine. 

## These are the steps to do before starting the container:

1. Start the socat server:
```bash
socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
```

2. Find out the IP of the host machine and happend ":0" to it:
```bash
IP=$(ifconfig en0 | awk '/inet /{print $2 ":0"}')
```

3. Add the IP of the hosting machine:  
```bash
xhost + IP
```

4. Inside the container set-up the environment variable DISPLAY with the IP previously found:
```bash
export $DISPLAY=1.1.1.1:0
```

5. Inside the container start the GUI application:
```bash
xeyes
```








