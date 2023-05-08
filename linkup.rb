class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.2/linkup-0.0.2-aarch64-apple-darwin.tar.gz"
    sha256 "ac5100e66b270ab0291211d8be33ccb6886a3ee5344608439a3e736a1d3d31cd"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.2/linkup-0.0.2-x86_64-apple-darwin.tar.gz"
    sha256 "39425d6f9386774bcab564ad30d9c4635e46e151d9ef72ebd88a3393967f36be"
  end

  depends_on "cloudflared"

  def install
    bin.install 'linkup'
  end
end
