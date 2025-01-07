MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.5.0/linkup-1.5.0-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "7a5e77277a6fd0673658c27f31e7cd23450d760196da713d3fbf37bcb0735ed1"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.5.0/linkup-1.5.0-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "d203800d99086a74080a8c8a51796303a7e085a5ac50d23f6e8357757e145397"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/1.5.0/linkup-1.5.0-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "7d00e66674bab7407ffc5d765ff48a9121e02126559fdf446e25c11369ff0fab"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/1.5.0/linkup-1.5.0-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "e4cf746b2402be5c7f2180dea7e8669d6cd756cb1d6a13b9dd2300a37b1c3475"

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
