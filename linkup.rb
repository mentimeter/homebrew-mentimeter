ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.15/linkup-0.2.15-aarch64-apple-darwin.tar.gz"
ARM_SHA = "eec833263a2c5fa8113b7b7145d2d01aaebd3a661801787d66bd119ec5d6e6b1"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.15/linkup-0.2.15-x86_64-apple-darwin.tar.gz"
X86_SHA = "34df2febe7cc9742ecd4a11b75abcc2729e357f795f4a9df421a8fb3ace0a02b"

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
