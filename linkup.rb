MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.1.0/linkup-3.1.0-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "50c2a020a47de3db2f0bd739717adcf5b55c868a7d7970d0eff2e26672adba61"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.1.0/linkup-3.1.0-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "f3fe9445aea85f35963488bc07ed47caca56ce83866ed0b5527fec548e9936c4"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.1.0/linkup-3.1.0-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "b5f032cef52cec3eb496bf82007867e318a39368de703e081b053662d5f94c26"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.1.0/linkup-3.1.0-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "634cd59a3fcbd1171786df1dce34211ab77d56093604c43dfc39870a1edd3b02"

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
