class Fluxterm < Formula
  desc "GPU-accelerated macOS terminal emulator built with Swift and Metal"
  homepage "https://github.com/faizal97/flux-term"
  version "0.1.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/faizal97/flux-term/releases/download/v0.1.6/FluxTerm-macos-arm64.zip"
      sha256 "d0b7ab9b3098bca03863c2e4600e905d44598616a7e9f97459fd2ac272eef8ad"
    else
      url "https://github.com/faizal97/flux-term/releases/download/v0.1.6/FluxTerm-macos-x86_64.zip"
      sha256 "baf55c54ac5b7e1aa19a4146baba60a1285c9916f5419d9db149005fabf18438"
    end
  end

  depends_on :macos
  depends_on macos: :sonoma

  def install
    bin.install "FluxTerm-arm64" => "fluxterm" if Hardware::CPU.arm?
    bin.install "FluxTerm-x86_64" => "fluxterm" unless Hardware::CPU.arm?
    bin.install "FluxTerm_FluxTerm.bundle"
  end

  test do
    assert_predicate bin/"fluxterm", :executable?
    assert_predicate bin/"FluxTerm_FluxTerm.bundle", :exist?
  end
end
