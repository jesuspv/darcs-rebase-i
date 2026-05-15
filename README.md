# darcs-rebase-i - Git Rebase --interactive Mimic for Darcs

From `darcs-rebase-i --help`:

```
darcs-rebase-i - git rebase --interactive mimic for darcs

Usage:
  darcs-rebase-i [--autosquash] [N]  interactively rebase; N defaults to local (unpushed) patches
  darcs-rebase-i --continue          resume after an 'edit', 'exec', or 'break' pause
  darcs-rebase-i --abort           cancel rebase and restore original state
  darcs-rebase-i --status          show current rebase progress
  darcs-rebase-i --help            show this help

Options:
  --autosquash  move fixup!/squash! prefixed patches after their target automatically

Actions (in the editor):
  p, pick   <name>     use patch as-is
  r, reword <name>     use patch, but edit its commit message
  e, edit   <name>     use patch, but pause for manual amending
  s, squash <name>     combine with previous patch, editing message
  f, fixup  <name>     like squash, but discard this patch's message
  d, drop   <name>     remove this patch from history
  x, exec   <command>  run shell command
  b, break             stop here (resume with --continue)
```

# Installation

I would encourage you to install the command with
[`nix`](https://nixos.org/download/), and nix flakes in particular. In this way,
you can run it with `nix run github:jesuspv/darcs-rebase-i` or use [Home
Manager](https://github.com/nix-community/home-manager) nixpkgs overlays to have
it installed in your home, for instance.

Otherwise, copy the self-contained script `darcs-rebase-i` to some directory in
your `$PATH` and confirm you have `bash`, `coreutils` and `darcs` installed
before running.
