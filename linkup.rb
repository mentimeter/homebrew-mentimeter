MAC_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.4.0/linkup-3.4.0-aarch64-apple-darwin.tar.gz"
MAC_ARM_SHA = "1a771fa74bf7008e80b5ea6466078bd8892b75c4080741e6ce0aa8f38853397f"
MAC_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.4.0/linkup-3.4.0-x86_64-apple-darwin.tar.gz"
MAC_X86_SHA = "b3005d9c85df535d37a0a8706b61f8ecf225fcc6526df5c68467970867fd6052"

LINUX_ARM_URL = "https://github.com/mentimeter/linkup/releases/download/3.4.0/linkup-3.4.0-aarch64-unknown-linux-gnu.tar.gz"
LINUX_ARM_SHA = "72cb905ae6f71ce6c71d747166d6b76e0aca9bbf4a7e6d134d332a68936f476b"
LINUX_X86_URL = "https://github.com/mentimeter/linkup/releases/download/3.4.0/linkup-3.4.0-x86_64-unknown-linux-gnu.tar.gz"
LINUX_X86_SHA = "1dc18eee6e30cf8764dda860a82d45c49e6ba79f10c26226feaa2b593936ca94"

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
