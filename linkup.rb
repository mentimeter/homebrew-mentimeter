ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.5.0/linkup-1.5.0-aarch64-apple-darwin.tar.gz"
ARM_SHA = "7a5e77277a6fd0673658c27f31e7cd23450d760196da713d3fbf37bcb0735ed1"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.5.0/linkup-1.5.0-x86_64-apple-darwin.tar.gz"
X86_SHA = "d203800d99086a74080a8c8a51796303a7e085a5ac50d23f6e8357757e145397"

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
