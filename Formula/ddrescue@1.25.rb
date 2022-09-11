class DdrescueAT125 < Formula
  desc "GNU data recovery tool"
  homepage "https://www.gnu.org/software/ddrescue/ddrescue.html"
  url "https://ftp.gnu.org/gnu/ddrescue/ddrescue-1.25.tar.lz"
  mirror "https://ftpmirror.gnu.org/ddrescue/ddrescue-1.25.tar.lz"
  sha256 "ce538ebd26a09f45da67d3ad3f7431932428231ceec7a2d255f716fa231a1063"
  license "GPL-2.0"

  def install
    system "./configure", "--prefix=#{prefix}",
                          "CXX=#{ENV.cxx}"
    system "make", "install"
  end

  test do
    system bin/"ddrescue", "--force", "--size=64Ki", "/dev/zero", "/dev/null"
  end
end
