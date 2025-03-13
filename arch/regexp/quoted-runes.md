# **Detecting Bytes or Runes Inside Double Quotes**

## Regular Expression for Detecting Characters Inside Double Quotes

To match bytes or runes that are enclosed within double quotes but not within single quotes, use the following regular
expression:

```
"(?:(?:[^"\\])|(?:\\(?:[abfnrtv'\"\\]|u[0-9A-Fa-f]{4}|U[0-9A-Fa-f]{8}|x[0-9A-Fa-f]{2})))"
```

### Explanation:

- **`"`** → Matches the opening double quote.
- **`(?:[^"\\])`** → Matches any character inside the quotes except for `"` (double quote) and `\` (backslash).
- **`|`** → Acts as an OR operator to allow alternative matching.
- **`(?:\\(?:[abfnrtv'\"\\]|u[0-9A-Fa-f]{4}|U[0-9A-Fa-f]{8}|x[0-9A-Fa-f]{2}))`** → Matches valid escape sequences:
    - **`\a \b \f \n \r \t \v`** → Common escape sequences.
    - **`\' \" \\`** → Escaped single quote, double quote, and backslash.
    - **`\uXXXX`** → Unicode escape for a 4-digit hex code.
    - **`\UXXXXXXXX`** → Unicode escape for an 8-digit hex code.
    - **`\xXX`** → Hexadecimal byte escape.

## Find Bytes or Runes Inside Double Quotes

To extract content inside double quotes using `grep`, run:

```sh
grep -oP '"(?:(?:[^"\\])|(?:\\(?:[abfnrtv\'\"\\]|u[0-9A-Fa-f]{4}|U[0-9A-Fa-f]{8}|x[0-9A-Fa-f]{2})))+"' filename
```

This command:

- Uses `-o` to return only the matching parts.
- Uses `-P` to enable Perl-compatible regular expressions.
- Captures bytes or runes enclosed in double quotes while allowing valid escape sequences.

## Validate a File Contains Only Properly Encapsulated Strings

To check if a file contains only valid double-quoted strings, use:

```sh
if grep -qP '"(?:(?:[^"\\])|(?:\\(?:[abfnrtv\'\"\\]|u[0-9A-Fa-f]{4}|U[0-9A-Fa-f]{8}|x[0-9A-Fa-f]{2})))+"' filename; then
    echo "✅ Valid double-quoted strings detected."
else
    echo "❌ No valid double-quoted strings found!"
    exit 1
fi
```

This script:

- Searches for properly formed double-quoted strings.
- Exits with an error if no valid matches are found.
