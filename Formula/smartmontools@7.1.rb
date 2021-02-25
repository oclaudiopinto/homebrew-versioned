class SmartmontoolsAT71 < Formula
  desc "SMART hard drive monitoring"
  homepage "https://www.smartmontools.org/"
  url "https://downloads.sourceforge.net/project/smartmontools/smartmontools/7.1/smartmontools-7.1.tar.gz"
  sha256 "3f734d2c99deb1e4af62b25d944c6252de70ca64d766c4c7294545a2e659b846"
  license "GPL-2.0"

  livecheck do
    url :stable
  end

  def install
    (var/"run").mkpath
    (var/"lib/smartmontools").mkpath

    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--sbindir=#{bin}",
                          "--sysconfdir=#{etc}",
                          "--localstatedir=#{var}",
                          "--with-savestates",
                          "--with-attributelog"
    system "make", "install"
  end

  test do
    system "#{bin}/smartctl", "--version"
    system "#{bin}/smartd", "--version"
  end
end
