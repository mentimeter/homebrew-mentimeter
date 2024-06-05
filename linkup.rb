ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.0/linkup-1.0.0-aarch64-apple-darwin.tar.gz"
ARM_SHA = "ad6b1a89ee789d0f9c1dd84990faafc4634bcaff0c39d9c366e5e1b4d3f74134"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.0/linkup-1.0.0-x86_64-apple-darwin.tar.gz"
X86_SHA = "040dd35ec314cdde4e8687d18d372ebd2323a98a9c0476ab23e4a9668d480c3c"

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
