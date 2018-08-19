class Gperftools < Formula
  desc "Multi-threaded malloc() and performance analysis tools"
  homepage "https://github.com/gperftools/gperftools"
  url "https://github.com/gperftools/gperftools/releases/download/gperftools-2.7/gperftools-2.7.tar.gz"
  sha256 "1ee8c8699a0eff6b6a203e59b43330536b22bbcbe6448f54c7091e5efb0763c9"

  unless OS.mac?
    # libunwind is strongly recommended for Linux x86_64
    # https://github.com/gperftools/gperftools/blob/master/INSTALL
    depends_on "xz"

    resource "libunwind" do
      url "https://download.savannah.gnu.org/releases/libunwind/libunwind-1.2.1.tar.gz"
      sha256 "3f3ecb90e28cbe53fba7a4a27ccce7aad188d3210bb1964a923a731a27a75acb"
    end
  end

  bottle do
    cellar :any
    sha256 "ebc68c4f401b6a77f8256a5ae84054803248b0e1ef1403f879893653ffd74cee" => :mojave
    sha256 "cd47308eb2e44e527b749b392bebfa17613afacd202285e95954fa00590f44d7" => :high_sierra
    sha256 "214a23363df0fe8d64260af6e86a891d3fb01452dbd2522f6c9451b21ab6e451" => :sierra
    sha256 "a1f10be5627404a571fa448e7f3f15f522348f89f642e097ba04cd0c584d2b3b" => :el_capitan
    sha256 "497563efccf2f3ac79873d70058f8558c2d7eeb5b8af0cf670df9089b1c971cc" => :x86_64_linux
  end

  head do
    url "https://github.com/gperftools/gperftools.git"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  def install
    # Fix "error: unknown type name 'mach_port_t'"
    ENV["SDKROOT"] = MacOS.sdk_path if MacOS.version == :sierra

    if OS.mac?
      ENV.append_to_cflags "-D_XOPEN_SOURCE"
    else
      resource("libunwind").stage do
        system "./configure",
               "--prefix=#{libexec}/libunwind",
               "--disable-debug",
               "--disable-dependency-tracking"
        system "make", "install"
      end

      ENV.append_to_cflags "-I#{libexec}/libunwind/include"
      ENV["LDFLAGS"] = "-L#{libexec}/libunwind/lib"
    end

    system "autoreconf", "-fiv" if build.head?
    if OS.mac?
      system "./configure", "--disable-dependency-tracking",
                            "--prefix=#{prefix}"
    else
      system "./configure", "--disable-dependency-tracking",
                            "--prefix=#{prefix}",
                            "--enable-libunwind"
    end
    system "make"
    system "make", "install"
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <assert.h>
      #include <gperftools/tcmalloc.h>

      int main()
      {
        void *p1 = tc_malloc(10);
        assert(p1 != NULL);

        tc_free(p1);

        return 0;
      }
    EOS
    system ENV.cc, "test.c", "-L#{lib}", "-ltcmalloc", "-o", "test"
    system "./test"
  end
end
