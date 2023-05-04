class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.1/linkup-0.0.1-aarch64-apple-darwin.tar.gz"
    sha256 "ce932fe0b644a0f7dd0f0490a22a85b3f3a7277c6797c930a129fc620ac2521c"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.1/linkup-0.0.1-x86_64-apple-darwin.tar.gz"
    sha256 "2afbeaaa0e080d8e7ef7854780729ca0f61833c27e7921288f8bdca92279d371"
  end

  depends_on "cloudflare/cloudflare/cloudflared"

  def install
    bin.install 'linkup'
  end
end
