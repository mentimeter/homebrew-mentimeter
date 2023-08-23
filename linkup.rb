class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.0/linkup-0.1.0-aarch64-apple-darwin.tar.gz"
    sha256 "63056bb68ac7a4384170ea5b250de8d6022371914afbd065dd8c3789a06452e7"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.0/linkup-0.1.0-x86_64-apple-darwin.tar.gz"
    sha256 "147944dd55c3512556e44a710976d782889b20da7d7231159450a34abd809e4e"
  end

  depends_on "cloudflared"

  def install
    bin.install 'linkup'
  end
end
