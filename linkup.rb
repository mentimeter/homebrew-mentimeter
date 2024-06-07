ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.1/linkup-1.0.1-aarch64-apple-darwin.tar.gz"
ARM_SHA = "87b5200738b7ed55f34abc814abcec3beeb7b47ca5713c3267d5c996a81c0c83"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.1/linkup-1.0.1-x86_64-apple-darwin.tar.gz"
X86_SHA = "384a2fc3b67e2d4184188344c0546fde2029ae346f86ce33414bfb15f92892ff"

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
