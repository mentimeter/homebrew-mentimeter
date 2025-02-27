MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/2.1.1/linkup-2.1.1-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "f228bd3c25778558ddbd6204b82f219bca7c72846c84fe9d1347877936f18754"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/2.1.1/linkup-2.1.1-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "d7ee9318894a4ec8f19720e59d2e97b6eaad29d6f9af4f20f5ca864c590a6653"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/2.1.1/linkup-2.1.1-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "5655a77b6eb9c18e54603b2bea9794dd7c2c94bc068cb50ce41fff7ca6921a90"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/2.1.1/linkup-2.1.1-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "f7937b4d0612f8af0cd03d2b834a6a3cccfc9c5718de54572b8b36c44c744dd7"

class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if OS.mac?
    if Hardware::CPU.arm?
      url MAC_ARM_URL
      sha256 MAC_ARM_SHA
    elsif Hardware::CPU.intel?
      url MAC_X86_URL
      sha256 MAC_X86_SHA
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url LINUX_ARM_URL
      sha256 LINUX_ARM_SHA
    elsif Hardware::CPU.intel?
      url LINUX_X86_URL
      sha256 LINUX_X86_SHA
    end
  end

  depends_on "cloudflared"
  depends_on "dnsmasq"
  depends_on "caddy"

  def install
    bin.install 'linkup'

    if OS.mac?
      generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
    end
  end
end
