# Homebrew cask for dreamd. The source of truth lives HERE, in the dreamd repo;
# bongofongo/homebrew-tap/Casks/dreamd.rb is generated from it by the `tap` job
# in .github/workflows/release.yml, which substitutes the three tokens below.
#
# Keep this file in the shape `brew style` wants. The tap job runs
# `brew style --fix` before committing, so any deviation is silently rewritten
# there and the generated cask stops matching this template.
#
#   brew install --cask bongofongo/tap/dreamd
cask "dreamd" do
  # Mapping the architecture to the full Rust target triple means exactly one
  # `url` line — only the checksum genuinely differs per arch, which is what
  # keeps the CI bump a three-token substitution.
  arch arm: "aarch64-apple-darwin", intel: "x86_64-apple-darwin"

  version "0.4.0"
  sha256 arm:   "2282dde3a693b6b2ae78188352d1eb116056aadc49b00c0db514e9e03719ba35",
         intel: "f5ea63a525045f5bf809b5167ff54c7830eb44dd0f8d2427f8e9265a6d0dec49"

  url "https://github.com/bongofongo/dreamd/releases/download/v#{version}/dreamd-#{version}-#{arch}.zip",
      # Required by `brew audit`: the url host differs from the homepage host.
      verified: "github.com/bongofongo/dreamd/"
  name "dreamd"
  desc "GUI markdown reader with a highlight-to-agent loop"
  homepage "https://fongo.uk/dreamd"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Must equal bundle.macOS.minimumSystemVersion in src-tauri/tauri.conf.json.
  # The bare symbol is ">= that version", not "exactly": brew resolves it to
  # "Required: macOS >= 10.15". `brew style` rewrites ">= :catalina" to this.
  depends_on macos: :catalina

  app "dreamd.app"
  # The CLI is the same executable the window runs — one binary, so the command
  # line and the app can never be different versions of each other.
  binary "#{appdir}/dreamd.app/Contents/MacOS/dreamd"

  # ~/.config/dreamd is the only thing dreamd ever writes (tenet 2). The saved
  # state is macOS writing on the app's behalf, not dreamd.
  zap trash: [
    "~/.config/dreamd",
    "~/Library/Saved Application State/com.toadmountain.dreamd.savedState",
  ]
end
