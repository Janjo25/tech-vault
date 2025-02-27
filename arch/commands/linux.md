# **Useful Linux Commands**

## Display the Content of Files in a Directory **Recursively with Exclusions**

Recursively prints the content of all files while ignoring specific ones:

```sh
find . -type f ! -name "filename" -exec sh -c 'echo "Content of $1:"; cat "$1"; echo' sh {} \;
```

To exclude additional files, append `! -name "filename"` for each file to be ignored.
If no exclusions are specified, all files are processed.

## Display the Content of Files in a Directory **with Exclusions**

Prints the content of all files in the current directory while ignoring specific ones:

```sh
for file in *; do [[ " filename " =~ " $file " ]] && continue; echo "Content of $file:"; cat "$file"; echo; done
```

To exclude additional files, add their names inside the quoted space-separated list. If no exclusions are specified, all
files are processed.

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
