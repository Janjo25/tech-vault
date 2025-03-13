# **Detecting Consecutive Blank Lines with Spaces**

## Regular Expression for Detecting Blank Lines

To match consecutive blank lines (including those with spaces or tabs) but not at the end of a file, use the following
regular expression:

```
(?m)^[ \t]*\r?\n^[ \t]*\r?\n(?=[^\r\n])
```

### Explanation:

- **`(?m)`** → Enables multiline mode, making `^` and `$` match the start and end of each line instead of the entire
  string.
- **`^[ \t]*\r?\n`** → Matches a blank line that may contain spaces or tabs:
    - **`^`** → Start of the line.
    - **`[ \t]*`** → Matches any number of spaces or tab characters.
    - **`\r?\n`** → Matches a newline (`\n`) with an optional carriage return (`\r`).
- **`^[ \t]*\r?\n`** → Matches a second blank line.
- **`(?=[^\r\n])`** → Ensures that the match does not occur at the end of the file by requiring at least one non-newline
  character after the blank lines.

## Find Consecutive Blank Lines

To detect consecutive blank lines in a file using `grep`, run:

```sh
grep -Pz '(?m)^[ \t]*\r?\n^[ \t]*\r?\n(?=[^\r\n])' filename
```

This command:

- Uses `-P` for Perl-compatible regular expressions.
- Uses `-z` to treat the file as a single string, enabling multi-line matches.
- Identifies consecutive blank lines that contain spaces or tabs but are not at the end of the file.

## Remove Consecutive Blank Lines Automatically

To delete consecutive blank lines while preserving a single blank line, use:

```sh
sed -Ez 's/(^[ \t]*\r?\n){2,}/\n/g' filename
```

This command:

- Uses `-E` for extended regular expressions.
- Uses `-z` to process the entire file as a single string.
- Replaces two or more consecutive blank lines with a single newline.

## Validate a File Has No Consecutive Blank Lines

To ensure that a file does not contain multiple blank lines in a row, use:

```sh
if grep -qPz '(?m)^[ \t]*\r?\n^[ \t]*\r?\n(?=[^\r\n])' filename; then
    echo "❌ Consecutive blank lines detected!"
    exit 1
else
    echo "✅ No consecutive blank lines found."
fi
```

This script:

- Checks if there are consecutive blank lines.
- Exits with an error if any are found.
