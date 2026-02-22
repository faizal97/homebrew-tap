cask "fluxterm" do
  version "0.1.1"
  sha256 "cad4bf5834c4e19e9d1b13cba536163b01aa39a8446eec7b77717cc27e39fa6f"

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
