ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.3.0/linkup-1.3.0-aarch64-apple-darwin.tar.gz"
ARM_SHA = "56ecf6eb8093741323af024dbcfadbb932335a0c4fe30df4b249f01fa215acf6"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.3.0/linkup-1.3.0-x86_64-apple-darwin.tar.gz"
X86_SHA = "c1ce1dbd62485d5ab1e53cd326a28c3e6e7aa6bf5784bee9cd2bafb88a01644d"

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
