class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.13/linkup-0.0.13-aarch64-apple-darwin.tar.gz"
    sha256 "1342b182f8a642d4fa9e7b08d633a5f9db4ecbd55eb751cc9c4deb884e34fc14"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.0.13/linkup-0.0.13-x86_64-apple-darwin.tar.gz"
    sha256 "f8d1149e16dc6bfa07560615cc078690ce272971a8d141249af5824939731582"
  end

  depends_on "cloudflared"

  def install
    bin.install 'linkup'
  end
end
