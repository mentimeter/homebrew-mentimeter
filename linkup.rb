ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.4/linkup-1.0.4-aarch64-apple-darwin.tar.gz"
ARM_SHA = "7738795c7332da343213cb1493d3ab46bd34a9ae460b647b8f1ae993908d04f5"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.0.4/linkup-1.0.4-x86_64-apple-darwin.tar.gz"
X86_SHA = "cdaec16d86c00c8d541ff4a30136de4a284a529eaa514a8834c3afb6e3413fb0"

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
