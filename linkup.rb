MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.3.0/linkup-3.3.0-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "9ae96de02273db97b89a27cb172463e73b1f6920acbfca3c5718e4afebf8bcde"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.3.0/linkup-3.3.0-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "ec875a6885b60f8cbbf9d161ae3837411d23cc4c615f155d5101f3e3d4636621"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.3.0/linkup-3.3.0-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "cb9a54579778043ba8b3c66ec2bdd15cfd263b0ecedf649702dcdaed851471d1"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.3.0/linkup-3.3.0-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "a8ea40c41adc94366d16e0bdaa3bf43624b37947428878639eec07f6fc63e114"

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

  def install
    bin.install 'linkup'

    if OS.mac?
      generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
    end
  end
end
