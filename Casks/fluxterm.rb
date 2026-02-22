cask "fluxterm" do
  version "0.1.0"
  sha256 "3434ae7a4ac9fda55a1962366e716f487f567cd6b792d8046f7567384f028cc0"

  url "https://github.com/faizal97/flux-term/releases/download/v#{version}/FluxTerm.app.zip"
  name "FluxTerm"
  desc "GPU-accelerated macOS terminal emulator built with Swift and Metal"
  homepage "https://github.com/faizal97/flux-term"

  depends_on macos: ">= :sonoma"

  app "FluxTerm.app"

  zap trash: [
    "~/Library/Caches/com.faizal.fluxterm",
    "~/Library/Preferences/com.faizal.fluxterm.plist",
  ]
end
