#!/usr/bin/perl
use strict;
use warnings;
use MIME::Base64 qw /encode_base64/;
use GD::Barcode::QRcode;

my $str = 'Hello World';
my $options = {
  ECC => 'H',
  Version => 2,
  ModuleSize => 5,
};
my $png = GD::Barcode::QRcode->new($str, $options)->plot->png;
my $png_base64 = encode_base64($png);

my $html = <<EOS;
<html>
<body>
  <img src="data:image/png;base64,$png_base64" />
</body>
</html>
EOS

print $html;
