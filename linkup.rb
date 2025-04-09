MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.0.0/linkup-3.0.0-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "085f41eb6c5986233f66f1ccde7b1d4f42047a31f9b39bddb5a459ca3f6f1943"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.0.0/linkup-3.0.0-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "b51dd50e2187ee80a164cb6d7145252ca6e483780434c723a68c1f1ff228a67e"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.0.0/linkup-3.0.0-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "070593d423245fda35830795110fd81cb5c5c9b98da9eba802c5932185e788bc"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.0.0/linkup-3.0.0-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "c990580329e0e1d0bc984aa561fc617174583070414fa4ea4a1c858b6c1758fb"

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

  def install
    bin.install 'linkup'

    if OS.mac?
      generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
    end
  end
end
