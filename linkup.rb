class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.11/linkup-0.1.11-aarch64-apple-darwin.tar.gz"
    sha256 "63f36527c40138ecb87086b58f388e34dbe8546c618a0e2e1f116bedf61a621e"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.11/linkup-0.1.11-x86_64-apple-darwin.tar.gz"
    sha256 "b06a57193635dd5c399fbae59024855dbbcf2393653ab562ee20bd2bce57c8c8"
  end

  depends_on "cloudflared"
  depends_on "dnsmasq"
  depends_on "caddy"

  def install
    bin.install 'linkup'
    generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
  end
end
