# **Trailing Spaces Detection in Files**

## Regular Expression for Detecting Trailing Spaces

To detect trailing spaces at the end of any line, use the following regular expression:

```
[ \t]+(?=\r?$)
```

### Explanation:

- **`[ \t]+`** → Matches one or more spaces or tab characters.
- **`(?=\r?$)`** → Ensures that the matched spaces are immediately before the end of the line, without capturing the
  newline character.

## Check for Trailing Spaces in a File

To find lines with trailing spaces using `grep`, run:

```sh
grep -nP '[ \t]+(?=\r?$)' filename
```

This command:

- Uses `-n` to display line numbers.
- Uses `-P` to enable Perl-compatible regular expressions.
- Searches for lines containing trailing spaces or tabs.

## Remove Trailing Spaces Automatically

To remove trailing spaces from a file without modifying the newline characters, use:

```sh
sed -i 's/[ \t]+$//' filename
```

This command:

- Uses `sed` to replace trailing spaces or tabs with nothing.
- Modifies the file in place (`-i` flag).

## Validate a File Has No Trailing Spaces

To ensure that a file contains no trailing spaces, use:

```sh
if grep -qP '[ \t]+(?=\r?$)' filename; then
    echo "❌ Trailing spaces detected!"
    exit 1
else
    echo "✅ No trailing spaces found."
fi
```

This script:

- Checks if any line has trailing spaces.
- Exits with an error if trailing spaces are found.
