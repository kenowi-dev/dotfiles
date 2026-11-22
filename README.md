# Kenowi’s Dotfiles

These are the dotfiles of @kenowi-dev, managed with [chezmoi](https://chezmoi.io).

## Fresh install (macOS)

### 1. Install the prerequisites

```shell
# Homebrew, see https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# chezmoi
brew install chezmoi
```

### 2. Apply the dotfiles

```shell
chezmoi init --apply kenowi-dev
```

On the first run a `run_once_before` script installs everything in
`~/.config/homebrew/Brewfile`, including 1Password and the 1Password CLI. It may
prompt for your password to install the casks.

Git commit signing is skipped during this first run, and chezmoi prints a
warning: the signing key is read from 1Password, which is not set up yet.
Finish the next step, then re-apply.

### 3. Set up 1Password

1. Open and unlock 1Password and sign in to the account configured in
   `.chezmoidata.toml` (`my.1password.eu`).
2. **Settings → Developer**:
    - Turn on **Integrate with 1Password CLI**.
    - Turn on **Use the SSH agent**.
3. **Settings → General**: turn on **Keep 1Password in the menu bar**.
4. Optional: turn on Touch ID (under **Settings → Security**) to approve CLI
   requests with your fingerprint.
5. Verify that the CLI can reach the app:

    ```shell
    op vault list --account my.1password.eu
    ```

    If this reports `No accounts configured for use with 1Password CLI` on
    macOS 27 (Golden Gate), macOS is blocking your terminal from reading
    1Password data. Go to **System Settings → Privacy & Security → Files &
    Folders**, select your terminal (iTerm, Zed, …) and turn on **Data shared by
    1Password**. If the entry is not listed, run the command and click **Allow**
    when macOS prompts you, then quit and reopen the terminal.

### 4. Re-apply

```shell
chezmoi apply
```

This reads the public half of the SSH signing key from
`op://Private/GitHub Signing Key/public key` and writes
`~/.config/git/config` plus `~/.config/git/allowed_signers`. It also writes
`~/.ssh/config` and `~/.config/1Password/ssh/agent.toml`, which makes all SSH
clients use the 1Password SSH agent.

### 5. Verify

```shell
# SSH uses the 1Password agent
ssh -T git@github.com

# Signed commit
cd "$(mktemp -d)" && git init -q && git commit --allow-empty -S -m test
git log --show-signature -1
```

## Configuration

Identity and 1Password references live in `.chezmoidata.toml`:

- `git.name`, `git.email` – commit identity.
- `git.signingKeyRef` – `op://` reference to the signing key's public key.
- `onepassword.account` – 1Password account used by `op` and the SSH agent.

## Caveats

- Currently only macOS systems are supported.
- Rendering `~/.config/git/config` reads from 1Password, so 1Password must be
  installed, unlocked, and signed in for `chezmoi apply`, `diff`, and `status`.
  If the `op` CLI is missing entirely, the signing settings are skipped with a
  warning and applied on a later run.
- The 1Password SSH agent only offers keys from the vault configured in
  `~/.config/1Password/ssh/agent.toml` (currently the `Private` vault).
- `~/.config/git` and `~/.config/1Password` are managed with `exact_`: any
  file in those directories that chezmoi does not manage is deleted on
  `chezmoi apply`. Add machine-local Git config to the repo (or keep it
  outside these directories) rather than dropping it into `~/.config/git`.
- The dotfiles configuration does **not** install Homebrew itself.
