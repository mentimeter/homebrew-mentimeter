class Linkup < Formula
  desc "Link up preview environments"
  homepage "https://github.com/mentimeter/linkup"
  license "Apache-2.0"

  if Hardware::CPU.arm?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.5/linkup-0.1.5-aarch64-apple-darwin.tar.gz"
    sha256 "6e537a3be8eaac65cc0c5a421f2472634eda86e28439f20d68ad515d9e39b30a"
  elsif Hardware::CPU.intel?
    url "https://github.com/mentimeter/linkup/releases/download/0.1.5/linkup-0.1.5-x86_64-apple-darwin.tar.gz"
    sha256 "fcf4d2ad5ce69a744de99d6e94d3f0805d35c672715aa3b3884ca51db59adf41"
  end

  depends_on "cloudflared"

  def install
    bin.install 'linkup'
    generate_completions_from_executable(bin/"linkup", "completion", shell_parameter_format: "--shell=", shells: [:bash, :zsh])
  end
end
