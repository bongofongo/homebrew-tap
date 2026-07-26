# bongofongo/homebrew-tap

Homebrew tap for [dreamd](https://github.com/bongofongo/dreamd) — a GUI markdown
reader for a tmux + Neovim + Claude Code workflow.

```sh
brew install --cask bongofongo/tap/dreamd
```

`Casks/dreamd.rb` is **generated**, not hand-written. The source of truth is
`packaging/cask.rb.tmpl` in the dreamd repo; the `tap` job in that repo's
`.github/workflows/release.yml` substitutes the version and the two per-arch
checksums and commits the result here whenever a release is published. Edit the
template there — an edit made here is overwritten by the next release.
