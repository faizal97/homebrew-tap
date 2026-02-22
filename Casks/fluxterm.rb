cask "fluxterm" do
  version "0.1.2"
  sha256 "380b4c1000d1adff3e1a0439e7932a7be59bc1abba025b4507e2fc2c0b281abf"

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
