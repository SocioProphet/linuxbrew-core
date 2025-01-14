class GitDelta < Formula
  desc "Syntax-highlighting pager for git and diff output"
  homepage "https://github.com/dandavison/delta"
  url "https://github.com/dandavison/delta/archive/0.4.0.tar.gz"
  sha256 "cae9bda3fb1b4e1adea439bb0e834d703d5925f0ace44eafa2d1b1293ae79209"
  license "MIT"
  head "https://github.com/dandavison/delta.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "9e62a85823ec58d4c6bf993f93438e36b73337df39252d4b41a1a2e9b9d910b5" => :catalina
    sha256 "76dc159a257bdac33542c3c8acd2517f2a7aba152d2ec614d17f44cb797d8360" => :mojave
    sha256 "978cdcec12f9d5deb82dd546b103c1c975bf420dfed25a699aad4994f77a29ae" => :high_sierra
    sha256 "31484c20a016268543ea29f0897e70f0a64fecf5dec392553a359925653b597e" => :x86_64_linux
  end

  depends_on "rust" => :build
  depends_on "llvm" => :build unless OS.mac?
  uses_from_macos "zlib"

  conflicts_with "delta", because: "both install a `delta` binary"

  def install
    ENV.append_to_cflags "-fno-stack-check" if DevelopmentTools.clang_build_version >= 1010
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "delta #{version}", `#{bin}/delta --version`.chomp
  end
end
