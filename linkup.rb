ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.3/linkup-0.2.3-aarch64-apple-darwin.tar.gz"
ARM_SHA = "d9b3de82eca4515b2d42c3e4bcec4e646776b65ffb44b8b86df7612973344d05"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.3/linkup-0.2.3-x86_64-apple-darwin.tar.gz"
X86_SHA = "9f43ae423a212dc9b57640b6c1d3843b3b9c8c9a1f097c97f45146abf8877509"

class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url ARM_URL
    sha256 ARM_SHA
  elsif Hardware::CPU.intel?
    url X86_URL
    sha256 X86_SHA
  end

  depends_on "cloudflared"
  depends_on "dnsmasq"
  depends_on "caddy"

  def install
    bin.install 'linkup'
    generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
  end
end
