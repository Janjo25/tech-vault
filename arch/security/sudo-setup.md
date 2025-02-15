# `sudo` Configuration Guide on Arch Linux

## 1. Create a New User

After installing Arch Linux, create a new user with a home directory and assign them to the `wheel` group.

```sh
useradd -m -G wheel -s /bin/bash USERNAME
```

Replace `USERNAME` with the desired username.

Set a password for the new user:

```sh
passwd USERNAME
```

## 2. Install `sudo` (If Not Installed)

If `sudo` is not installed by default, install it with:

```sh
pacman -S sudo
```

## 3. Enable `sudo` for the `wheel` Group

Edit the `sudoers` file using `visudo` to grant sudo privileges to users in the `wheel` group.

```sh
EDITOR=nano visudo
```

Find the following line:

```sh
# %wheel ALL=(ALL:ALL) ALL
```

Uncomment it by removing `#`:

```sh
%wheel ALL=(ALL:ALL) ALL
```

Save and exit (`CTRL + X`, then `Y` and `Enter`).

## 4. Switch to the New User

Exit the root session and log in as the newly created user:

```sh
exit
login USERNAME
```

## Additional Notes

- To verify that `sudo` is working, run:

  ```sh
  sudo pacman -Syu
  ```

  If prompted for a password and the command executes successfully, sudo is properly configured.

- To allow sudo usage without requiring a password, edit `visudo` again and modify:

  ```sh
  %wheel ALL=(ALL:ALL) ALL
  ```

  to:

  ```sh
  %wheel ALL=(ALL:ALL) NOPASSWD: ALL
  ```

  **Warning:** This reduces security by allowing passwordless sudo execution.
