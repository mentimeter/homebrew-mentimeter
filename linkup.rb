ARM_URL = "https://github.com/mentimeter/linkup/releases/download/0.1.21/linkup-0.1.21-aarch64-apple-darwin.tar.gz"
ARM_SHA = "518230f1abdd119f60e8ef21e498fa87a1528246139ae826cf3f91d75d486548"
X86_URL = "https://github.com/mentimeter/linkup/releases/download/0.1.21/linkup-0.1.21-x86_64-apple-darwin.tar.gz"
X86_SHA = "58c008602d85588bf4ea898df55c73b08367a841d4bcf782a2ef62a54900a1fd"

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
