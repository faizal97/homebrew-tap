cask "fluxterm" do
  version "0.1.3"
  sha256 "7d613405cb2f1dbcc9abd7e02c7f01d04431e9723b96e953c8fa100097c07e87"

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
