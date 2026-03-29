
#!/bin/bash
echo "enter a directory to check its size:"
read DIR_PATH

if [ -d "$DIR_PATH" ]; then
    echo "directory exists. size is:"
    du -sh "$DIR_PATH"
else
    echo "error: directory $DIR_PATH does not exist"
fi
