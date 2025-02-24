MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/2.1.0/linkup-2.1.0-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "833faa5278e2798b42f829e26a81ec03903f8348f4d02b75ce6b87936e1c0e9d"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/2.1.0/linkup-2.1.0-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "4e75f354b0f5ed0132119051714c41377588fbb943e95f729c9f6507288f679c"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/2.1.0/linkup-2.1.0-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "24ed01a296d06247af0abd7e9b13ff77ee0b518ff5b5177fe0439789adda051a"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/2.1.0/linkup-2.1.0-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "6f4e35996b8a9b1ec263f667cf2c95c5d70f2a894ef20687d706164c11b4dc44"

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
