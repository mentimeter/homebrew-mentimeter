ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.2/linkup-0.2.2-aarch64-apple-darwin.tar.gz"
ARM_SHA = "f334dc300f45af8191d339a8b1b00f2a906e5b4237cb881456426a6a2284a606"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.2.2/linkup-0.2.2-x86_64-apple-darwin.tar.gz"
X86_SHA = "2e67620bece159ed9716600cc4fc1a21e75e926a849f5e6cc74288d0cfebd8b4"

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
