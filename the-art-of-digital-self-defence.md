# The Art of Digital Self-Defence

## Strip EXIF

EXIF data contains: GPS locations, date/time of photo, and hardware-identifying information.

```bash
$ sudo pacman -S --needed perl-image-exiftool
$ exiftool image.jpg
$ exiftool -all= image.jpg
```

[Source](https://askubuntu.com/questions/260810/how-can-i-read-and-remove-meta-exif-data-from-my-photos-using-the-command-line)

## Firefox

Running a completely clean instance of Firefox:

```
#!/bin/sh

export DISPLAY=:0

# Set up clean copy
cd ~
rm -fr .mozilla
cp -a .mozilla_base .mozilla
cd - > /dev/null

/usr/local/bin/firefox $@
echo "Holding...."
sleep 2    
echo "Cleaning...."

# Clean out junk (so we start clean next time)
cd ~
rm -fr .mozilla .cache/mozilla*
rm -fr .adobe
rm -fr .macromedia
cd - > /dev/null
```

[Source](https://news.ycombinator.com/item?id=16500301)

