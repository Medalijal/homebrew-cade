class Cade < Formula
  desc "Local, provider-agnostic orchestrator for AI coding workflows"
  homepage "https://github.com/Medalijal/cade"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Medalijal/cade/releases/download/v0.1.0/cade_0.1.0_darwin_arm64.tar.gz"
      sha256 "92ec6b7bd2359ccaf7a1568119b5d6fb738ed1e68953e7fa68a3488881dec9d0"
    else
      url "https://github.com/Medalijal/cade/releases/download/v0.1.0/cade_0.1.0_darwin_amd64.tar.gz"
      sha256 "b74a402cf4f9579b8086f96006f2951d081fb163c1a45428fd84c3476eff679f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Medalijal/cade/releases/download/v0.1.0/cade_0.1.0_linux_arm64.tar.gz"
      sha256 "c5a96db345a03b3d39366058a4d56876e76212dc95f6b6cb74e6bc4f01210f09"
    else
      url "https://github.com/Medalijal/cade/releases/download/v0.1.0/cade_0.1.0_linux_amd64.tar.gz"
      sha256 "fdb3bdee87826513e21991ee5922658f4a99be8214f149dffa7c769076a3132c"
    end
  end

  def install
    bin.install "cade"
  end

  test do
    (testpath/"config.json").write <<~JSON
      {"version":1,"accounts":{"test":{"provider":"codex","config_home":"#{testpath}","max_concurrency":1}}}
    JSON
    system bin/"cade", "config", "validate", "config.json"
  end
end
