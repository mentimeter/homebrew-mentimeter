ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.11/linkup-0.2.11-aarch64-apple-darwin.tar.gz"
ARM_SHA = "1548cae503eabd161e198aaded709cd54e4a14f5b0c72ae28a06715d58aa982a"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.11/linkup-0.2.11-x86_64-apple-darwin.tar.gz"
X86_SHA = "ea4c011555f818ac0d902586a14dc7101f8cb332c5dde11e0ebbc532cc6bda55"

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
