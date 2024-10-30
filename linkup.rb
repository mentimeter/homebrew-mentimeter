ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.2.1/linkup-1.2.1-aarch64-apple-darwin.tar.gz"
ARM_SHA = "5608bfca6b187c7d8c6e4f324864deab33047b53f63cb000e98d77d72fbb2f98"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.2.1/linkup-1.2.1-x86_64-apple-darwin.tar.gz"
X86_SHA = "15c324a64a22cb02e2a9b933c3ccbcef3f55614c59f3b0ef30e8915a285249a1"

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
