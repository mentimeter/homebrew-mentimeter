class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.7/linkup-0.0.7-aarch64-apple-darwin.tar.gz"
    sha256 "f2f5c663900b57526945ff36f52053b9aea7d35365316b5922ac93cc8880602a"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.7/linkup-0.0.7-x86_64-apple-darwin.tar.gz"
    sha256 "91a36a8943c4fbf63a33bd5c9c624c464f40525bf12c6300b1807358b6bd16af"
  end

  depends_on "cloudflared"

  def install
    bin.install 'linkup'
  end
end
