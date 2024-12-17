ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.4.0/linkup-1.4.0-aarch64-apple-darwin.tar.gz"
ARM_SHA = "784326329fba6152c8bd3fb7a8d4bf92dfc76af579308a591893ec8c73b92ff3"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.4.0/linkup-1.4.0-x86_64-apple-darwin.tar.gz"
X86_SHA = "18c4d488320a9f211bd7cd3439d0a868796b968168a5c68698a4c3fe4ce3a2e9"

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
