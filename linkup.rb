ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.14/linkup-0.2.14-aarch64-apple-darwin.tar.gz"
ARM_SHA = "7802ab033abc63e1434d010fb19455bf41f39c28085698ab9334c7f00bbcc7ea"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.14/linkup-0.2.14-x86_64-apple-darwin.tar.gz"
X86_SHA = "8268a486b7b9ca50d7b2e40b7f085b3240a400c6e3b01cff2d50d1519e76620d"

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
