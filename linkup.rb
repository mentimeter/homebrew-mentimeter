ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.12/linkup-0.2.12-aarch64-apple-darwin.tar.gz"
ARM_SHA = "e677c777e75f181c6fd67775785e8d0aef640209a0f1961a5693b87be18ebaec"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.12/linkup-0.2.12-x86_64-apple-darwin.tar.gz"
X86_SHA = "1c76cc9d432947d1c6fc1317a3ecdd1ed2529dbed324d22078fdcd83a1c7af46"

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
