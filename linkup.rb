ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.9/linkup-0.2.9-aarch64-apple-darwin.tar.gz"
ARM_SHA = "ce8b3d1ad8a75d3b04671283e6ebec95b04728623135a0f41d3a2813ad97f8b8"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.9/linkup-0.2.9-x86_64-apple-darwin.tar.gz"
X86_SHA = "059befd0531a55a12d4d78acf5ea522a53e2f9a4ee70b3b8cde1de262535a1d2"

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
