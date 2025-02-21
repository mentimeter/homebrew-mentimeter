MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/2.0.0/linkup-2.0.0-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "9f2b8d23f949fdeb7af9f2a6f158dd1bfff4db079faaab0d572df4dca4c091b7"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/2.0.0/linkup-2.0.0-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "4b397836e38e9d25ca5e155a7339577e8fc751785b95be00f7b9dc1f019cec90"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/2.0.0/linkup-2.0.0-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "91f8bfbbb1301acd2d6b387f66cdcb5a7318f27a1c48e6367ce29e17b066a2b6"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/2.0.0/linkup-2.0.0-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "283a03543f00c8c6ef546abf52435eca0271137ecef39bb545c572e0e7b9875e"

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
