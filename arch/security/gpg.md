# GPG Key Pair Creation Guide on Arch Linux

## 1. Generate a GPG Key Pair

Run the following command to create a GPG key pair:

```sh
gpg --full-gen-key
```

## 2. Verify That the GPG Key Was Created

Check if the key was successfully created by listing all keys:

```sh
gpg --list-keys --keyid-format=long
```

Look for a key entry containing `[SC]`, which indicates it is a signing and certification key.

## 3. Export the GPG Public Key

To display the public key in ASCII format:

```sh
gpg --export --armor KEY_ID
```

Replace `KEY_ID` with the identifier of your key found in the previous step.

## 4. Add the GPG Key to Git

If required for Git commit signing, configure Git to use the key:

```sh
git config --global user.signingkey KEY_ID
```

To ensure all commits are signed:

```sh
git config --global commit.gpgsign true
```

## Additional Notes

- Ensure that the exported key starts with `BEGIN PGP PUBLIC KEY BLOCK` and ends with `END PGP PUBLIC KEY BLOCK` before
  using it in external applications.

- If you need to verify signed commits, use:

  ```sh
  git log --show-signature -1
  ```
