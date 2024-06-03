ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.0/linkup-1.0.0-aarch64-apple-darwin.tar.gz"
ARM_SHA = "a59a9b122c48da841fdfa15fedd68020a620345cb7b96fd5823fdeed31827ebd"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.0/linkup-1.0.0-x86_64-apple-darwin.tar.gz"
X86_SHA = "c4ef034bfdbf094168b39713a4f403defa02baefcd2e96c5004477c5ce15ba3b"

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
