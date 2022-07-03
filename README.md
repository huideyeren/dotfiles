# dotfiles

My dotfiles.

## How to install

### macOS

```zsh
brew install chezmoi
chezmoi init --apply huideyeren
```

### Visual Studio Code Remote - Containers

`dotfiles.installCommand` must specify the path to the executable file.

`<user-settings-dir>/settings.json`:

```json
{
  "dotfiles.repository": "huideyeren/dotfiles",
  "dotfiles.targetPath": "~/dotfiles",
  "dotfiles.installCommand": "~/dotfiles/install.sh",
}
```

### Dockerfile
To save disk space, use [`--one-shot`](https://www.chezmoi.io/reference/commands/init/#-one-shot) option.

`Dockerfile`:

```dockerfile
RUN sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply --one-shot huideyeren
```

### Manual (Install with cloning)

```zsh
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply huideyeren
```

### Manual (Install after cloning)
Using the [`-S`](https://www.chezmoi.io/reference/command-line-flags/global/#-s-source-directory) option, you can install from any location.

```zsh
git clone git@github.com:huideyeren/dotfiles.git ~/dotfiles
sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply -S ~/dotfiles
```

## How to update

```zsh
chezmoi update
```
