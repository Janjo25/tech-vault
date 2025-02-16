# **Useful Linux Commands**

## Display the Content of Files in a Directory

To print the content of all files in the current directory:

```sh
for file in *; do echo "Content of $file:"; cat "$file"; echo; done
```

## Display the Content of Files in a Directory **Recursively**

To recursively print the content of all files in subdirectories:

```sh
find . -type f -exec echo "Content of {}:" \; -exec cat {} \; -exec echo \;
```

## Find Manually Installed Packages

Check which packages were manually installed using `pacman`:

```sh
grep "pacman -S " /var/log/pacman.log
```

## Global Search Using `locate` (Requires Database Update)

Update the `locate` database and search for a term:

```sh
sudo updatedb && locate term
```

## Global Search for Files or Directories by Name

Search for files or directories matching a specific term:

```sh
sudo find / -iname "*term*" 2>/dev/null
```
