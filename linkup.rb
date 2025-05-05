MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.2.1/linkup-3.2.1-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "b83d69da199ce2a3df03133cabb0596428d12df56cf630dccf50e56c57a37cd3"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.2.1/linkup-3.2.1-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "88a1c944f4ef6cf9eb04dc870d13de6eb509f4a6496454ae3a3512f845ab11c3"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.2.1/linkup-3.2.1-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "831b9955b98552712753a0116adc34f6aff662ab5a8e8483aa0119b279a49105"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.2.1/linkup-3.2.1-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "bb9559bb850e4a6b399f09a01aa7a217c0736dd6b48ed5407aaf8c06c7fb2914"

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
