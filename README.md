# Docker-CLI-file-renamer
Reaname files in a directory using user's provided filename, like:
```
this.txt, that.txt -> <new-name>1.txt, <new-name>2.txt
```
The first thing to do is to create a container: 
```
docker container create -i --name renamer --workdir /script `
ubuntu bash -c 'chmod +x renamer.sh && ./renamer.sh $(cat -)'
```
The second step is to copy a script that will rename files into the container:
```
docker container cp <path-to-script> renamer:/script
```
The third step is copy files that you want to rename to the container:
```
docker container cp <path-to-files>\. renamer:/files-to-rename
```
Then start the container and provide a name that you want to use:
```
echo <new-name> | docker container start -i renamer
```
Then copy renamed files from the container back to you machine. If you don't have this path yet then it will be created.
```
docker container cp renamer:/files-to-rename/. <path-where-to-save>
```
