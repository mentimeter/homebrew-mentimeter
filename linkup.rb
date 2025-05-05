MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.2.0/linkup-3.2.0-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "5cf4a6af98f8092961d76c8045d0b5dc4fdd92fbbb464fa1f5041751206ed230"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.2.0/linkup-3.2.0-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "749a6aa59a08b03292d2cbd3ba4753d826d80324a983c96147f89bac396ef55f"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.2.0/linkup-3.2.0-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "779c09e9d5412990d478c4e34106170e0e22cfd57a37b072967cb0466abfd0a7"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.2.0/linkup-3.2.0-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "89765fb0be6573e05f5542848f30445f2935ae5e929cb410fb96cfa495508a2f"

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
