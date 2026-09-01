class TclReadline < Formula
  desc 'GNU readline for interactive Tcl shells'
  homepage 'https://github.com/flightaware/tclreadline'
  url 'https://github.com/flightaware/tclreadline/archive/refs/tags/v2.4.1.tar.gz'
  sha256 'd14b1568b6db8cd51659e3cc476a1f45da2020434ebb90b4b0defbc424f05907'
  
  depends_on "tcl-tk@8"
  depends_on "readline"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build

  def install
    system "autoreconf", "-i" # ./configure packaged in repo is broken
    system "./configure", "--prefix=#{prefix}", "--with-tcl=#{Formula["tcl-tk@8"].opt_prefix}/lib", "--with-readline-includes=#{Formula["readline"].opt_prefix}/include/readline"
    system "make"
    system "make", "install"
  end
end
